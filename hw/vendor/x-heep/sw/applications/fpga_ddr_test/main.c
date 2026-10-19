// Copyright (C) 2026 EPFL.
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// File: main.c
// Author: Mohammad Hossein Nikkhah
// Description: Application that reads words from the PS DDR window through X-HEEP's external slave range.

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "core_v_mini_mcu.h"
#include "timer_sdk.h"



#define DDR_AXI_WINDOW_BASE EXT_SLAVE_START_ADDRESS

// Read the first 16 32-bit words available in the generated external range.
#define DDR_READ_WORDS 32

// #define DDR_START_ADDRESS (DDR_AXI_WINDOW_BASE + 100)
// #define XHEEP_DDR_ADDR ((uint32_t)DDR_START_ADDRESS)


typedef struct 
{
    uint32_t magic;
    uint32_t ddr_offset_bytes;
    uint32_t expected_values[DDR_READ_WORDS];
    uint32_t footer;
} ddr_test_t;

__attribute__((section(".patchable_config"), used, aligned(4)))
volatile ddr_test_t fpga_ddr_config = {
    .magic = 0x43524444u,      // bytes: "DDRC"
    .ddr_offset_bytes = 100u,
    .expected_values = {0},
    .footer = 0x454E4444u,
};



uint32_t random_u32(uint32_t rng_state)
{
    uint32_t x = rng_state;

    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;

    rng_state = x;
    return x;
}

int main(void)
{
    uint32_t ddr_offset = fpga_ddr_config.ddr_offset_bytes;
    uint32_t ddr_start = EXT_SLAVE_START_ADDRESS + ddr_offset;
    volatile uint32_t *ddr = (volatile uint32_t *)(uintptr_t)DDR_AXI_WINDOW_BASE;


    printf("X-HEEP DDR read test\n");
    printf("X-HEEP DDR base address:  0x%08x\n", EXT_SLAVE_START_ADDRESS);
    printf("X-HEEP DDR window offset: 0x%08x\n", ddr_offset);
    printf("X-HEEP DDR window base:   0x%08x\n", ddr_start);
    printf("R/W %u words at 0x%08x:\n", (unsigned)DDR_READ_WORDS, ddr_start);

    if (fpga_ddr_config.magic != 0x43524444u) {
        printf("ERROR : invalid DDR config magic 0x%08x", fpga_ddr_config.magic);
        return 1;
    }

    /* ------------------------------ TEST 1  ------------------------------*/
    printf("\n### TEST 1 : PS WRITE / Xheep READ ###\n");

    uint32_t xheep_addr = ddr_offset;
    uint32_t value = 0;
    for (uint32_t  i = 0; i < DDR_READ_WORDS; i++) {
        xheep_addr = ddr_offset + (i << 2);
        value = *(volatile uint32_t *)(uintptr_t)(DDR_AXI_WINDOW_BASE + xheep_addr);

        if (value != fpga_ddr_config.expected_values[i]) {
            printf("ERROR : READ X-HEEP[0x%08x] = 0x%08x. Expected 0x%08x", xheep_addr, value, fpga_ddr_config.expected_values[i]);
            return 1;
        } else {
            printf("PS[%u]: %x\n", xheep_addr, value);
        }
    }
    printf("*** TEST 1 PASSED ***\n");
    
    /* ------------------------------ TEST 2  ------------------------------*/
    printf("\n### TEST 2 : Xheep WRITE / Xheep READ ###\n");
    timer_cycles_init();
    timer_start();
    uint32_t read_value;
    for (uint32_t  i = 0; i < DDR_READ_WORDS; i++) {
        xheep_addr = ddr_offset + (i << 2);
        value = random_u32(i);
        *(volatile uint32_t *)(uintptr_t)(DDR_AXI_WINDOW_BASE + xheep_addr) = value;
        read_value = *(volatile uint32_t *)(uintptr_t)(DDR_AXI_WINDOW_BASE + xheep_addr);
        if (value != read_value) {
            printf("ERROR : READ X-HEEP[0x%08x] = 0x%08x. Expected 0x%08x", xheep_addr, read_value, value);
            return 1;
        } else {
            printf("PS[%u]: %x\n", xheep_addr, read_value);
        }
    }
    printf("*** TEST 2 PASSED ***\n");
    printf("\n### TEST 3 : Xheep WRITE / PS READ ###\n");
    for (uint32_t  i = 0; i < DDR_READ_WORDS; i++) {
        xheep_addr = ddr_offset + (i << 2);
        value = random_u32(i + timer_stop());
        timer_start();
        *(volatile uint32_t *)(uintptr_t)(DDR_AXI_WINDOW_BASE + xheep_addr) = value;
        
        printf("-WT-I-%02d : %08x\n", i, value);
    }

    printf("Done. Final test will be validated by PS\n");
    return EXIT_SUCCESS;
}
