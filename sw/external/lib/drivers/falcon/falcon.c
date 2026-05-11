#include "falcon.h"

#include <stdint.h>

#include "gr_heep.h"

static inline volatile uint32_t *falcon_reg(uint32_t offset)
{
    return (volatile uint32_t *)(FALCON_ACCELERATOR_PERIPH_START_ADDRESS + offset);
}

void falcon_clear(void)
{
    *falcon_reg(FALCON_CONTROL_OFFSET) = (1u << FALCON_CONTROL_CLEAR_BIT);
}

void falcon_start(void)
{
    *falcon_reg(FALCON_CONTROL_OFFSET) = (1u << FALCON_CONTROL_START_BIT);
}

void falcon_set_mode(uint32_t mode)
{
    *falcon_reg(FALCON_MODE_OFFSET) = mode;
}

uint32_t falcon_get_mode(void)
{
    return *falcon_reg(FALCON_MODE_OFFSET);
}

void falcon_set_src_addr(uint32_t addr)
{
    *falcon_reg(FALCON_SRC_ADDR_OFFSET) = addr;
}

uint32_t falcon_get_src_addr(void)
{
    return *falcon_reg(FALCON_SRC_ADDR_OFFSET);
}

void falcon_set_dst_addr(uint32_t addr)
{
    *falcon_reg(FALCON_DST_ADDR_OFFSET) = addr;
}

uint32_t falcon_get_dst_addr(void)
{
    return *falcon_reg(FALCON_DST_ADDR_OFFSET);
}

void falcon_set_length(uint32_t length)
{
    *falcon_reg(FALCON_LENGTH_OFFSET) = length;
}

uint32_t falcon_get_length(void)
{
    return *falcon_reg(FALCON_LENGTH_OFFSET);
}

void falcon_set_input(uint32_t value)
{
    *falcon_reg(FALCON_INPUT_OFFSET) = value;
}

uint32_t falcon_get_input(void)
{
    return *falcon_reg(FALCON_INPUT_OFFSET);
}

uint32_t falcon_get_output(void)
{
    return *falcon_reg(FALCON_OUTPUT_OFFSET);
}

uint32_t falcon_get_status(void)
{
    return *falcon_reg(FALCON_STATUS_OFFSET);
}

uint8_t falcon_is_done(void)
{
    return (falcon_get_status() & (1u << FALCON_STATUS_DONE_BIT)) != 0;
}

uint8_t falcon_is_busy(void)
{
    return (falcon_get_status() & (1u << FALCON_STATUS_BUSY_BIT)) != 0;
}

void falcon_set_logn(uint32_t logn)
{
    *falcon_reg(FALCON_LOGN_OFFSET) = logn;
}

uint32_t falcon_get_logn(void)
{
    return *falcon_reg(FALCON_LOGN_OFFSET);
}

void falcon_write_coeff(uint32_t index, uint32_t value)
{
    *falcon_reg(FALCON_DATA_INDEX_OFFSET) = index;
    *falcon_reg(FALCON_DATA_WDATA_OFFSET) = value;
}

uint32_t falcon_read_coeff(uint32_t index)
{
    *falcon_reg(FALCON_DATA_INDEX_OFFSET) = index;
    return *falcon_reg(FALCON_DATA_RDATA_OFFSET);
}

void falcon_wait_done(void)
{
    while (!falcon_is_done()) {
        continue;
    }
}
