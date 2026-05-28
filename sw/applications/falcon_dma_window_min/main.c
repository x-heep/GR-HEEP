#include <stdint.h>
#include "gr_heep.h"

int main(void) {
    volatile uint32_t *d =
        (volatile uint32_t *)FALCON_ACCELERATOR_START_ADDRESS;

    d[0] = 0x00001234u;

    if (d[0] != 0x00001234u) {
        return (int)(d[0] & 0xFFu);
    }

    return 0;
}
