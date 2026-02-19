// Copyright 2024 Politecnico di Torino.
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// File: gr_heep_pkg.sv
// Author: Luigi Giuffrida
// Date: 16/10/2024
// Description: GR-HEEP pkg

<%
    gr_heep = xheep.get_extension("gr-heep")
%>

package gr_heep_pkg;

  import addr_map_rule_pkg::*;
  import core_v_mini_mcu_pkg::*;

  // ---------------
  // CORE-V-MINI-MCU
  // ---------------

  // SPC
  localparam int unsigned AoSPCNum = 32'd${gr_heep["ao_spc_num"]};

  localparam int unsigned DMAMasterPortsNum = DMA_NUM_MASTER_PORTS;
  localparam int unsigned DMACHNum = DMA_CH_NUM;

  // --------------------
  // CV-X-IF COPROCESSORS
  // --------------------

  

  // ----------------
  // EXTERNAL OBI BUS
  // ----------------

  // Number of masters and slaves
  localparam int unsigned ExtXbarNMaster = 32'd${gr_heep["xbar_nmasters"]};
  localparam int unsigned ExtXbarNSlave = 32'd${gr_heep["xbar_nslaves"]};
  localparam int unsigned ExtXbarNMasterRnd = ExtXbarNMaster > 0 ? ExtXbarNMaster : 32'd1;
  localparam int unsigned ExtXbarNSlaveRnd = ExtXbarNSlave > 0 ? ExtXbarNSlave : 32'd1;
  localparam int unsigned LogExtXbarNMaster = ExtXbarNMaster > 32'd1 ? $clog2(ExtXbarNMaster) : 32'd1;
  localparam int unsigned LogExtXbarNSlave = ExtXbarNSlave > 32'd1 ? $clog2(ExtXbarNSlave) : 32'd1;

  % if (gr_heep["xbar_nslaves"] > 0):

    % for a_slave in gr_heep["slaves"]:
      // Memory map
      // ----------
      // ${a_slave['name']}
      localparam int unsigned ${a_slave['name']}Idx = 32'd${a_slave['idx']};
      localparam logic [31:0] ${a_slave['name']}StartAddr = EXT_SLAVE_START_ADDRESS + 32'h${hex(a_slave['offset'])[2:]};
      localparam logic [31:0] ${a_slave['name']}Size = 32'h${hex(a_slave['size'])[2:]};
      localparam logic [31:0] ${a_slave['name']}EndAddr = ${a_slave['name']}StartAddr + 32'h${hex(a_slave['size'])[2:]};
    % endfor

    // External slaves address map
    localparam addr_map_rule_t [ExtXbarNSlave-1:0] ExtSlaveAddrRules = '{
      % for slave_idx, a_slave in enumerate(gr_heep["slaves"]):
        % if (slave_idx < len(gr_heep["slaves"])-1):
          '{idx: ${a_slave['name']}Idx, start_addr: ${a_slave['name']}StartAddr, end_addr: ${a_slave['name']}EndAddr},
        % else:
          '{idx: ${a_slave['name']}Idx, start_addr: ${a_slave['name']}StartAddr, end_addr: ${a_slave['name']}EndAddr}
        %endif
      %endfor
    };

    localparam int unsigned ExtSlaveDefaultIdx = 32'd0;

  % endif
  
  // --------------------
  // EXTERNAL PERIPHERALS
  // --------------------

  // Number of external peripherals
  localparam int unsigned ExtPeriphNSlave = 32'd${gr_heep["periph_nslaves"]};
  localparam int unsigned LogExtPeriphNSlave = (ExtPeriphNSlave > 32'd1) ? $clog2(ExtPeriphNSlave) : 32'd1;
  localparam int unsigned ExtPeriphNSlaveRnd = (ExtPeriphNSlave > 32'd1) ? ExtPeriphNSlave : 32'd1;

  % if (gr_heep["periph_nslaves"] > 0):

    % for a_slave in gr_heep["peripherals"]:
      // Memory map
      // ----------
      // ${a_slave['name']}
      localparam int unsigned ${a_slave['name']}PeriphIdx = 32'd${a_slave['idx']};
      localparam logic [31:0] ${a_slave['name']}PeriphStartAddr = EXT_PERIPHERAL_START_ADDRESS + 32'h${hex(a_slave['offset'])[2:]};
      localparam logic [31:0] ${a_slave['name']}PeriphSize = 32'h${hex(a_slave['size'])[2:]};
      localparam logic [31:0] ${a_slave['name']}PeriphEndAddr = ${a_slave['name']}PeriphStartAddr + 32'h${hex(a_slave['size'])[2:]};
    % endfor
      
    // External peripherals address map
    localparam addr_map_rule_t [ExtPeriphNSlave-1:0] ExtPeriphAddrRules = '{
      % for slave_idx, a_slave in enumerate(gr_heep["peripherals"]):
        % if (slave_idx < len(gr_heep["peripherals"])-1):
          '{idx: ${a_slave['name']}PeriphIdx, start_addr: ${a_slave['name']}PeriphStartAddr, end_addr: ${a_slave['name']}PeriphEndAddr},
        % else:
          '{idx: ${a_slave['name']}PeriphIdx, start_addr: ${a_slave['name']}PeriphStartAddr, end_addr: ${a_slave['name']}PeriphEndAddr}
        %endif
      %endfor
    };

    localparam int unsigned ExtPeriphDefaultIdx = 32'd0;

  % endif

  localparam int unsigned ExtInterrupts = 32'd${gr_heep["ext_interrupts"]};

endpackage

