// Copyright 2022 EPFL and Politecnico di Torino.
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// File: gr_heep.h
// Author: Luigi Giuffrida
// Date: 09/11/2024
// Description: Address map for gr_heep external peripherals.

<%
    gr_heep = xheep.get_extension("gr-heep")
%>

#ifndef GR_HEEP_H
#define GR_HEEP_H

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

#include "core_v_mini_mcu.h"

// Number of masters and slaves on the external crossbar
#define EXT_XBAR_NMASTER ${gr_heep["xbar_nmasters"]}
#define EXT_XBAR_NSLAVE ${gr_heep["xbar_nslaves"]}


// Memory map
// ----------

% if (gr_heep["xbar_nslaves"] > 0):

% for a_slave in gr_heep["slaves"]:

// ${a_slave['SCREAMING_NAME']}
#define ${a_slave['SCREAMING_NAME']}_START_ADDRESS (EXT_SLAVE_START_ADDRESS + 0x${hex(a_slave['offset'])[2:]})
#define ${a_slave['SCREAMING_NAME']}_SIZE 0x${hex(a_slave['size'])[2:]}
#define ${a_slave['SCREAMING_NAME']}_END_ADDRESS (${a_slave['SCREAMING_NAME']}_START_ADDRESS + 0x${hex(a_slave['size'])[2:]})
% endfor

% endif

// Peripheral map
// ----------

% if (gr_heep["periph_nslaves"] > 0):

% for a_slave in gr_heep["peripherals"]:

// ${a_slave['SCREAMING_NAME']}
#define ${a_slave['SCREAMING_NAME']}_PERIPH_START_ADDRESS (EXT_PERIPHERAL_START_ADDRESS + 0x${hex(a_slave['offset'])[2:]})
#define ${a_slave['SCREAMING_NAME']}_PERIPH_SIZE 0x${hex(a_slave['size'])[2:]}
#define ${a_slave['SCREAMING_NAME']}_PERIPH_END_ADDRESS (${a_slave['SCREAMING_NAME']}_PERIPH_START_ADDRESS + 0x${hex(a_slave['size'])[2:]})
% endfor

% endif

#ifdef __cplusplus
} // extern "C"
#endif // __cplusplus

#endif // GR_HEEP_H
