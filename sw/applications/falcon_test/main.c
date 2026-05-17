#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "falcon.h"
#include "csr.h"
#include "csr_registers.h"

#define FALCON_Q   12289u
#define FALCON_Q0I 12287u
#define LOGN       4u
#define N          16u
#define HLS_LOGN   10u
#define HLS_N      1024u
#define HLS_FULL_OUTPUT 0u

static void perf_cycles_reset(void)
{
    uint32_t dummy;

    CSR_SET_BITS(CSR_REG_MCOUNTINHIBIT, 0x1u);
    CSR_WRITE(CSR_REG_MCYCLE, 0u);
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1u);

    CSR_READ(CSR_REG_MCYCLE, &dummy);
    (void)dummy;
}

static uint32_t perf_cycles_read(void)
{
    uint32_t cycles;

    CSR_READ(CSR_REG_MCYCLE, &cycles);
    return cycles;
}


static const uint32_t GMb[16] = {
    4091u, 7888u, 11060u, 11208u,
    6960u, 4342u, 6275u, 9759u,
    1591u, 6399u, 9477u, 5266u,
    586u, 5825u, 7538u, 9710u
};

static uint32_t mod_q(uint32_t x)
{
    return x % FALCON_Q;
}

static uint32_t mq_add(uint32_t a, uint32_t b)
{
    uint32_t tmp = a + b - FALCON_Q;
    tmp += FALCON_Q & -(tmp >> 31);
    return tmp;
}

static uint32_t mq_sub(uint32_t a, uint32_t b)
{
    uint32_t tmp = a - b;
    tmp += FALCON_Q & -(tmp >> 31);
    return tmp;
}

static uint32_t mq_montymul(uint32_t x, uint32_t y)
{
    uint32_t tmp2;
    uint32_t tmp1;

    tmp2 = x * y;
    tmp1 = ((tmp2 * FALCON_Q0I) & 0xFFFFu) * FALCON_Q;
    tmp2 = (tmp2 + tmp1) >> 16;
    tmp2 -= FALCON_Q;
    tmp2 += FALCON_Q & -(tmp2 >> 31);

    return tmp2;
}

static void golden_mq_ntt(uint32_t a[N])
{
    uint32_t n;
    uint32_t t;
    uint32_t m;

    n = 1u << LOGN;
    t = n;

    for (m = 1; m < n; m <<= 1) {
        uint32_t ht = t >> 1;

        for (uint32_t i = 0, j1 = 0; i < m; i++, j1 += t) {
            uint32_t s = GMb[m + i];
            uint32_t j2 = j1 + ht;

            for (uint32_t j = j1; j < j2; j++) {
                uint32_t u = a[j];
                uint32_t v = mq_montymul(a[j + ht], s);

                a[j]      = mq_add(u, v);
                a[j + ht] = mq_sub(u, v);
            }
        }

        t = ht;
    }
}

static void print_vec(const char *name, uint32_t v[N])
{
    printf("%s:", name);
    for (uint32_t i = 0; i < N; i++) {
        printf(" %u", v[i]);
    }
    printf("\n");
}

static int falcon_wait_done_timeout(uint32_t timeout)
{
    while (timeout > 0u) {
        if (falcon_is_done()) {
            return 0;
        }
        timeout--;
    }

    return -1;
}

int main(void)
{
    uint32_t input = 0x12345678u;
    uint32_t expected_dummy = input ^ 0xFA1C0F00u;
    uint32_t result = 0;

    uint32_t input_vec[N] = {
        1u, 2u, 3u, 4u,
        5u, 6u, 7u, 8u,
        9u, 10u, 11u, 12u,
        13u, 14u, 15u, 16u
    };

    uint32_t expected[N];
    uint32_t hw[N];

    printf("Falcon accelerator PQC_Falcon-like NTT16 test\n");

    // Dummy mode test
    falcon_clear();

    falcon_set_mode(FALCON_MODE_DUMMY);
    falcon_set_input(input);

    printf("Dummy mode input written: 0x%08x\n", input);

    falcon_start();
    falcon_wait_done();

    result = falcon_get_output();

    printf("Dummy result:   0x%08x\n", result);
    printf("Dummy expected: 0x%08x\n", expected_dummy);

    if (result != expected_dummy) {
        printf("Falcon dummy mode FAILED\n");
        return EXIT_FAILURE;
    }

    printf("Falcon dummy mode OK\n");

    // Falcon-like NTT16 mode test
    falcon_clear();

    for (uint32_t i = 0; i < N; i++) {
        input_vec[i] = mod_q(input_vec[i]);
        expected[i] = input_vec[i];
        falcon_write_coeff(i, input_vec[i]);
    }

    golden_mq_ntt(expected);

    falcon_set_mode(FALCON_MODE_NTT);
    falcon_set_logn(LOGN);
    falcon_set_length(N);

    print_vec("NTT16 input", input_vec);

    falcon_start();
    falcon_wait_done();

    for (uint32_t i = 0; i < N; i++) {
        hw[i] = falcon_read_coeff(i);
    }

    print_vec("NTT16 result  ", hw);
    print_vec("NTT16 expected", expected);

    for (uint32_t i = 0; i < N; i++) {
        if (hw[i] != expected[i]) {
            printf("Mismatch at index %u: got %u expected %u\n", i, hw[i], expected[i]);
            printf("Falcon NTT16 mode FAILED\n");
            return EXIT_FAILURE;
        }
    }

    printf("Falcon NTT16 mode OK\n");

    // Experimental HLS NTT control-path test.
    // This validates CPU -> falcon_accelerator -> HLS wrapper control flow.
    // It does not yet validate the mathematical NTT1024 result.
    falcon_clear();

    falcon_set_mode(FALCON_MODE_NTT_HLS);

    uint32_t hls_load_cycles;
    uint32_t hls_exec_cycles;
    uint32_t hls_read_cycles;
    uint32_t hls_total_cycles;

    perf_cycles_reset();
    uint32_t hls_total_start = perf_cycles_read();

    uint32_t hls_load_start = perf_cycles_read();
    for (uint32_t i = 0; i < HLS_N; i++) {
        falcon_write_coeff(i, mod_q(i + 1u));
    }
    hls_load_cycles = perf_cycles_read() - hls_load_start;

    printf("HLS NTT first 16 coeffs before:");
    for (uint32_t i = 0; i < N; i++) {
        printf(" %u", falcon_read_coeff(i) & 0xFFFFu);
    }
    printf("\n");

    printf("Falcon HLS NTT1024 mode start\n");

    uint32_t hls_exec_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    hls_exec_cycles = perf_cycles_read() - hls_exec_start;

    result = falcon_get_output();

    uint32_t hls_read_start = perf_cycles_read();
    for (uint32_t i = 0; i < HLS_N; i++) {
        volatile uint32_t got = falcon_read_coeff(i) & 0xFFFFu;
        (void)got;
    }
    hls_read_cycles = perf_cycles_read() - hls_read_start;

    hls_total_cycles = perf_cycles_read() - hls_total_start;

    uint32_t hls_total_core_cycles = hls_load_cycles + hls_exec_cycles + hls_read_cycles;

    printf("HLS_NTT1024_LOAD_CYCLES %u\n", hls_load_cycles);
    printf("HLS_NTT1024_EXEC_CYCLES %u\n", hls_exec_cycles);
    printf("HLS_NTT1024_READ_CYCLES %u\n", hls_read_cycles);
    printf("HLS_NTT1024_TOTAL_CORE_CYCLES %u\n", hls_total_core_cycles);
    printf("HLS_NTT1024_TOTAL_MEASURED_CYCLES %u\n", hls_total_cycles);

    printf("HLS NTT control result:   0x%08x\n", result);
    printf("HLS NTT control expected: 0x%08x\n", 0x00000A11u);

    if (result != 0x00000A11u) {
        printf("Falcon HLS NTT control mode FAILED\n");
        return EXIT_FAILURE;
    }

    uint32_t hls_checksum = 0u;

    for (uint32_t i = 0; i < HLS_N; i++) {
        hls_checksum = (hls_checksum + (falcon_read_coeff(i) & 0xFFFFu)) % FALCON_Q;
    }

    printf("HLS_NTT1024_CHECKSUM %u\n", hls_checksum);

#if HLS_FULL_OUTPUT
    printf("HLS_NTT1024_OUTPUT_BEGIN\n");
    for (uint32_t i = 0; i < HLS_N; i++) {
        printf("%u %u\n", i, falcon_read_coeff(i) & 0xFFFFu);
    }
    printf("HLS_NTT1024_OUTPUT_END\n");
#else
    printf("HLS_NTT1024_OUTPUT_SKIPPED_FOR_PERFORMANCE\n");
#endif

    printf("Falcon HLS NTT1024 mode produced output\n");

    printf("Falcon accelerator PQC_Falcon-like NTT16 test OK\n");

    return EXIT_SUCCESS;
}
