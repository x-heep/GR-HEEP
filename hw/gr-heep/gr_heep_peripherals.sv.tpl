// Copyright 2024 Politecnico di Torino and Universidad Politecnica de Madrid.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-2.0. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// File: gr_heep_peripherals.sv
// Author(s):
//   Luigi Giuffrida, Iñigo Díez de Ulzurrun
// Date: 08/11/2024
// Description: Template for the GR-heep peripherals module

<%
    gr_heep = xheep.get_extension("gr-heep")
%>

module gr_heep_peripherals (
    input logic clk_i,
    input logic rst_ni${'' if gr_heep["xbar_nmasters"] == 0 and gr_heep["xbar_nslaves"] == 0 and gr_heep["periph_nslaves"] == 0 and gr_heep["ext_interrupts"] == 0 else ','}
    % if (gr_heep["xbar_nmasters"] > 0):

    // External peripherals master ports
    output obi_pkg::obi_req_t  [gr_heep_pkg::ExtXbarNMasterRnd-1:0] gr_heep_master_req_o,
    input obi_pkg::obi_resp_t [gr_heep_pkg::ExtXbarNMasterRnd-1:0] gr_heep_master_resp_i${'' if (gr_heep["xbar_nslaves"] + gr_heep["periph_nslaves"] + gr_heep["ext_interrupts"] == 0) else ','}
    % endif
    % if (gr_heep["xbar_nslaves"] > 0):

    // External peripherals slave ports
    input obi_pkg::obi_req_t  [gr_heep_pkg::ExtXbarNSlaveRnd-1:0] gr_heep_slave_req_i,
    output obi_pkg::obi_resp_t [gr_heep_pkg::ExtXbarNSlaveRnd-1:0] gr_heep_slave_resp_o${'' if (gr_heep["periph_nslaves"] + gr_heep["ext_interrupts"] == 0) else ','}
    % endif
    % if (gr_heep["periph_nslaves"] > 0):

    // External peripherals configuration ports
    input reg_pkg::reg_req_t gr_heep_peripheral_req_i,
    output reg_pkg::reg_rsp_t gr_heep_peripheral_rsp_o${'' if (gr_heep["ext_interrupts"] == 0) else ','}
    % endif
    % if (gr_heep["ext_interrupts"] > 0):

    // External peripherals interrupt ports
    output logic [gr_heep_pkg::ExtInterrupts-1:0] gr_heep_peripheral_vec_int_o,
    output logic     gr_heep_peripheral_int_o
    % endif
);

% if (gr_heep["ext_interrupts"] > 0):
    logic [gr_heep_pkg::ExtInterrupts-1:0] gr_heep_peripheral_vec_int;
    assign gr_heep_peripheral_vec_int_o = gr_heep_peripheral_vec_int;
    assign gr_heep_peripheral_int_o = |gr_heep_peripheral_vec_int;

% endif
% if (gr_heep["periph_nslaves"] > 0):
  reg_pkg::reg_req_t [gr_heep_pkg::ExtPeriphNSlaveRnd-1:0] gr_heep_peripheral_req;
  reg_pkg::reg_rsp_t [gr_heep_pkg::ExtPeriphNSlaveRnd-1:0] gr_heep_peripheral_rsp;

  logic [gr_heep_pkg::LogExtPeriphNSlave-1:0] ext_periph_select;

  // External bus for register interfaces
  addr_decode #(
      .NoIndices(gr_heep_pkg::ExtPeriphNSlave),
      .NoRules(gr_heep_pkg::ExtPeriphNSlave),
      .addr_t(logic [31:0]),
      .rule_t(addr_map_rule_pkg::addr_map_rule_t)
  ) addr_decode_gr_heep_ext_periph_i (
      .addr_i(gr_heep_peripheral_req_i.addr),
      .addr_map_i(gr_heep_pkg::ExtPeriphAddrRules),
      .idx_o(ext_periph_select),
      .dec_valid_o(),
      .dec_error_o(),
      .en_default_idx_i(1'b1),
      .default_idx_i(gr_heep_pkg::LogExtPeriphNSlave'(gr_heep_pkg::ExtPeriphDefaultIdx))
  );

  reg_demux #(
      .NoPorts(gr_heep_pkg::ExtPeriphNSlaveRnd),
      .req_t  (reg_pkg::reg_req_t),
      .rsp_t  (reg_pkg::reg_rsp_t)
  ) reg_demux_i (
      .clk_i,
      .rst_ni,
      .in_select_i(ext_periph_select),
      .in_req_i(gr_heep_peripheral_req_i),
      .in_rsp_o(gr_heep_peripheral_rsp_o),
      .out_req_o(gr_heep_peripheral_req),
      .out_rsp_i(gr_heep_peripheral_rsp)
  );

  // Instantiate here the external peripherals
  % for a_slave in gr_heep["peripherals"]:
    // % if (a_slave['name'] == "TestIp"):
    //   // Test IP
    //   test_ip test_ip_i (
    //       .clk_i,
    //       .rst_ni(rst_ni),
    //       .reg_req_i(gr_heep_peripheral_req[gr_heep_pkg::TestIpPeriphIdx]),
    //       .reg_rsp_o(gr_heep_peripheral_rsp[gr_heep_pkg::TestIpPeriphIdx]),
    //       .read_req_i(gr_heep_slave_req_i[gr_heep_pkg::TestIpIdx]),
    //       .read_resp_o(gr_heep_slave_resp_o[gr_heep_pkg::TestIpIdx])
    //   );
    // % endif
  % endfor
% endif

endmodule
