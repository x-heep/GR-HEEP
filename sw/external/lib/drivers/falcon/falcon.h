#ifndef FALCON_H_
#define FALCON_H_

#include <stdint.h>

#define FALCON_CONTROL_OFFSET    0x00
#define FALCON_STATUS_OFFSET     0x04
#define FALCON_MODE_OFFSET       0x08
#define FALCON_SRC_ADDR_OFFSET   0x0C
#define FALCON_DST_ADDR_OFFSET   0x10
#define FALCON_LENGTH_OFFSET     0x14
#define FALCON_INPUT_OFFSET      0x18
#define FALCON_OUTPUT_OFFSET     0x1C

#define FALCON_LOGN_OFFSET       0x20
#define FALCON_DATA_INDEX_OFFSET 0x24
#define FALCON_DATA_WDATA_OFFSET 0x28
#define FALCON_DATA_RDATA_OFFSET 0x2C

#define FALCON_CONTROL_START_BIT 0
#define FALCON_CONTROL_CLEAR_BIT 1

#define FALCON_STATUS_DONE_BIT 0
#define FALCON_STATUS_BUSY_BIT 1

#define FALCON_MODE_DUMMY   0
#define FALCON_MODE_NTT     1
#define FALCON_MODE_NTT_HLS 2
#define FALCON_MODE_INTT_HLS 5

void falcon_clear(void);
void falcon_start(void);

void falcon_set_mode(uint32_t mode);
uint32_t falcon_get_mode(void);

void falcon_set_src_addr(uint32_t addr);
uint32_t falcon_get_src_addr(void);

void falcon_set_dst_addr(uint32_t addr);
uint32_t falcon_get_dst_addr(void);

void falcon_set_length(uint32_t length);
uint32_t falcon_get_length(void);

void falcon_set_input(uint32_t value);
uint32_t falcon_get_input(void);

uint32_t falcon_get_output(void);
uint32_t falcon_get_status(void);

uint8_t falcon_is_done(void);
uint8_t falcon_is_busy(void);

void falcon_set_logn(uint32_t logn);
uint32_t falcon_get_logn(void);

void falcon_write_coeff(uint32_t index, uint32_t value);
uint32_t falcon_read_coeff(uint32_t index);

void falcon_wait_done(void);

#endif
