// SPDX-License-Identifier: Apache-2.0
//
// Functional experimental wrapper for the PQC_Falcon Vitis HLS iNTT IP.
//
// This wrapper is the first step towards using the real HLS-generated iNTT IP.
// It internally drives the AXI-Lite control interface of the HLS block and
// provides a simple local AXI memory model for the HLS m_axi_gmem port.
//
// Current purpose:
// - receive start_i from falcon_accelerator,
// - program HLS argument a = 0,
// - write ap_start,
// - poll ap_done,
// - expose busy_o/done_o.
//
// The memory model is intentionally simple and simulation-oriented. It allows
// the HLS IP to perform AXI read/write transactions without connecting it yet
// to the SoC memory system.

module falcon_intt_hls_wrapper (
  input  logic clk_i,
  input  logic rst_ni,

  input  logic start_i,
  output logic done_o,
  output logic busy_o,

  input  logic        debug_we_i,
  input  logic [9:0]  debug_index_i,
  input  logic [31:0] debug_wdata_i,
  output logic [31:0] debug_rdata_o,

  output logic interrupt_o,
  output logic hls_present_o
);

  localparam int unsigned HLS_N = 1024;

  localparam logic [4:0] HLS_ADDR_AP_CTRL = 5'h00;
  localparam logic [4:0] HLS_ADDR_A_LO    = 5'h10;
  localparam logic [4:0] HLS_ADDR_A_HI    = 5'h14;

  // --------------------------------------------------------------------------
  // Local memory used by the HLS AXI master.
  // Local AXI memory model: each 32-bit word stores two 16-bit coefficients.
  // --------------------------------------------------------------------------
  logic [31:0] hls_mem_q [0:HLS_N-1];

  logic [8:0] debug_word_index;
  logic       debug_coeff_high;

  assign debug_word_index = debug_index_i[9:1];
  assign debug_coeff_high = debug_index_i[0];

  function automatic logic [9:0] axi_addr_to_index(input logic [63:0] addr);
    begin
      axi_addr_to_index = addr[11:2];
    end
  endfunction

  always_comb begin
    if (debug_coeff_high) begin
      debug_rdata_o = {16'h0000, hls_mem_q[debug_word_index][31:16]};
    end else begin
      debug_rdata_o = {16'h0000, hls_mem_q[debug_word_index][15:0]};
    end
  end

  // --------------------------------------------------------------------------
  // AXI-Lite control interface signals
  // --------------------------------------------------------------------------
  logic        s_axi_control_AWVALID;
  logic        s_axi_control_AWREADY;
  logic [4:0]  s_axi_control_AWADDR;

  logic        s_axi_control_WVALID;
  logic        s_axi_control_WREADY;
  logic [31:0] s_axi_control_WDATA;
  logic [3:0]  s_axi_control_WSTRB;

  logic        s_axi_control_ARVALID;
  logic        s_axi_control_ARREADY;
  logic [4:0]  s_axi_control_ARADDR;

  logic        s_axi_control_RVALID;
  logic        s_axi_control_RREADY;
  logic [31:0] s_axi_control_RDATA;
  logic [1:0]  s_axi_control_RRESP;

  logic        s_axi_control_BVALID;
  logic        s_axi_control_BREADY;
  logic [1:0]  s_axi_control_BRESP;

  assign s_axi_control_WSTRB  = 4'hF;
  assign s_axi_control_RREADY = 1'b1;
  assign s_axi_control_BREADY = 1'b1;

  // --------------------------------------------------------------------------
  // AXI master memory interface signals
  // --------------------------------------------------------------------------
  logic        m_axi_gmem_AWVALID;
  logic        m_axi_gmem_AWREADY;
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
  logic        m_axi_gmem_WREADY;
  logic [31:0] m_axi_gmem_WDATA;
  logic [3:0]  m_axi_gmem_WSTRB;
  logic        m_axi_gmem_WLAST;
  logic [0:0]  m_axi_gmem_WID;
  logic [0:0]  m_axi_gmem_WUSER;

  logic        m_axi_gmem_ARVALID;
  logic        m_axi_gmem_ARREADY;
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

  logic        m_axi_gmem_RVALID;
  logic        m_axi_gmem_RREADY;
  logic [31:0] m_axi_gmem_RDATA;
  logic        m_axi_gmem_RLAST;
  logic [0:0]  m_axi_gmem_RID;
  logic [0:0]  m_axi_gmem_RUSER;
  logic [1:0]  m_axi_gmem_RRESP;

  logic        m_axi_gmem_BVALID;
  logic        m_axi_gmem_BREADY;
  logic [1:0]  m_axi_gmem_BRESP;
  logic [0:0]  m_axi_gmem_BID;
  logic [0:0]  m_axi_gmem_BUSER;

  logic interrupt;

  assign interrupt_o   = interrupt;
  assign hls_present_o = 1'b1;

  // --------------------------------------------------------------------------
  // AXI-Lite control FSM
  // --------------------------------------------------------------------------
  typedef enum logic [3:0] {
    CTRL_IDLE,
    CTRL_INIT_MEM,
    CTRL_WRITE_A_LO_AW,
    CTRL_WRITE_A_LO_W,
    CTRL_WRITE_A_HI_AW,
    CTRL_WRITE_A_HI_W,
    CTRL_WRITE_START_AW,
    CTRL_WRITE_START_W,
    CTRL_POLL_AR,
    CTRL_POLL_R,
    CTRL_DONE
  } ctrl_state_e;

  ctrl_state_e ctrl_state_q;
  logic [9:0]  init_idx_q;

  assign busy_o = (ctrl_state_q != CTRL_IDLE) && (ctrl_state_q != CTRL_DONE);
  assign done_o = (ctrl_state_q == CTRL_DONE);

  always_comb begin
    s_axi_control_AWVALID = 1'b0;
    s_axi_control_AWADDR  = 5'h0;
    s_axi_control_WVALID  = 1'b0;
    s_axi_control_WDATA   = 32'h0;
    s_axi_control_ARVALID = 1'b0;
    s_axi_control_ARADDR  = 5'h0;

    unique case (ctrl_state_q)
      CTRL_WRITE_A_LO_AW: begin
        s_axi_control_AWVALID = 1'b1;
        s_axi_control_AWADDR  = HLS_ADDR_A_LO;
      end

      CTRL_WRITE_A_LO_W: begin
        s_axi_control_WVALID = 1'b1;
        s_axi_control_WDATA  = 32'h0000_0000;
      end

      CTRL_WRITE_A_HI_AW: begin
        s_axi_control_AWVALID = 1'b1;
        s_axi_control_AWADDR  = HLS_ADDR_A_HI;
      end

      CTRL_WRITE_A_HI_W: begin
        s_axi_control_WVALID = 1'b1;
        s_axi_control_WDATA  = 32'h0000_0000;
      end

      CTRL_WRITE_START_AW: begin
        s_axi_control_AWVALID = 1'b1;
        s_axi_control_AWADDR  = HLS_ADDR_AP_CTRL;
      end

      CTRL_WRITE_START_W: begin
        s_axi_control_WVALID = 1'b1;
        s_axi_control_WDATA  = 32'h0000_0001;
      end

      CTRL_POLL_AR: begin
        s_axi_control_ARVALID = 1'b1;
        s_axi_control_ARADDR  = HLS_ADDR_AP_CTRL;
      end

      default: begin
      end
    endcase
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      ctrl_state_q <= CTRL_IDLE;
      init_idx_q   <= 10'd0;
    end else begin
      unique case (ctrl_state_q)
        CTRL_IDLE: begin
          if (start_i) begin
            init_idx_q   <= 10'd0;
            ctrl_state_q <= CTRL_INIT_MEM;
          end
        end

        CTRL_INIT_MEM: begin
          // Do not initialize hls_mem_q here.
          // Software has already loaded the HLS input coefficients through
          // the debug/software write path before asserting start_i.
          if (init_idx_q == 10'd1023) begin
            ctrl_state_q <= CTRL_WRITE_A_LO_AW;
          end else begin
            init_idx_q <= init_idx_q + 10'd1;
          end
        end

        CTRL_WRITE_A_LO_AW: begin
          if (s_axi_control_AWREADY) begin
            ctrl_state_q <= CTRL_WRITE_A_LO_W;
          end
        end

        CTRL_WRITE_A_LO_W: begin
          if (s_axi_control_WREADY) begin
            ctrl_state_q <= CTRL_WRITE_A_HI_AW;
          end
        end

        CTRL_WRITE_A_HI_AW: begin
          if (s_axi_control_AWREADY) begin
            ctrl_state_q <= CTRL_WRITE_A_HI_W;
          end
        end

        CTRL_WRITE_A_HI_W: begin
          if (s_axi_control_WREADY) begin
            ctrl_state_q <= CTRL_WRITE_START_AW;
          end
        end

        CTRL_WRITE_START_AW: begin
          if (s_axi_control_AWREADY) begin
            ctrl_state_q <= CTRL_WRITE_START_W;
          end
        end

        CTRL_WRITE_START_W: begin
          if (s_axi_control_WREADY) begin
            ctrl_state_q <= CTRL_POLL_AR;
          end
        end

        CTRL_POLL_AR: begin
          if (s_axi_control_ARREADY) begin
            ctrl_state_q <= CTRL_POLL_R;
          end
        end

        CTRL_POLL_R: begin
          if (s_axi_control_RVALID) begin
            if (s_axi_control_RDATA[1]) begin
              ctrl_state_q <= CTRL_DONE;
            end else begin
              ctrl_state_q <= CTRL_POLL_AR;
            end
          end
        end

        CTRL_DONE: begin
          if (!start_i) begin
            ctrl_state_q <= CTRL_IDLE;
          end
        end

        default: begin
          ctrl_state_q <= CTRL_IDLE;
        end
      endcase
    end
  end

  // --------------------------------------------------------------------------
  // Minimal AXI memory model for the HLS m_axi_gmem port
  // --------------------------------------------------------------------------
  logic        rd_active_q;
  logic [63:0] rd_addr_q;
  logic [8:0]  rd_count_q;
  logic [8:0]  rd_beats_q;

  logic        wr_active_q;
  logic [63:0] wr_addr_q;
  logic [8:0]  wr_count_q;
  logic [8:0]  wr_beats_q;

  assign m_axi_gmem_ARREADY = !rd_active_q;
  assign m_axi_gmem_AWREADY = !wr_active_q;
  assign m_axi_gmem_WREADY  = wr_active_q;

  assign m_axi_gmem_RRESP = 2'b00;
  assign m_axi_gmem_RID   = 1'b0;
  assign m_axi_gmem_RUSER = 1'b0;

  assign m_axi_gmem_BRESP = 2'b00;
  assign m_axi_gmem_BID   = 1'b0;
  assign m_axi_gmem_BUSER = 1'b0;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      rd_active_q       <= 1'b0;
      rd_addr_q         <= 64'h0;
      rd_count_q        <= 9'h0;
      rd_beats_q        <= 9'h0;
      m_axi_gmem_RVALID <= 1'b0;
      m_axi_gmem_RDATA  <= 32'h0;
      m_axi_gmem_RLAST  <= 1'b0;

      wr_active_q       <= 1'b0;
      wr_addr_q         <= 64'h0;
      wr_count_q        <= 9'h0;
      wr_beats_q        <= 9'h0;
      m_axi_gmem_BVALID <= 1'b0;
    end else begin
      // Debug/software memory write path.
      // Expose a coefficient-indexed view to software while the HLS AXI memory
      // stores two 16-bit coefficients per 32-bit word.
      if (debug_we_i) begin
        if (debug_coeff_high) begin
          hls_mem_q[debug_word_index] <= {
            debug_wdata_i[15:0],
            hls_mem_q[debug_word_index][15:0]
          };
        end else begin
          hls_mem_q[debug_word_index] <= {
            hls_mem_q[debug_word_index][31:16],
            debug_wdata_i[15:0]
          };
        end
      end

      // Read address channel
      if (m_axi_gmem_ARVALID && m_axi_gmem_ARREADY) begin
        rd_active_q       <= 1'b1;
        rd_addr_q         <= m_axi_gmem_ARADDR;
        rd_count_q        <= 9'd0;
        rd_beats_q        <= {1'b0, m_axi_gmem_ARLEN} + 9'd1;
        m_axi_gmem_RVALID <= 1'b1;
        m_axi_gmem_RDATA  <= hls_mem_q[axi_addr_to_index(m_axi_gmem_ARADDR)];
        m_axi_gmem_RLAST  <= (m_axi_gmem_ARLEN == 8'd0);
      end else if (m_axi_gmem_RVALID && m_axi_gmem_RREADY) begin
        if ((rd_count_q + 9'd1) >= rd_beats_q) begin
          rd_active_q       <= 1'b0;
          m_axi_gmem_RVALID <= 1'b0;
          m_axi_gmem_RLAST  <= 1'b0;
        end else begin
          rd_count_q        <= rd_count_q + 9'd1;
          rd_addr_q         <= rd_addr_q + 64'd4;

          m_axi_gmem_RDATA  <= hls_mem_q[axi_addr_to_index(rd_addr_q + 64'd4)];
          m_axi_gmem_RLAST  <= ((rd_count_q + 9'd2) >= rd_beats_q);
        end
      end

      // Write address channel
      if (m_axi_gmem_AWVALID && m_axi_gmem_AWREADY) begin
        wr_active_q <= 1'b1;
        wr_addr_q   <= m_axi_gmem_AWADDR;
        wr_count_q  <= 9'd0;
        wr_beats_q  <= {1'b0, m_axi_gmem_AWLEN} + 9'd1;
      end

      // Write data channel
      if (m_axi_gmem_WVALID && m_axi_gmem_WREADY) begin
        hls_mem_q[axi_addr_to_index(wr_addr_q)] <= m_axi_gmem_WDATA;
        wr_addr_q  <= wr_addr_q + 64'd4;
        wr_count_q <= wr_count_q + 9'd1;

        if (m_axi_gmem_WLAST || ((wr_count_q + 9'd1) >= wr_beats_q)) begin
          wr_active_q       <= 1'b0;
          m_axi_gmem_BVALID <= 1'b1;
        end
      end

      // Write response channel
      if (m_axi_gmem_BVALID && m_axi_gmem_BREADY) begin
        m_axi_gmem_BVALID <= 1'b0;
      end
    end
  end

  // --------------------------------------------------------------------------
  // Consume currently unused attributes to keep Verilator quiet.
  // --------------------------------------------------------------------------
  logic unused_signals;
  assign unused_signals = ^{
    m_axi_gmem_AWID,
    m_axi_gmem_AWSIZE,
    m_axi_gmem_AWBURST,
    m_axi_gmem_AWLOCK,
    m_axi_gmem_AWCACHE,
    m_axi_gmem_AWPROT,
    m_axi_gmem_AWQOS,
    m_axi_gmem_AWREGION,
    m_axi_gmem_AWUSER,
    m_axi_gmem_WSTRB,
    m_axi_gmem_WID,
    m_axi_gmem_WUSER,
    m_axi_gmem_ARID,
    m_axi_gmem_ARSIZE,
    m_axi_gmem_ARBURST,
    m_axi_gmem_ARLOCK,
    m_axi_gmem_ARCACHE,
    m_axi_gmem_ARPROT,
    m_axi_gmem_ARQOS,
    m_axi_gmem_ARREGION,
    m_axi_gmem_ARUSER,
    s_axi_control_RRESP,
    s_axi_control_BVALID,
    s_axi_control_BRESP,
    interrupt
  };

  // --------------------------------------------------------------------------
  // HLS iNTT IP instance
  // --------------------------------------------------------------------------
  iNTT u_intt_hls (
    .s_axi_control_AWVALID (s_axi_control_AWVALID),
    .s_axi_control_AWREADY (s_axi_control_AWREADY),
    .s_axi_control_AWADDR  (s_axi_control_AWADDR),
    .s_axi_control_WVALID  (s_axi_control_WVALID),
    .s_axi_control_WREADY  (s_axi_control_WREADY),
    .s_axi_control_WDATA   (s_axi_control_WDATA),
    .s_axi_control_WSTRB   (s_axi_control_WSTRB),
    .s_axi_control_ARVALID (s_axi_control_ARVALID),
    .s_axi_control_ARREADY (s_axi_control_ARREADY),
    .s_axi_control_ARADDR  (s_axi_control_ARADDR),
    .s_axi_control_RVALID  (s_axi_control_RVALID),
    .s_axi_control_RREADY  (s_axi_control_RREADY),
    .s_axi_control_RDATA   (s_axi_control_RDATA),
    .s_axi_control_RRESP   (s_axi_control_RRESP),
    .s_axi_control_BVALID  (s_axi_control_BVALID),
    .s_axi_control_BREADY  (s_axi_control_BREADY),
    .s_axi_control_BRESP   (s_axi_control_BRESP),

    .ap_clk                (clk_i),
    .ap_rst_n              (rst_ni),
    .interrupt             (interrupt),

    .m_axi_gmem_AWVALID    (m_axi_gmem_AWVALID),
    .m_axi_gmem_AWREADY    (m_axi_gmem_AWREADY),
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
    .m_axi_gmem_WREADY     (m_axi_gmem_WREADY),
    .m_axi_gmem_WDATA      (m_axi_gmem_WDATA),
    .m_axi_gmem_WSTRB      (m_axi_gmem_WSTRB),
    .m_axi_gmem_WLAST      (m_axi_gmem_WLAST),
    .m_axi_gmem_WID        (m_axi_gmem_WID),
    .m_axi_gmem_WUSER      (m_axi_gmem_WUSER),

    .m_axi_gmem_ARVALID    (m_axi_gmem_ARVALID),
    .m_axi_gmem_ARREADY    (m_axi_gmem_ARREADY),
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

    .m_axi_gmem_RVALID     (m_axi_gmem_RVALID),
    .m_axi_gmem_RREADY     (m_axi_gmem_RREADY),
    .m_axi_gmem_RDATA      (m_axi_gmem_RDATA),
    .m_axi_gmem_RLAST      (m_axi_gmem_RLAST),
    .m_axi_gmem_RID        (m_axi_gmem_RID),
    .m_axi_gmem_RUSER      (m_axi_gmem_RUSER),
    .m_axi_gmem_RRESP      (m_axi_gmem_RRESP),

    .m_axi_gmem_BVALID     (m_axi_gmem_BVALID),
    .m_axi_gmem_BREADY     (m_axi_gmem_BREADY),
    .m_axi_gmem_BRESP      (m_axi_gmem_BRESP),
    .m_axi_gmem_BID        (m_axi_gmem_BID),
    .m_axi_gmem_BUSER      (m_axi_gmem_BUSER)
  );

endmodule
