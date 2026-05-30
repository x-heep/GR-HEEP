#include <stdint.h>
#include <stdio.h>

#include "gr_heep.h"
#include "core_v_mini_mcu.h"
#include "x-heep.h"
#include "dma.h"

static inline void enable_mcycle_counter(void) {
    // Clear CY bit in mcountinhibit so mcycle increments.
    asm volatile ("csrci mcountinhibit, 1" ::: "memory");
}

static inline uint32_t read_mcycle32(void) {
    uint32_t value;
    asm volatile ("csrr %0, mcycle" : "=r"(value));
    return value;
}


#define NWORDS 64u
#define DMA_POLL_TIMEOUT 10000000u

static uint32_t src[NWORDS] __attribute__((aligned(4)));
static uint32_t dst[NWORDS] __attribute__((aligned(4)));

static inline void mmio_write32(uint32_t addr, uint32_t value) {
    asm volatile ("sw %0, 0(%1)" :: "r"(value), "r"(addr) : "memory");
}

static inline uint32_t mmio_read32(uint32_t addr) {
    uint32_t value;
    asm volatile ("lw %0, 0(%1)" : "=r"(value) : "r"(addr) : "memory");
    return value;
}

void dma_intr_handler_trans_done(uint8_t channel) {
    (void)channel;
}

void dma_intr_handler_window_done(uint8_t channel) {
    (void)channel;
}

static int wait_dma_ready_poll(void) {
    uint32_t guard = 0;

    while (!dma_is_ready(0)) {
        guard++;
        if (guard > DMA_POLL_TIMEOUT) {
            return -1;
        }
    }

    return 0;
}

static int run_dma_1d_word(uint32_t src_addr,
                           uint32_t dst_addr,
                           uint32_t nwords,
                           uint32_t *total_cycles,
                           uint32_t *launch_wait_cycles) {
    dma_target_t tgt_src = {0};
    dma_target_t tgt_dst = {0};
    dma_trans_t trans = {0};
    dma_config_flags_t res;

    uint32_t t0;
    uint32_t t_launch;
    uint32_t t1;

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

    t0 = read_mcycle32();

    res = dma_validate_transaction(&trans, DMA_ENABLE_REALIGN, DMA_PERFORM_CHECKS_INTEGRITY);
    if (res != DMA_CONFIG_OK) {
        printf("DMA_VALIDATE_FAIL %u\n", (unsigned)res);
        return 10;
    }

    res = dma_load_transaction(&trans);
    if (res != DMA_CONFIG_OK) {
        printf("DMA_LOAD_FAIL %u\n", (unsigned)res);
        return 11;
    }

    t_launch = read_mcycle32();

    res = dma_launch(&trans);
    if (res != DMA_CONFIG_OK) {
        printf("DMA_LAUNCH_FAIL %u\n", (unsigned)res);
        return 12;
    }

    if (wait_dma_ready_poll() != 0) {
        printf("DMA_TIMEOUT\n");
        return 13;
    }

    t1 = read_mcycle32();

    *total_cycles = t1 - t0;
    *launch_wait_cycles = t1 - t_launch;

    return 0;
}

int main(void) {
    uint32_t base = (uint32_t)FALCON_ACCELERATOR_START_ADDRESS;
    uint32_t errors = 0;

    uint32_t t0;
    uint32_t t1;

    uint32_t cpu_ram_to_falcon_cycles;
    uint32_t cpu_falcon_to_ram_cycles;

    uint32_t dma_r2f_total_cycles;
    uint32_t dma_r2f_launch_wait_cycles;
    uint32_t dma_f2r_total_cycles;
    uint32_t dma_f2r_launch_wait_cycles;

    int ret;

    enable_mcycle_counter();

    printf("FALCON_DMA_CYCLE_BENCH_START\n");
    printf("FALCON_BASE 0x%08x\n", base);
    printf("NWORDS %u\n", (unsigned)NWORDS);

    for (uint32_t i = 0; i < NWORDS; i++) {
        src[i] = 0xC0DE0000u | i;
        dst[i] = 0u;
    }

    // ------------------------------------------------------------
    // CPU copy: RAM -> Falcon OBI window
    // ------------------------------------------------------------
    t0 = read_mcycle32();

    for (uint32_t i = 0; i < NWORDS; i++) {
        mmio_write32(base + 4u * i, src[i]);
    }

    t1 = read_mcycle32();
    cpu_ram_to_falcon_cycles = t1 - t0;

    // ------------------------------------------------------------
    // CPU copy: Falcon OBI window -> RAM
    // ------------------------------------------------------------
    t0 = read_mcycle32();

    for (uint32_t i = 0; i < NWORDS; i++) {
        dst[i] = mmio_read32(base + 4u * i);
    }

    t1 = read_mcycle32();
    cpu_falcon_to_ram_cycles = t1 - t0;

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t expected = 0xC0DE0000u | i;
        if (dst[i] != expected) {
            if (errors < 8u) {
                printf("CPU_WINDOW_MISMATCH i=%u got=0x%08x expected=0x%08x\n",
                       i, dst[i], expected);
            }
            errors++;
        }
    }

    printf("CPU_WINDOW_ERRORS %u\n", errors);

    // ------------------------------------------------------------
    // DMA copy: RAM -> Falcon OBI window
    // ------------------------------------------------------------
    for (uint32_t i = 0; i < NWORDS; i++) {
        src[i] = 0xDADA0000u | i;
        dst[i] = 0u;
    }

    dma_init(NULL);

    ret = run_dma_1d_word((uint32_t)src,
                          base,
                          NWORDS,
                          &dma_r2f_total_cycles,
                          &dma_r2f_launch_wait_cycles);
    if (ret != 0) {
        printf("DMA_R2F_FAILED %d\n", ret);
        return ret;
    }

    // ------------------------------------------------------------
    // DMA copy: Falcon OBI window -> RAM
    // ------------------------------------------------------------
    ret = run_dma_1d_word(base,
                          (uint32_t)dst,
                          NWORDS,
                          &dma_f2r_total_cycles,
                          &dma_f2r_launch_wait_cycles);
    if (ret != 0) {
        printf("DMA_F2R_FAILED %d\n", ret);
        return 20 + ret;
    }

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t expected = 0xDADA0000u | i;
        if (dst[i] != expected) {
            if (errors < 8u) {
                printf("DMA_RFR_MISMATCH i=%u got=0x%08x expected=0x%08x\n",
                       i, dst[i], expected);
            }
            errors++;
        }
    }

    printf("DMA_RFR_ERRORS %u\n", errors);

    printf("CPU_RAM_TO_FALCON_CYCLES %u\n", (unsigned)cpu_ram_to_falcon_cycles);
    printf("CPU_FALCON_TO_RAM_CYCLES %u\n", (unsigned)cpu_falcon_to_ram_cycles);
    printf("CPU_RAM_FALCON_RAM_CYCLES %u\n",
           (unsigned)(cpu_ram_to_falcon_cycles + cpu_falcon_to_ram_cycles));

    printf("DMA_RAM_TO_FALCON_TOTAL_CYCLES %u\n", (unsigned)dma_r2f_total_cycles);
    printf("DMA_RAM_TO_FALCON_LAUNCH_WAIT_CYCLES %u\n", (unsigned)dma_r2f_launch_wait_cycles);

    printf("DMA_FALCON_TO_RAM_TOTAL_CYCLES %u\n", (unsigned)dma_f2r_total_cycles);
    printf("DMA_FALCON_TO_RAM_LAUNCH_WAIT_CYCLES %u\n", (unsigned)dma_f2r_launch_wait_cycles);

    printf("DMA_RAM_FALCON_RAM_TOTAL_CYCLES %u\n",
           (unsigned)(dma_r2f_total_cycles + dma_f2r_total_cycles));
    printf("DMA_RAM_FALCON_RAM_LAUNCH_WAIT_CYCLES %u\n",
           (unsigned)(dma_r2f_launch_wait_cycles + dma_f2r_launch_wait_cycles));

    printf("FALCON_DMA_CYCLE_BENCH_ERRORS %u\n", errors);

    return errors ? 1 : 0;
}
