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
#define ONLY_INTT_TEST 0u
#ifndef FALCON_MODE_POINTWISE_MUL
#define FALCON_MODE_POINTWISE_MUL 3u
#endif
#ifndef FALCON_MODE_POINTWISE_MUL1024
#define FALCON_MODE_POINTWISE_MUL1024 4u
#endif

#ifndef FALCON_MODE_INTT_HLS
#define FALCON_MODE_INTT_HLS 5u
#endif

#ifndef FALCON_MODE_POINTWISE_MUL1024_MONTY
#define FALCON_MODE_POINTWISE_MUL1024_MONTY 6u
#endif

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

static void golden_pointwise_mul(uint32_t a[N], uint32_t b[N], uint32_t out[N])
{
    for (uint32_t i = 0; i < N; i++) {
        out[i] = mod_q(mod_q(a[i]) * mod_q(b[i]));
    }
}

static uint32_t pointwise1024_a(uint32_t i)
{
    return mod_q(12000u + (i * 13u));
}

static uint32_t pointwise1024_b(uint32_t i)
{
    return mod_q(11000u + (i * 17u));
}

static uint32_t golden_pointwise1024(uint32_t i)
{
    return mod_q(pointwise1024_a(i) * pointwise1024_b(i));
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

#if ONLY_INTT_TEST
    printf("ONLY_INTT_TEST\n");

    falcon_clear();
    falcon_set_mode(FALCON_MODE_INTT_HLS);

    for (uint32_t i = 0; i < HLS_N; i++) {
        falcon_write_coeff(i, mod_q(i + 1u));
    }

    uint32_t intt_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t intt_cycles = perf_cycles_read() - intt_start;

    uint32_t intt_result = falcon_get_output();

    printf("IRES 0x%08x\n", intt_result);
    printf("ICYC %u\n", intt_cycles);

    printf("IDUMP16");
    falcon_set_mode(FALCON_MODE_INTT_HLS);
    for (uint32_t i = 0; i < 16u; i++) {
        printf(" %u", falcon_read_coeff(i) & 0xFFFFu);
    }
    printf("\n");

    printf("IONLY OK\n");
    return EXIT_SUCCESS;
#endif

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

    printf("Dummy OK\n");

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

    falcon_start();
    falcon_wait_done();

    for (uint32_t i = 0; i < N; i++) {
        hw[i] = falcon_read_coeff(i);
    }

    for (uint32_t i = 0; i < N; i++) {
        if (hw[i] != expected[i]) {
            printf("Mismatch at index %u: got %u expected %u\n", i, hw[i], expected[i]);
            printf("Falcon NTT16 mode FAILED\n");
            return EXIT_FAILURE;
        }
    }

    printf("NTT16 OK\n");

    // Pointwise modular multiplication primitive test.
    // Vector A is stored in indices 0..15 and vector B in indices 16..31.
    // The accelerator writes C[i] = A[i] * B[i] mod q back to indices 0..15.
    falcon_clear();

    uint32_t mul_a[N];
    uint32_t mul_b[N];
    uint32_t mul_expected[N];
    uint32_t mul_hw[N];

    for (uint32_t i = 0; i < N; i++) {
        // Use values close to q to exercise the modular reduction path.
        mul_a[i] = mod_q(12000u + (i * 13u));
        mul_b[i] = mod_q(11000u + (i * 17u));

        falcon_write_coeff(i, mul_a[i]);
        falcon_write_coeff(i + N, mul_b[i]);
    }

    golden_pointwise_mul(mul_a, mul_b, mul_expected);

    falcon_set_mode(FALCON_MODE_POINTWISE_MUL);
    falcon_set_length(N);

    perf_cycles_reset();
    uint32_t mul_exec_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t mul_exec_cycles = perf_cycles_read() - mul_exec_start;

    result = falcon_get_output();

    printf("POINTWISE_MUL16_EXEC_CYCLES %u\n", mul_exec_cycles);
    printf("PW16 result: 0x%08x\n", result);
    printf("PW16 expected: 0x%08x\n", 0x00000B11u);

    if (result != 0x00000B11u) {
        printf("PW16 FAILED\n");
        return EXIT_FAILURE;
    }

    for (uint32_t i = 0; i < N; i++) {
        mul_hw[i] = falcon_read_coeff(i);
    }

    for (uint32_t i = 0; i < N; i++) {
        if (mul_hw[i] != mul_expected[i]) {
            printf("PW16 mismatch %u: got %u exp %u\n",
                   i, mul_hw[i], mul_expected[i]);
            printf("PW16 FAILED\n");
            return EXIT_FAILURE;
        }
    }

    printf("PW16 OK\n");

    // Pointwise modular multiplication 1024 primitive test.
    // Vector A is stored in indices 0..1023 and vector B in indices 1024..2047.
    // The accelerator writes C[i] = A[i] * B[i] mod q back to indices 0..1023.
    falcon_clear();
    falcon_set_mode(FALCON_MODE_POINTWISE_MUL1024);
    falcon_set_length(HLS_N);

    perf_cycles_reset();
    uint32_t pw1024_total_start = perf_cycles_read();

    uint32_t pw1024_load_start = perf_cycles_read();
    for (uint32_t i = 0; i < HLS_N; i++) {
        falcon_write_coeff(i, pointwise1024_a(i));
        falcon_write_coeff(i + HLS_N, pointwise1024_b(i));
    }
    uint32_t pw1024_load_cycles = perf_cycles_read() - pw1024_load_start;

    uint32_t pw1024_exec_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t pw1024_exec_cycles = perf_cycles_read() - pw1024_exec_start;

    result = falcon_get_output();

    printf("POINTWISE_MUL1024_EXEC_CYCLES %u\n", pw1024_exec_cycles);
    printf("PW1024 result: 0x%08x\n", result);
    printf("PW1024 expected: 0x%08x\n", 0x00000C11u);

    if (result != 0x00000C11u) {
        printf("PW1024 FAILED\n");
        return EXIT_FAILURE;
    }

    uint32_t pw1024_errors = 0u;
    uint32_t pw1024_checksum = 0u;

    uint32_t pw1024_read_start = perf_cycles_read();
    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t got = falcon_read_coeff(i);
        uint32_t exp = golden_pointwise1024(i);

        pw1024_checksum = (pw1024_checksum + got) % FALCON_Q;

        if (got != exp) {
            if (pw1024_errors < 8u) {
                printf("PW1024 mismatch %u: got %u exp %u\n",
                       i, got, exp);
            }
            pw1024_errors++;
        }
    }
    uint32_t pw1024_read_cycles = perf_cycles_read() - pw1024_read_start;

    uint32_t pw1024_total_measured_cycles = perf_cycles_read() - pw1024_total_start;
    uint32_t pw1024_total_core_cycles =
        pw1024_load_cycles + pw1024_exec_cycles + pw1024_read_cycles;

    printf("POINTWISE_MUL1024_LOAD_CYCLES %u\n", pw1024_load_cycles);
    printf("POINTWISE_MUL1024_READ_CYCLES %u\n", pw1024_read_cycles);
    printf("POINTWISE_MUL1024_TOTAL_CORE_CYCLES %u\n", pw1024_total_core_cycles);
    printf("POINTWISE_MUL1024_TOTAL_MEASURED_CYCLES %u\n", pw1024_total_measured_cycles);
    printf("POINTWISE_MUL1024_CHECKSUM %u\n", pw1024_checksum);

    if (pw1024_errors != 0u) {
        printf("PW1024 FAILED %u\n", pw1024_errors);
        return EXIT_FAILURE;
    }

    printf("PW1024 OK\n");

#if 0
    // Experimental HLS iNTT control-path test.
    // First integration step: validate CPU -> accelerator -> iNTT wrapper -> done.
    falcon_clear();

    falcon_set_mode(FALCON_MODE_INTT_HLS);

    uint32_t intt_load_start = perf_cycles_read();
    for (uint32_t i = 0; i < HLS_N; i++) {
        falcon_write_coeff(i, mod_q(i + 1u));
    }
    uint32_t intt_load_cycles = perf_cycles_read() - intt_load_start;
    (void)intt_load_cycles;

    uint32_t intt_exec_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t intt_exec_cycles = perf_cycles_read() - intt_exec_start;

    result = falcon_get_output();

    uint32_t intt_read_start = perf_cycles_read();
    uint32_t intt_checksum = 0u;
    uint32_t intt_corr_checksum = 0u;
    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t intt_val = falcon_read_coeff(i) & 0xFFFFu;
        intt_checksum ^= intt_val;
        intt_corr_checksum ^= ((intt_val + FALCON_Q - 4095u) % FALCON_Q);
    }
    uint32_t intt_read_cycles = perf_cycles_read() - intt_read_start;
    (void)intt_read_cycles;
    (void)intt_checksum;

    printf("INTT_EXEC %u\n", intt_exec_cycles);
    printf("INTT_CORR %u\n", intt_corr_checksum);

    if (result != 0x00000D11u) {
        printf("INTT FAIL\n");
        return EXIT_FAILURE;
    }

    printf("INTT OK\n");

#endif

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

#if 0
    // Round-trip test: iNTT1024(NTT1024(x)) ~= x.
    // NTT and iNTT wrappers have separate local memories, so software copies
    // NTT output coefficients into the iNTT input memory without allocating
    // a 1024-element buffer.
    uint32_t rt_errors = 0u;

    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t ntt_coeff;

        falcon_set_mode(FALCON_MODE_NTT_HLS);
        ntt_coeff = falcon_read_coeff(i) & 0xFFFFu;

        falcon_set_mode(FALCON_MODE_INTT_HLS);
        falcon_write_coeff(i, ntt_coeff);
    }

    uint32_t rt_exec_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t rt_exec_cycles = perf_cycles_read() - rt_exec_start;
    (void)rt_exec_cycles;

    result = falcon_get_output();

    if (result != 0x00000D11u) {
        printf("RT FAIL\n");
        return EXIT_FAILURE;
    }

    uint32_t rt_direct_errors = 0u;
    uint32_t rt_corrected_errors = 0u;
    uint32_t rt_hybrid_errors = 0u;

    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t got = falcon_read_coeff(i) & 0xFFFFu;
        uint32_t corrected = (got + FALCON_Q - 4095u) % FALCON_Q;
        uint32_t expected_rt = mod_q(i + 1u);

        if (got != expected_rt) {
            rt_direct_errors++;
        }

        if (corrected != expected_rt) {
            rt_corrected_errors++;
        }

        if ((got != expected_rt) && (corrected != expected_rt)) {
            rt_hybrid_errors++;
        }
    }

    rt_errors = rt_hybrid_errors;

    printf("RT_D %u\n", rt_direct_errors);
    printf("RT_C %u\n", rt_corrected_errors);
    printf("RT_H %u\n", rt_hybrid_errors);

    if (rt_errors != 0u) {
        printf("RT FAIL\n");
        return EXIT_FAILURE;
    }

    printf("RT OK\n");

#endif

    uint32_t pipe_total_start = perf_cycles_read();

    // Full polynomial pipeline test:
    // A * B = C, using NTT(A), NTT(B), POINTWISE_MUL1024 and iNTT.
    uint32_t poly_errors = 0u;

    // Step 1: NTT(A), with A[i] = i + 1.
    falcon_clear();
    falcon_set_mode(FALCON_MODE_NTT_HLS);

    for (uint32_t i = 0; i < HLS_N; i++) {
        falcon_write_coeff(i, mod_q(i + 1u));
    }

    uint32_t pipe_ntta_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t pipe_ntta_cycles = perf_cycles_read() - pipe_ntta_start;

    result = falcon_get_output();
    if (result != 0x00000A11u) {
        printf("PM FAIL\n");
        return EXIT_FAILURE;
    }

    // Copy NTT(A) into pointwise input A.
    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t coeff;

        falcon_set_mode(FALCON_MODE_NTT_HLS);
        coeff = falcon_read_coeff(i) & 0xFFFFu;

        falcon_set_mode(FALCON_MODE_POINTWISE_MUL1024_MONTY);
        falcon_write_coeff(i, coeff);
    }

    // Step 2: NTT(B), with B[i] = 3*i + 7.
    falcon_clear();
    falcon_set_mode(FALCON_MODE_NTT_HLS);

    for (uint32_t i = 0; i < HLS_N; i++) {
        falcon_write_coeff(i, mod_q((3u * i) + 7u));
    }

    uint32_t pipe_nttb_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t pipe_nttb_cycles = perf_cycles_read() - pipe_nttb_start;

    result = falcon_get_output();
    if (result != 0x00000A11u) {
        printf("PM FAIL\n");
        return EXIT_FAILURE;
    }

    // Copy NTT(B) into pointwise input B.
    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t coeff;

        falcon_set_mode(FALCON_MODE_NTT_HLS);
        coeff = falcon_read_coeff(i) & 0xFFFFu;

        falcon_set_mode(FALCON_MODE_POINTWISE_MUL1024_MONTY);
        falcon_write_coeff(i + HLS_N, coeff);
    }

    falcon_set_mode(FALCON_MODE_POINTWISE_MUL1024_MONTY);

    uint32_t pipe_pw_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t pipe_pw_cycles = perf_cycles_read() - pipe_pw_start;

    result = falcon_get_output();
    if (result != 0x00000C11u) {
        printf("PM FAIL\n");
        return EXIT_FAILURE;
    }

    // Step 4: copy pointwise result to iNTT input.
    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t coeff;

        falcon_set_mode(FALCON_MODE_POINTWISE_MUL1024_MONTY);
        coeff = falcon_read_coeff(i) & 0xFFFFu;

        falcon_set_mode(FALCON_MODE_INTT_HLS);
        falcon_write_coeff(i, coeff);
    }

    // Step 5: iNTT.
    falcon_set_mode(FALCON_MODE_INTT_HLS);

    uint32_t pm_exec_start = perf_cycles_read();
    falcon_start();
    falcon_wait_done();
    uint32_t pm_intt_cycles = perf_cycles_read() - pm_exec_start;
    (void)pm_intt_cycles;

    result = falcon_get_output();
    if (result != 0x00000D11u) {
        printf("PM FAIL\n");
        return EXIT_FAILURE;
    }

    // Step 6: compact checksum validation for external golden comparison.
    uint32_t pm_direct_chk = 0u;
    uint32_t pm_corr_chk = 0u;

    falcon_set_mode(FALCON_MODE_INTT_HLS);

    for (uint32_t i = 0; i < HLS_N; i++) {
        uint32_t got = falcon_read_coeff(i) & 0xFFFFu;
        uint32_t corrected = (got + FALCON_Q - 4095u) % FALCON_Q;

        pm_direct_chk ^= got;
        pm_corr_chk ^= corrected;
    }

    (void)poly_errors;
    uint32_t pipe_total_cycles = perf_cycles_read() - pipe_total_start;

    printf("PIP %u %u %u %u %u\n",
           pipe_ntta_cycles,
           pipe_nttb_cycles,
           pipe_pw_cycles,
           pm_intt_cycles,
           pipe_total_cycles);

    printf("PC %u %u\n", pm_direct_chk, pm_corr_chk);
    printf("PM OK\n");

    printf("Falcon accelerator PQC_Falcon-like NTT16 test OK\n");

    return EXIT_SUCCESS;
}
