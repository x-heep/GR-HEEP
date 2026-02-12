// Copyright 2024 Politecnico di Torino, EPFL.
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// File: gr_heep.sv
// Author: Luigi Giuffrida, David Mallasen
// Description: GR-HEEP top-level module

<%!
    from x_heep_gen.pads.pin import Input, Output, Inout, PinDigital, Asignal
%>

<%
    attribute_bits = xheep.get_padring().attributes.get("bits")
    any_muxed_pads = xheep.get_padring().num_muxed_pads() > 0
    analog_signal_pads = [ pad for pad in xheep.get_padring().pad_list if any(isinstance(pin, Asignal) for pin in pad.pins) ] 
%>

module gr_heep (
    // X-HEEP interface
    % for pad in xheep.get_padring().pad_list:
      <%
      has_input_pin = any(isinstance(pin, Input) for pin in pad.pins)
      has_output_pin = any(isinstance(pin, Output) for pin in pad.pins)
      has_inout_pin = any(isinstance(pin, Inout) for pin in pad.pins)

      if not (has_input_pin or has_output_pin or has_inout_pin):
        continue
      pin0_name = pad.pins[0].rtl_name()
      muxed_string = "_muxed" if pad.is_muxed() else ""
      %>\
      % if has_inout_pin or (has_input_pin and has_output_pin):
        inout wire ${pin0_name}io${"" if loop.last else ","}
      % elif has_input_pin:
        inout wire ${pin0_name}i${"" if loop.last else ","}
      % elif has_output_pin:
        inout wire ${pin0_name}o${"" if loop.last else ","}
      % endif
    % endfor
);
  import obi_pkg::*;
  import reg_pkg::*;
  import fifo_pkg::*;
  import gr_heep_pkg::*;
  import core_v_mini_mcu_pkg::*;

  // PARAMETERS
  localparam int unsigned ExtXbarNmasterRnd = (gr_heep_pkg::ExtXbarNMaster > 0) ?
    gr_heep_pkg::ExtXbarNMaster : 32'd1;
  localparam int unsigned ExtDomainsRnd = core_v_mini_mcu_pkg::EXTERNAL_DOMAINS == 0 ?
    32'd1 : core_v_mini_mcu_pkg::EXTERNAL_DOMAINS;

  // INTERNAL SIGNALS
  // ----------------
  // Synchronized reset
  logic rst_nin_sync;

  // Exit value
  logic [31:0] exit_value;

  // X-HEEP external master ports
  obi_req_t  heep_core_instr_req;
  obi_resp_t heep_core_instr_rsp;
  obi_req_t  heep_core_data_req;
  obi_resp_t heep_core_data_rsp;
  obi_req_t  heep_debug_master_req;
  obi_resp_t heep_debug_master_rsp;
  obi_req_t  [DMA_NUM_MASTER_PORTS-1:0] heep_dma_read_req;
  obi_resp_t [DMA_NUM_MASTER_PORTS-1:0] heep_dma_read_rsp;
  obi_req_t  [DMA_NUM_MASTER_PORTS-1:0] heep_dma_write_req;
  obi_resp_t [DMA_NUM_MASTER_PORTS-1:0] heep_dma_write_rsp;
  obi_req_t  [DMA_NUM_MASTER_PORTS-1:0] heep_dma_addr_req;
  obi_resp_t [DMA_NUM_MASTER_PORTS-1:0] heep_dma_addr_rsp;
  fifo_req_t [core_v_mini_mcu_pkg::DMA_CH_NUM-1:0] hw_fifo_req;
  fifo_resp_t [core_v_mini_mcu_pkg::DMA_CH_NUM-1:0] hw_fifo_rsp;
  logic [core_v_mini_mcu_pkg::DMA_CH_NUM-1:0] hw_fifo_done;

  // External DMA slots
  logic [core_v_mini_mcu_pkg::DMA_CH_NUM-1:0] ext_dma_slot_tx;
  logic [core_v_mini_mcu_pkg::DMA_CH_NUM-1:0] ext_dma_slot_rx;
  logic [core_v_mini_mcu_pkg::DMA_CH_NUM-1:0] dma_done;

  // X-HEEP slave ports
  obi_req_t  [ExtXbarNmasterRnd-1:0] heep_slave_req;
  obi_resp_t [ExtXbarNmasterRnd-1:0] heep_slave_rsp;

  // External master ports
  obi_req_t  [ExtXbarNmasterRnd-1:0] gr_heep_master_req;
  obi_resp_t [ExtXbarNmasterRnd-1:0] gr_heep_master_resp;

  // X-HEEP external peripheral master ports
  reg_req_t heep_peripheral_req;
  reg_rsp_t heep_peripheral_rsp;

  // Interrupt vector
  logic [core_v_mini_mcu_pkg::NEXT_INT-1:0] ext_int_vector;
  logic intr_ext_peripheral;

  // Power Manager signals
  logic cpu_subsystem_powergate_switch_n;
  logic cpu_subsystem_powergate_switch_ack_n;
  logic peripheral_subsystem_powergate_switch_n;
  logic peripheral_subsystem_powergate_switch_ack_n;

  // External SPC interface signals
  reg_req_t [AoSPCNum-1:0] ext_ao_peripheral_req;
  reg_rsp_t  [AoSPCNum-1:0] ext_ao_peripheral_resp;
  

  // PAD controller
  reg_req_t pad_req;
  reg_rsp_t pad_rsp;
  % if attribute_bits != None:
    logic [core_v_mini_mcu_pkg::NUM_PAD-1:0][${attribute_bits}] pad_attributes;
  % endif
  % if any_muxed_pads:
    logic [core_v_mini_mcu_pkg::NUM_PAD-1:0][${xheep.get_padring().get_muxed_pad_select_width()-1}:0] pad_muxes;
  % endif

  // External power domains
  logic [ExtDomainsRnd-1:0] external_subsystem_powergate_switch_n;
  logic [ExtDomainsRnd-1:0] external_subsystem_powergate_switch_ack_n;
  logic [ExtDomainsRnd-1:0] external_subsystem_powergate_iso_n;

  // External RAM banks retentive mode control
  logic [ExtDomainsRnd-1:0] external_ram_banks_set_retentive_n;

  // External domains reset
  logic [ExtDomainsRnd-1:0] external_subsystem_rst_n;

  // External domains clock-gating
  logic [ExtDomainsRnd-1:0] external_subsystem_clkgate_en_n;

  logic ext_debug_req;
  logic ext_debug_reset_n;

  if_xif #(.X_NUM_RS(3)) ext_xif ();

  // CORE-V-MINI-MCU input/output pins
  % for pad in xheep.get_padring().pad_list:
    % for pin in pad.pins:
      % if isinstance(pin, PinDigital):
        logic ${pin.rtl_name()}in_x, ${pin.rtl_name()}out_x, ${pin.rtl_name()}oe_x;
      % endif
    % endfor
    % if len(pad.pins) > 1 and any( isinstance(pin, PinDigital) for pin in pad.pins ):
      logic ${pad.pins[0].rtl_name()}in_x_muxed, ${pad.pins[0].rtl_name()}out_x_muxed, ${pad.pins[0].rtl_name()}oe_x_muxed;
    % endif
  % endfor

  // --------------
  // SYSTEM MODULES
  // --------------

  // Reset synchronizer
  // ---------------
  rstgen rstgen_i (
    .clk_i      (clk_in_x),
    .rst_ni     (rst_nin_x),
    .test_mode_i(1'b0 ), // not implemented
    .rst_no     (rst_nin_sync),
    .init_no    () // unused
  );

  // CORE-V-MINI-MCU (microcontroller)
  // ---------------------------------
  core_v_mini_mcu #(
    .AO_SPC_NUM      (AoSPCNum),
    .EXT_HARTS       (1)
  ) core_v_mini_mcu_i (
    // MCU pads
    .clk_i (clk_in_x),
    .rst_ni (rst_nin_sync),
    % for pin in xheep.get_padring().get_connected_pins():
      % if pin.module == "core_v_mini_mcu":
        % if isinstance(pin, (Input, Inout)):
          .${pin.rtl_name()}i(${pin.rtl_name()}in_x),
        % endif
        % if isinstance(pin, (Output, Inout)):
          .${pin.rtl_name()}o(${pin.rtl_name()}out_x),
        % endif
        % if isinstance(pin, Inout):
          .${pin.rtl_name()}oe_o(${pin.rtl_name()}oe_x),
        % endif
      % endif
    % endfor

    // IDs
    .hart_id_i ('0),
    .xheep_instance_id_i ('0),

    // CORE-V eXtension Interface
    .xif_compressed_if (ext_xif.cpu_compressed),
    .xif_issue_if (ext_xif.cpu_issue),
    .xif_commit_if (ext_xif.cpu_commit),
    .xif_mem_if (ext_xif.cpu_mem),
    .xif_mem_result_if (ext_xif.cpu_mem_result),
    .xif_result_if (ext_xif.cpu_result),

    // Pad controller interface
    .pad_req_o  (pad_req),
    .pad_resp_i (pad_rsp),

    // External slave ports
    .ext_xbar_master_req_i (heep_slave_req),
    .ext_xbar_master_resp_o (heep_slave_rsp),

    // External master ports
    .ext_core_instr_req_o (heep_core_instr_req),
    .ext_core_instr_resp_i (heep_core_instr_rsp),
    .ext_core_data_req_o (heep_core_data_req),
    .ext_core_data_resp_i (heep_core_data_rsp),
    .ext_debug_master_req_o (heep_debug_master_req),
    .ext_debug_master_resp_i (heep_debug_master_rsp),
    .ext_dma_read_req_o (heep_dma_read_req),
    .ext_dma_read_resp_i (heep_dma_read_rsp),
    .ext_dma_write_req_o (heep_dma_write_req),
    .ext_dma_write_resp_i (heep_dma_write_rsp),
    .ext_dma_addr_req_o (heep_dma_addr_req),
    .ext_dma_addr_resp_i (heep_dma_addr_rsp),
    .hw_fifo_req_o (hw_fifo_req),
    .hw_fifo_resp_i (hw_fifo_rsp),
    .hw_fifo_done_i (hw_fifo_done),

    // External peripherals slave ports
    .ext_peripheral_slave_req_o (heep_peripheral_req),
    .ext_peripheral_slave_resp_i (heep_peripheral_rsp),

    // SPC signals
    .ext_ao_peripheral_slave_req_i (ext_ao_peripheral_req),
    .ext_ao_peripheral_slave_resp_o (ext_ao_peripheral_resp),

    // Power switches connected by the backend
    .cpu_subsystem_powergate_switch_no (cpu_subsystem_powergate_switch_n),
    .cpu_subsystem_powergate_switch_ack_ni (cpu_subsystem_powergate_switch_ack_n),
    .peripheral_subsystem_powergate_switch_no (peripheral_subsystem_powergate_switch_n),
    .peripheral_subsystem_powergate_switch_ack_ni (peripheral_subsystem_powergate_switch_ack_n),

    .external_subsystem_powergate_switch_no(external_subsystem_powergate_switch_n),
    .external_subsystem_powergate_switch_ack_ni(external_subsystem_powergate_switch_ack_n),
    .external_subsystem_powergate_iso_no(external_subsystem_powergate_iso_n),

    // Control signals for external peripherals
    .external_subsystem_rst_no (external_subsystem_rst_n),
    .external_ram_banks_set_retentive_no (external_ram_banks_set_retentive_n),
    .external_subsystem_clkgate_en_no (external_subsystem_clkgate_en_n),

    // External interrupts
    .intr_vector_ext_i (ext_int_vector),
    .intr_ext_peripheral_i (intr_ext_peripheral),

    .ext_debug_req_o (ext_debug_req),
    .ext_debug_reset_no (ext_debug_reset_n),
    .ext_cpu_subsystem_rst_no (),

    .ext_dma_slot_tx_i (ext_dma_slot_tx),
    .ext_dma_slot_rx_i (ext_dma_slot_rx),

    .ext_dma_stop_i ('0),
    .dma_done_o (dma_done),
    
    .exit_value_o (exit_value)
  );

  assign heep_slave_req = '0;
  assign heep_core_instr_rsp = '0;
  assign heep_core_data_rsp = '0;
  assign heep_debug_master_rsp = '0;
  assign heep_dma_read_rsp = '0;
  assign heep_dma_write_rsp = '0;
  assign heep_dma_addr_rsp = '0;
  assign heep_peripheral_rsp = '0;
  assign ext_ao_peripheral_req = '0;

  assign hw_fifo_done = '0;
  assign hw_fifo_rsp = '0;
  assign ext_dma_slot_tx = '0;
  assign ext_dma_slot_rx = '0;
  assign ext_int_vector = '0;
  assign intr_ext_peripheral = '0;
  assign exit_value_out_x = exit_value[0];

  // Pad ring
  // --------
  gr_heep_pad_ring gr_heep_pad_ring_i (
    % for pad in xheep.get_padring().pad_list:
      <%
      has_input_pin = any(isinstance(pin, Input) for pin in pad.pins)
      has_output_pin = any(isinstance(pin, Output) for pin in pad.pins)
      has_inout_pin = any(isinstance(pin, Inout) for pin in pad.pins)

      if not (has_input_pin or has_output_pin or has_inout_pin):
        continue
      pin0_name = pad.pins[0].rtl_name()
      muxed_string = "_muxed" if pad.is_muxed() else ""
      %>\
      % if has_inout_pin or (has_input_pin and has_output_pin):
        .${pin0_name}i(${pin0_name}out_x${muxed_string}),
        .${pin0_name}oe_i(${pin0_name}oe_x${muxed_string}),
        .${pin0_name}o(${pin0_name}in_x${muxed_string}),
        .${pin0_name}io(${pin0_name}io),
      % elif has_input_pin:
        .${pin0_name}o(${pin0_name}in_x${muxed_string}),
        .${pin0_name}io(${pin0_name}i),
      % elif has_output_pin:
        .${pin0_name}i(${pin0_name}out_x${muxed_string}),
        .${pin0_name}io(${pin0_name}o${muxed_string}),
      % endif
    % endfor

    % if len(analog_signal_pads) > 0:
      `ifdef SYNTHESIS
        % for pad in analog_signal_pads:
          .${pad.name.lower()}_io,
        % endfor
      `endif
    %endif
    // Pad attributes
    % if attribute_bits != None:
      .pad_attributes_i(pad_attributes)
    % else:
      .pad_attributes_i('0)
    % endif
  );

  // Constant pad signals
  % for pin in xheep.get_padring().pin_list:
    % if isinstance(pin, Input):
      assign ${pin.rtl_name()}out_x = 1'b0;
      assign ${pin.rtl_name()}oe_x = 1'b0;
    % endif
    % if isinstance(pin, Output):
      assign ${pin.rtl_name()}oe_x = 1'b1;
    % endif
  % endfor

  // Shared pads multiplexing
  % for pad in [pad for pad in xheep.get_padring().pad_list if pad.is_muxed() and any(isinstance(pin, PinDigital) for pin in pad.pins)]:
    <% pin0_name = pad.pins[0].rtl_name() %>\
    always_comb
    begin
      % for pin in pad.pins:
        ${pin.rtl_name()}in_x = 1'b0;
      % endfor
      unique case(pad_muxes[core_v_mini_mcu_pkg::PAD_${pad.name.upper()}])
        % for idx, pin in enumerate(pad.pins):
          ${idx}: begin
            <% pinidx_name = pin.rtl_name() %>
            ${pin0_name}out_x_muxed = ${pinidx_name}out_x;
            ${pin0_name}oe_x_muxed  = ${pinidx_name}oe_x;
            ${pinidx_name}in_x        = ${pin0_name}in_x_muxed;
          end
        % endfor
        default: begin
          ${pin0_name}out_x_muxed = ${pin0_name}out_x;
          ${pin0_name}oe_x_muxed  = ${pin0_name}oe_x;
          ${pin0_name}in_x        = ${pin0_name}in_x_muxed;
        end
      endcase
    end
  % endfor

  // Pad control
  // -----------
  pad_control #(
    .reg_req_t (reg_req_t),
    .reg_rsp_t (reg_rsp_t),
    .NUM_PAD   (NUM_PAD)
  ) pad_control_i (
    .clk_i            (clk_in_x),
    .rst_ni           (rst_nin_sync),
    .reg_req_i        (pad_req),
    .reg_rsp_o        (pad_rsp)${"," if any_muxed_pads or attribute_bits != None else ""}
    % if attribute_bits != None:
      .pad_attributes_o(pad_attributes)${"," if any_muxed_pads else ""}
    % endif
    % if any_muxed_pads:
      .pad_muxes_o(pad_muxes)
    % endif
  );

endmodule // gr_heep_top
