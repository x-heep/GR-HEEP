#include <stdint.h>
#include <stdio.h>

#include "gr_heep.h"
#include "core_v_mini_mcu.h"
#include "x-heep.h"
#include "dma.h"
#include "csr.h"
#include "rv_plic.h"

#define NWORDS 128u

static uint32_t src[NWORDS] __attribute__((aligned(4)));
static uint32_t dst[NWORDS] __attribute__((aligned(4)));

static void wait_dma_done(void) {
    while (!dma_is_ready(0)) {
        CSR_CLEAR_BITS(CSR_REG_MSTATUS, 0x8);
        if (dma_is_ready(0) == 0) {
            wait_for_interrupt();
        }
        CSR_SET_BITS(CSR_REG_MSTATUS, 0x8);
    }
}

static int run_dma_1d_word(uint32_t src_addr, uint32_t dst_addr, uint32_t nwords) {
    dma_target_t tgt_src = {0};
    dma_target_t tgt_dst = {0};
    dma_trans_t trans = {0};
    dma_config_flags_t res;

    tgt_src.ptr = (uint8_t *)src_addr;
    tgt_src.inc_d1_du = 1;
    tgt_src.inc_d2_du = 0;
    tgt_src.trig = DMA_TRIG_MEMORY;
    tgt_src.type = DMA_DATA_TYPE_WORD;
    tgt_src.env = NULL;

    tgt_dst.ptr = (uint8_t *)dst_addr;
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
    trans.size_d1_du = nwords;
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

    return 0;
}

void dma_intr_handler_trans_done(uint8_t channel) {
    (void)channel;
}

void dma_intr_handler_window_done(uint8_t channel) {
    (void)channel;
}

int main(void) {
    uint32_t falcon_base = (uint32_t)FALCON_ACCELERATOR_START_ADDRESS;
    uint32_t errors = 0;
    int ret;

    printf("DMA_RAM_FALCON_RAM_START\n");
    printf("FALCON_BASE 0x%08x\n", falcon_base);
    printf("NWORDS %u\n", (unsigned)NWORDS);

    for (uint32_t i = 0; i < NWORDS; i++) {
        src[i] = 0xCAFE0000u | i;
        dst[i] = 0u;
    }

    dma_init(NULL);

    printf("STEP1_RAM_TO_FALCON\n");
    ret = run_dma_1d_word((uint32_t)src, falcon_base, NWORDS);
    if (ret != 0) {
        printf("STEP1_FAILED %d\n", ret);
        return ret;
    }

    printf("STEP2_FALCON_TO_RAM\n");
    ret = run_dma_1d_word(falcon_base, (uint32_t)dst, NWORDS);
    if (ret != 0) {
        printf("STEP2_FAILED %d\n", ret);
        return 20 + ret;
    }

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t expected = 0xCAFE0000u | i;
        uint32_t got = dst[i];

        if (got != expected) {
            if (errors < 8u) {
                printf("DMA_RFR_MISMATCH i=%u got=0x%08x expected=0x%08x\n",
                       i, got, expected);
            }
            errors++;
        }
    }

    printf("DMA_RAM_FALCON_RAM_ERRORS %u\n", errors);

    return errors ? 1 : 0;
}
