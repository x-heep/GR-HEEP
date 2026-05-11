// SPDX-License-Identifier: Apache-2.0
//
// Structural wrapper for the PQC_Falcon Vitis HLS NTT IP.
//
// This module instantiates the original HLS-generated NTT block but keeps it
// parked for now. The current functional Falcon test still uses the local
// NTT16 datapath inside falcon_accelerator.sv.
//
// Next integration step:
// - drive the AXI-Lite control interface,
// - connect the AXI master gmem interface to a memory/bridge,
// - use the HLS NTT result instead of the local NTT16 model.

module falcon_ntt_hls_wrapper (
  input  logic clk_i,
  input  logic rst_ni,
  output logic interrupt_o,
  output logic hls_present_o
);

  // --------------------------------------------------------------------------
  // AXI-Lite control interface parked inactive
  // --------------------------------------------------------------------------
  logic        s_axi_control_AWREADY;
  logic        s_axi_control_WREADY;
  logic        s_axi_control_ARREADY;
  logic        s_axi_control_RVALID;
  logic [31:0] s_axi_control_RDATA;
  logic [1:0]  s_axi_control_RRESP;
  logic        s_axi_control_BVALID;
  logic [1:0]  s_axi_control_BRESP;

  // --------------------------------------------------------------------------
  // AXI master memory interface parked
  // --------------------------------------------------------------------------
  logic        m_axi_gmem_AWVALID;
  logic [63:0] m_axi_gmem_AWADDR;
  logic [0:0]  m_axi_gmem_AWID;
  logic [7:0]  m_axi_gmem_AWLEN;
  logic [2:0]  m_axi_gmem_AWSIZE;
  logic [1:0]  m_axi_gmem_AWBURST;
  logic [1:0]  m_axi_gmem_AWLOCK;
  logic [3:0]  m_axi_gmem_AWCACHE;
  logic [2:0]  m_axi_gmem_AWPROT;
  logic [3:0]  m_axi_gmem_AWQOS;
  logic [3:0]  m_axi_gmem_AWREGION;
  logic [0:0]  m_axi_gmem_AWUSER;

  logic        m_axi_gmem_WVALID;
  logic [31:0] m_axi_gmem_WDATA;
  logic [3:0]  m_axi_gmem_WSTRB;
  logic        m_axi_gmem_WLAST;
  logic [0:0]  m_axi_gmem_WID;
  logic [0:0]  m_axi_gmem_WUSER;

  logic        m_axi_gmem_ARVALID;
  logic [63:0] m_axi_gmem_ARADDR;
  logic [0:0]  m_axi_gmem_ARID;
  logic [7:0]  m_axi_gmem_ARLEN;
  logic [2:0]  m_axi_gmem_ARSIZE;
  logic [1:0]  m_axi_gmem_ARBURST;
  logic [1:0]  m_axi_gmem_ARLOCK;
  logic [3:0]  m_axi_gmem_ARCACHE;
  logic [2:0]  m_axi_gmem_ARPROT;
  logic [3:0]  m_axi_gmem_ARQOS;
  logic [3:0]  m_axi_gmem_ARREGION;
  logic [0:0]  m_axi_gmem_ARUSER;

  logic        m_axi_gmem_RREADY;
  logic        m_axi_gmem_BREADY;

  logic        interrupt;

  assign interrupt_o   = interrupt;
  assign hls_present_o = 1'b1;

  // Consume parked outputs to keep older Verilator flows quiet.
  logic unused_hls_outputs;
  assign unused_hls_outputs = ^{
    s_axi_control_AWREADY,
    s_axi_control_WREADY,
    s_axi_control_ARREADY,
    s_axi_control_RVALID,
    s_axi_control_RDATA,
    s_axi_control_RRESP,
    s_axi_control_BVALID,
    s_axi_control_BRESP,
    m_axi_gmem_AWVALID,
    m_axi_gmem_AWADDR,
    m_axi_gmem_AWID,
    m_axi_gmem_AWLEN,
    m_axi_gmem_AWSIZE,
    m_axi_gmem_AWBURST,
    m_axi_gmem_AWLOCK,
    m_axi_gmem_AWCACHE,
    m_axi_gmem_AWPROT,
    m_axi_gmem_AWQOS,
    m_axi_gmem_AWREGION,
    m_axi_gmem_AWUSER,
    m_axi_gmem_WVALID,
    m_axi_gmem_WDATA,
    m_axi_gmem_WSTRB,
    m_axi_gmem_WLAST,
    m_axi_gmem_WID,
    m_axi_gmem_WUSER,
    m_axi_gmem_ARVALID,
    m_axi_gmem_ARADDR,
    m_axi_gmem_ARID,
    m_axi_gmem_ARLEN,
    m_axi_gmem_ARSIZE,
    m_axi_gmem_ARBURST,
    m_axi_gmem_ARLOCK,
    m_axi_gmem_ARCACHE,
    m_axi_gmem_ARPROT,
    m_axi_gmem_ARQOS,
    m_axi_gmem_ARREGION,
    m_axi_gmem_ARUSER,
    m_axi_gmem_RREADY,
    m_axi_gmem_BREADY
  };

  NTT u_ntt_hls (
    .s_axi_control_AWVALID (1'b0),
    .s_axi_control_AWREADY (s_axi_control_AWREADY),
    .s_axi_control_AWADDR  (5'h0),
    .s_axi_control_WVALID  (1'b0),
    .s_axi_control_WREADY  (s_axi_control_WREADY),
    .s_axi_control_WDATA   (32'h0),
    .s_axi_control_WSTRB   (4'h0),
    .s_axi_control_ARVALID (1'b0),
    .s_axi_control_ARREADY (s_axi_control_ARREADY),
    .s_axi_control_ARADDR  (5'h0),
    .s_axi_control_RVALID  (s_axi_control_RVALID),
    .s_axi_control_RREADY  (1'b1),
    .s_axi_control_RDATA   (s_axi_control_RDATA),
    .s_axi_control_RRESP   (s_axi_control_RRESP),
    .s_axi_control_BVALID  (s_axi_control_BVALID),
    .s_axi_control_BREADY  (1'b1),
    .s_axi_control_BRESP   (s_axi_control_BRESP),

    .ap_clk                (clk_i),
    .ap_rst_n              (rst_ni),
    .interrupt             (interrupt),

    .m_axi_gmem_AWVALID    (m_axi_gmem_AWVALID),
    .m_axi_gmem_AWREADY    (1'b0),
    .m_axi_gmem_AWADDR     (m_axi_gmem_AWADDR),
    .m_axi_gmem_AWID       (m_axi_gmem_AWID),
    .m_axi_gmem_AWLEN      (m_axi_gmem_AWLEN),
    .m_axi_gmem_AWSIZE     (m_axi_gmem_AWSIZE),
    .m_axi_gmem_AWBURST    (m_axi_gmem_AWBURST),
    .m_axi_gmem_AWLOCK     (m_axi_gmem_AWLOCK),
    .m_axi_gmem_AWCACHE    (m_axi_gmem_AWCACHE),
    .m_axi_gmem_AWPROT     (m_axi_gmem_AWPROT),
    .m_axi_gmem_AWQOS      (m_axi_gmem_AWQOS),
    .m_axi_gmem_AWREGION   (m_axi_gmem_AWREGION),
    .m_axi_gmem_AWUSER     (m_axi_gmem_AWUSER),

    .m_axi_gmem_WVALID     (m_axi_gmem_WVALID),
    .m_axi_gmem_WREADY     (1'b0),
    .m_axi_gmem_WDATA      (m_axi_gmem_WDATA),
    .m_axi_gmem_WSTRB      (m_axi_gmem_WSTRB),
    .m_axi_gmem_WLAST      (m_axi_gmem_WLAST),
    .m_axi_gmem_WID        (m_axi_gmem_WID),
    .m_axi_gmem_WUSER      (m_axi_gmem_WUSER),

    .m_axi_gmem_ARVALID    (m_axi_gmem_ARVALID),
    .m_axi_gmem_ARREADY    (1'b0),
    .m_axi_gmem_ARADDR     (m_axi_gmem_ARADDR),
    .m_axi_gmem_ARID       (m_axi_gmem_ARID),
    .m_axi_gmem_ARLEN      (m_axi_gmem_ARLEN),
    .m_axi_gmem_ARSIZE     (m_axi_gmem_ARSIZE),
    .m_axi_gmem_ARBURST    (m_axi_gmem_ARBURST),
    .m_axi_gmem_ARLOCK     (m_axi_gmem_ARLOCK),
    .m_axi_gmem_ARCACHE    (m_axi_gmem_ARCACHE),
    .m_axi_gmem_ARPROT     (m_axi_gmem_ARPROT),
    .m_axi_gmem_ARQOS      (m_axi_gmem_ARQOS),
    .m_axi_gmem_ARREGION   (m_axi_gmem_ARREGION),
    .m_axi_gmem_ARUSER     (m_axi_gmem_ARUSER),

    .m_axi_gmem_RVALID     (1'b0),
    .m_axi_gmem_RREADY     (m_axi_gmem_RREADY),
    .m_axi_gmem_RDATA      (32'h0),
    .m_axi_gmem_RLAST      (1'b0),
    .m_axi_gmem_RID        (1'b0),
    .m_axi_gmem_RUSER      (1'b0),
    .m_axi_gmem_RRESP      (2'b00),

    .m_axi_gmem_BVALID     (1'b0),
    .m_axi_gmem_BREADY     (m_axi_gmem_BREADY),
    .m_axi_gmem_BRESP      (2'b00),
    .m_axi_gmem_BID        (1'b0),
    .m_axi_gmem_BUSER      (1'b0)
  );

endmodule
