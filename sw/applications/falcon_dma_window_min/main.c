#include <stdint.h>
#include <stdio.h>

#include "gr_heep.h"
#include "core_v_mini_mcu.h"
#include "x-heep.h"
#include "dma.h"
#include "csr.h"
#include "rv_plic.h"

#define NWORDS 256u

static uint32_t dst[NWORDS] __attribute__((aligned(4)));

static inline void mmio_write32(uint32_t addr, uint32_t value) {
    asm volatile ("sw %0, 0(%1)" :: "r"(value), "r"(addr) : "memory");
}

static void wait_dma_done(void) {
    while (!dma_is_ready(0)) {
        CSR_CLEAR_BITS(CSR_REG_MSTATUS, 0x8);
        if (dma_is_ready(0) == 0) {
            wait_for_interrupt();
        }
        CSR_SET_BITS(CSR_REG_MSTATUS, 0x8);
    }
}

void dma_intr_handler_trans_done(uint8_t channel) {
    (void)channel;
}

void dma_intr_handler_window_done(uint8_t channel) {
    (void)channel;
}

int main(void) {
    dma_target_t tgt_src;
    dma_target_t tgt_dst;
    dma_trans_t trans;
    dma_config_flags_t res;

    uint32_t base = (uint32_t)FALCON_ACCELERATOR_START_ADDRESS;
    uint32_t errors = 0;

    printf("DMA_FALCON_TO_RAM_START\n");
    printf("FALCON_BASE 0x%08x\n", base);

    for (uint32_t i = 0; i < NWORDS; i++) {
        dst[i] = 0u;
        mmio_write32(base + 4u * i, 0xBEEF0000u | i);
    }

    dma_init(NULL);

    tgt_src.ptr = (uint8_t *)base;
    tgt_src.inc_d1_du = 1;
    tgt_src.inc_d2_du = 0;
    tgt_src.trig = DMA_TRIG_MEMORY;
    tgt_src.type = DMA_DATA_TYPE_WORD;
    tgt_src.env = NULL;

    tgt_dst.ptr = (uint8_t *)dst;
    tgt_dst.inc_d1_du = 1;
    tgt_dst.inc_d2_du = 0;
    tgt_dst.trig = DMA_TRIG_MEMORY;
    tgt_dst.type = DMA_DATA_TYPE_WORD;
    tgt_dst.env = NULL;

    trans.src = &tgt_src;
    trans.dst = &tgt_dst;
    trans.src_addr = NULL;
    trans.src_type = DMA_DATA_TYPE_WORD;
    trans.dst_type = DMA_DATA_TYPE_WORD;
    trans.size_d1_du = NWORDS;
    trans.size_d2_du = 0;
    trans.mode = DMA_TRANS_MODE_SINGLE;
    trans.win_du = 0;
    trans.sign_ext = 0;
    trans.end = DMA_TRANS_END_INTR;
    trans.dim = DMA_DIM_CONF_1D;

    res = dma_validate_transaction(&trans, DMA_ENABLE_REALIGN, DMA_PERFORM_CHECKS_INTEGRITY);
    printf("DMA_VALIDATE %u\n", (unsigned)res);
    if (res != DMA_CONFIG_OK) return 10;

    res = dma_load_transaction(&trans);
    printf("DMA_LOAD %u\n", (unsigned)res);
    if (res != DMA_CONFIG_OK) return 11;

    res = dma_launch(&trans);
    printf("DMA_LAUNCH %u\n", (unsigned)res);
    if (res != DMA_CONFIG_OK) return 12;

    wait_dma_done();

    printf("DMA_DONE\n");

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t expected = 0xBEEF0000u | i;
        uint32_t got = dst[i];

        if (got != expected) {
            if (errors < 8u) {
                printf("DMA_FR_MISMATCH i=%u got=0x%08x expected=0x%08x\n",
                       i, got, expected);
            }
            errors++;
        }
    }

    printf("DMA_FALCON_TO_RAM_ERRORS %u\n", errors);

    return errors ? 1 : 0;
}
