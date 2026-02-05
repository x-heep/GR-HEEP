// Copyright 2024 Politecnico di Torino.
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// File: pad_ring.sv.tpl
// Author: Michele Caon, Luigi Giuffrida
// Date: 07/11/2024
// Description: GR-HEEP pad ring

module gr_heep_pad_ring (
% for pad in xheep.get_padring().pad_list:
${pad.pad_ring_io_interface}
${pad.pad_ring_ctrl_interface}
% endfor

% for external_pad in xheep.get_padring().external_pad_list:
${external_pad.pad_ring_io_interface}
${external_pad.pad_ring_ctrl_interface}
% endfor

% if xheep.get_padring().pads_attributes != None:
    input logic [core_v_mini_mcu_pkg::NUM_PAD-1:0][${xheep.get_padring().pads_attributes['bits']}] pad_attributes_i
% else:
    // here just for simplicity
    /* verilator lint_off UNUSED */
    input logic [core_v_mini_mcu_pkg::NUM_PAD-1:0][0:0] pad_attributes_i
% endif
);
  // --------------------
  //      PAD CELLS
  //
  //   CORE-V-MINI-MCU
  // --------------------
% for pad in xheep.get_padring().pad_list:
  ${pad.pad_ring_instance}
% endfor
endmodule // pad_ring
