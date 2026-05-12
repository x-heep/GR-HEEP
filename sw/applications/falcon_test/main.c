#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "falcon.h"

#define FALCON_Q   12289u
#define FALCON_Q0I 12287u
#define LOGN       4u
#define N          16u

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

    for (uint32_t i = 0; i < N; i++) {
        falcon_write_coeff(i, i + 1u);
    }

    printf("HLS NTT first 16 coeffs before:");
    for (uint32_t i = 0; i < N; i++) {
        printf(" %u", falcon_read_coeff(i) & 0xFFFFu);
    }
    printf("\n");

    printf("Falcon HLS NTT control mode start\n");

    falcon_start();

    if (falcon_wait_done_timeout(2000000u) != 0) {
        printf("Falcon HLS NTT control mode TIMEOUT\n");
        return EXIT_FAILURE;
    }

    result = falcon_get_output();

    printf("HLS NTT control result:   0x%08x\n", result);
    printf("HLS NTT control expected: 0x00000a11\n");

    if (result != 0x00000A11u) {
        printf("Falcon HLS NTT control mode FAILED\n");
        return EXIT_FAILURE;
    }

    printf("Falcon HLS NTT control mode OK\n");

    printf("HLS NTT first 16 words:");
    for (uint32_t i = 0; i < N; i++) {
        printf(" %u", falcon_read_coeff(i));
    }
    printf("\n");

    printf("HLS NTT first 16 coeffs:");
    for (uint32_t i = 0; i < N; i++) {
        printf(" %u", falcon_read_coeff(i) & 0xFFFFu);
    }
    printf("\n");

    printf("Falcon accelerator PQC_Falcon-like NTT16 test OK\n");

    return EXIT_SUCCESS;
}
