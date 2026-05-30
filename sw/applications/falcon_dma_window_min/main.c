#include <stdint.h>
#include <stdio.h>
#include "gr_heep.h"

#define NWORDS 2048u

static inline void mmio_write32(uint32_t addr, uint32_t value) {
    asm volatile ("sw %0, 0(%1)" :: "r"(value), "r"(addr) : "memory");
}

static inline uint32_t mmio_read32(uint32_t addr) {
    uint32_t value;
    asm volatile ("lw %0, 0(%1)" : "=r"(value) : "r"(addr) : "memory");
    return value;
}

int main(void) {
    uint32_t base = (uint32_t)FALCON_ACCELERATOR_START_ADDRESS;
    uint32_t errors = 0;

    for (uint32_t i = 0; i < NWORDS; i++) {
        mmio_write32(base + 4u * i, 0xA5A50000u | i);
    }

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t expected = 0xA5A50000u | i;
        uint32_t got = mmio_read32(base + 4u * i);

        if (got != expected) {
            if (errors < 8u) {
                printf("DMA_WINDOW_MISMATCH i=%u got=0x%08x expected=0x%08x\n",
                       i, got, expected);
            }
            errors++;
        }
    }

    printf("DMA_WINDOW_ERRORS %u\n", errors);

    return errors ? 1 : 0;
}
