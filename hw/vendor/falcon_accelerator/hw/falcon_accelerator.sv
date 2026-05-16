// SPDX-License-Identifier: Apache-2.0
//
// Falcon accelerator wrapper for GR-HEEP/X-HEEP integration.
// Current version:
// - Dummy datapath for integration validation.
// - Local Falcon-like NTT datapath based on PQC_Falcon mq_NTT().
// - Local coefficient memory with register access from software.
//
// This version does not instantiate the Vitis HLS AXI IP directly yet.
// Instead, it adapts the Falcon NTT algorithm to the GR-HEEP register interface.

module falcon_accelerator #(
  parameter int unsigned W = 32
) (
  input logic clk_i,
  input logic rst_ni,

  // OBI interface
  input  cnt_obi_pkg::obi_req_t  obi_req_i,
  output cnt_obi_pkg::obi_resp_t obi_rsp_o,

  // Register interface
  input  cnt_reg_pkg::reg_req_t  reg_req_i,
  output cnt_reg_pkg::reg_resp_t reg_rsp_o,

  // Interrupt to host system
  output logic done_int_o
);

  // --------------------------------------------------------------------------
  // Register map
  // --------------------------------------------------------------------------
  localparam logic [7:0] CONTROL_OFFSET    = 8'h00;
  localparam logic [7:0] STATUS_OFFSET     = 8'h04;
  localparam logic [7:0] MODE_OFFSET       = 8'h08;
  localparam logic [7:0] SRC_ADDR_OFFSET   = 8'h0C;
  localparam logic [7:0] DST_ADDR_OFFSET   = 8'h10;
  localparam logic [7:0] LENGTH_OFFSET     = 8'h14;
  localparam logic [7:0] INPUT_OFFSET      = 8'h18;
  localparam logic [7:0] OUTPUT_OFFSET     = 8'h1C;

  localparam logic [7:0] LOGN_OFFSET       = 8'h20;
  localparam logic [7:0] DATA_INDEX_OFFSET = 8'h24;
  localparam logic [7:0] DATA_WDATA_OFFSET = 8'h28;
  localparam logic [7:0] DATA_RDATA_OFFSET = 8'h2C;

  // CONTROL bits
  localparam int unsigned CONTROL_START_BIT = 0;
  localparam int unsigned CONTROL_CLEAR_BIT = 1;

  // STATUS bits
  localparam int unsigned STATUS_DONE_BIT = 0;
  localparam int unsigned STATUS_BUSY_BIT = 1;

  // MODE values
  localparam logic [31:0] MODE_DUMMY   = 32'd0;
  localparam logic [31:0] MODE_NTT     = 32'd1;
  localparam logic [31:0] MODE_NTT_HLS = 32'd2;

  // Falcon parameters
  localparam logic [31:0] FALCON_Q   = 32'd12289;
  localparam logic [31:0] FALCON_Q0I = 32'd12287;
  localparam int unsigned MAX_LOGN   = 4;
  localparam int unsigned MAX_N      = 16;

  // Keep W used. Dummy path remains 32-bit.
  localparam logic [31:0] DATA_MASK = (W >= 32) ? 32'hFFFF_FFFF : ((32'h1 << W) - 1);

  // First GMb constants from PQC_Falcon/reference/hls_source/NTT.c.
  // For logn=4, mq_NTT() uses GMb[1] ... GMb[15].
  localparam logic [31:0] GMb [0:15] = '{
    32'd4091,  32'd7888,  32'd11060, 32'd11208,
    32'd6960,  32'd4342,  32'd6275,  32'd9759,
    32'd1591,  32'd6399,  32'd9477,  32'd5266,
    32'd586,   32'd5825,  32'd7538,  32'd9710
  };

  // --------------------------------------------------------------------------
  // Internal registers
  // --------------------------------------------------------------------------
  logic [31:0] mode_q;
  logic [31:0] src_addr_q;
  logic [31:0] dst_addr_q;
  logic [31:0] length_q;
  logic [31:0] input_q;
  logic [31:0] output_q;
  logic [31:0] logn_q;
  logic [31:0] data_index_q;

  logic [31:0] ntt_mem_q [0:MAX_N-1];

  logic        done_q;
  logic        busy_q;
  logic [7:0]  cycle_cnt_q;

  logic start_pulse;
  logic clear_pulse;

  // OBI response registers
  logic        obi_gnt;
  logic        obi_rvalid_q;
  logic [31:0] obi_rdata_q;

  // PQC_Falcon HLS NTT IP structural instance.
  // Parked for now; current functional path still uses local NTT16.
  logic hls_ntt_interrupt;
  logic hls_ntt_present;

  logic hls_ntt_start;
  logic hls_ntt_done;
  logic hls_ntt_busy;
  logic hls_ntt_debug_we;
  logic [31:0] hls_ntt_debug_wdata;
  logic [31:0] hls_ntt_debug_rdata;

  falcon_ntt_hls_wrapper u_falcon_ntt_hls_wrapper (
  .clk_i         (clk_i),
  .rst_ni        (rst_ni),
  .start_i       (hls_ntt_start),
  .done_o        (hls_ntt_done),
  .busy_o        (hls_ntt_busy),
  .debug_we_i    (hls_ntt_debug_we),
  .debug_index_i (data_index_q[9:0]),
  .debug_wdata_i (hls_ntt_debug_wdata),
  .debug_rdata_o (hls_ntt_debug_rdata),
  .interrupt_o   (hls_ntt_interrupt),
  .hls_present_o (hls_ntt_present)
  );

  // Address decoding
  logic [7:0] reg_addr;
  logic [7:0] obi_addr;

  assign reg_addr = reg_req_i.addr[7:0];
  assign obi_addr = obi_req_i.addr[7:0];

  // Consume currently unused fields to keep Verilator clean.
  logic unused_signals;
  assign unused_signals = ^{
    obi_req_i.addr[31:8],
    obi_req_i.wdata,
    obi_req_i.be,
    obi_req_i.we,
    reg_req_i.addr[31:8],
    reg_req_i.wstrb,
    hls_ntt_interrupt,
    hls_ntt_present,
    hls_ntt_done,
    hls_ntt_busy
  };

  // --------------------------------------------------------------------------
  // Register control pulses
  // --------------------------------------------------------------------------
  assign start_pulse = reg_req_i.valid &&
                       reg_req_i.write &&
                       reg_addr == CONTROL_OFFSET &&
                       reg_req_i.wdata[CONTROL_START_BIT];

  assign clear_pulse = reg_req_i.valid &&
                       reg_req_i.write &&
                       reg_addr == CONTROL_OFFSET &&
                       reg_req_i.wdata[CONTROL_CLEAR_BIT];

  // --------------------------------------------------------------------------
  // Falcon modular arithmetic, adapted from PQC_Falcon mq_NTT()
  // --------------------------------------------------------------------------
  function automatic logic [31:0] mod_q(input logic [31:0] value);
    begin
      mod_q = value % FALCON_Q;
    end
  endfunction

  function automatic logic [31:0] mq_add(input logic [31:0] a, input logic [31:0] b);
    logic [31:0] tmp;
    begin
      tmp = a + b - FALCON_Q;
      tmp = tmp + (FALCON_Q & {32{tmp[31]}});
      mq_add = tmp;
    end
  endfunction

  function automatic logic [31:0] mq_sub(input logic [31:0] a, input logic [31:0] b);
    logic [31:0] tmp;
    begin
      tmp = a - b;
      tmp = tmp + (FALCON_Q & {32{tmp[31]}});
      mq_sub = tmp;
    end
  endfunction

  function automatic logic [31:0] mq_montymul(input logic [31:0] x, input logic [31:0] y);
    logic [31:0] product;
    logic [31:0] tmp2;
    logic [31:0] tmp1;
    begin
      product = x * y;
      tmp2 = product;

      tmp1 = (((tmp2 * FALCON_Q0I) & 32'h0000_FFFF) * FALCON_Q);
      tmp2 = (tmp2 + tmp1) >> 16;
      tmp2 = tmp2 - FALCON_Q;
      tmp2 = tmp2 + (FALCON_Q & {32{tmp2[31]}});

      mq_montymul = tmp2;
    end
  endfunction

  // --------------------------------------------------------------------------
  // Local NTT based on PQC_Falcon mq_NTT(), limited to MAX_N=16 for now.
  // --------------------------------------------------------------------------
  task automatic compute_ntt_local;
    logic [31:0] a [0:MAX_N-1];
    int unsigned n;
    int unsigned t;
    int unsigned m;
    int unsigned ht;
    int unsigned i;
    int unsigned j;
    int unsigned j1;
    int unsigned j2;
    int unsigned k;
    logic [31:0] s;
    logic [31:0] u;
    logic [31:0] v;
    begin
      for (k = 0; k < MAX_N; k++) begin
        a[k] = mod_q(ntt_mem_q[k]);
      end

      n = 1 << logn_q[3:0];
      if (n > MAX_N) begin
        n = MAX_N;
      end

      t = n;

      for (m = 1; m < n; m = m << 1) begin
        ht = t >> 1;

	j1 = 0;
         for (i = 0; i < m; i = i + 1) begin
          s = GMb[m + i];
          j2 = j1 + ht;

          for (j = j1; j < j2; j = j + 1) begin
            u = a[j];
            v = mq_montymul(a[j + ht], s);

            a[j]      = mq_add(u, v);
            a[j + ht] = mq_sub(u, v);
          end
	
          j1 = j1 + t;
        end

        t = ht;
      end

      for (k = 0; k < MAX_N; k++) begin
        ntt_mem_q[k] <= a[k];
      end
    end
  endtask

  // HLS NTT start pulse and debug memory write path
  // --------------------------------------------------------------------------
  assign hls_ntt_start = start_pulse && !busy_q && (mode_q == MODE_NTT_HLS);

  logic hls_ntt_debug_we_reg;
  logic hls_ntt_debug_we_obi;

  assign hls_ntt_debug_we_reg = reg_req_i.valid &&
                                reg_req_i.write &&
                                reg_addr == DATA_WDATA_OFFSET &&
                                mode_q == MODE_NTT_HLS &&
                                data_index_q[31:10] == 22'h0;

  assign hls_ntt_debug_we_obi = obi_req_i.req &&
                                obi_req_i.we &&
                                obi_addr == DATA_WDATA_OFFSET &&
                                mode_q == MODE_NTT_HLS &&
                                data_index_q[31:10] == 22'h0;

  assign hls_ntt_debug_we = hls_ntt_debug_we_reg || hls_ntt_debug_we_obi;

  assign hls_ntt_debug_wdata = hls_ntt_debug_we_reg ? reg_req_i.wdata : obi_req_i.wdata;

  // --------------------------------------------------------------------------
  // Main accelerator FSM
  // --------------------------------------------------------------------------
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      mode_q       <= MODE_DUMMY;
      src_addr_q   <= 32'h0;
      dst_addr_q   <= 32'h0;
      length_q     <= 32'h0;
      input_q      <= 32'h0;
      output_q     <= 32'h0;
      logn_q       <= 32'd4;
      data_index_q <= 32'h0;

      for (int unsigned k = 0; k < MAX_N; k++) begin
        ntt_mem_q[k] <= 32'h0;
      end

      done_q      <= 1'b0;
      busy_q      <= 1'b0;
      cycle_cnt_q <= 8'h0;
    end else begin
      if (clear_pulse) begin
        output_q <= 32'h0;

        for (int unsigned k = 0; k < MAX_N; k++) begin
          ntt_mem_q[k] <= 32'h0;
        end

        done_q      <= 1'b0;
        busy_q      <= 1'b0;
        cycle_cnt_q <= 8'h0;
      end

      // Configuration register writes
      if (reg_req_i.valid && reg_req_i.write) begin
        unique case (reg_addr)
          MODE_OFFSET: begin
            mode_q <= reg_req_i.wdata;
          end

          SRC_ADDR_OFFSET: begin
            src_addr_q <= reg_req_i.wdata;
          end

          DST_ADDR_OFFSET: begin
            dst_addr_q <= reg_req_i.wdata;
          end

          LENGTH_OFFSET: begin
            length_q <= reg_req_i.wdata;
          end

          INPUT_OFFSET: begin
            input_q <= reg_req_i.wdata;
          end

          LOGN_OFFSET: begin
            if (reg_req_i.wdata <= MAX_LOGN) begin
              logn_q <= reg_req_i.wdata;
            end else begin
              logn_q <= MAX_LOGN;
            end
          end

          DATA_INDEX_OFFSET: begin
            data_index_q <= reg_req_i.wdata;
          end

          DATA_WDATA_OFFSET: begin
            if ((mode_q != MODE_NTT_HLS) && data_index_q[31:4] == 28'h0) begin
              ntt_mem_q[data_index_q[3:0]] <= reg_req_i.wdata;
            end
          end

          default: begin
          end
        endcase
      end

      // Start operation
      if (start_pulse && !busy_q) begin
        busy_q      <= 1'b1;
        done_q      <= 1'b0;
        cycle_cnt_q <= 8'h0;
      end

      // Operation completion
      if (busy_q) begin
        if (mode_q == MODE_NTT_HLS) begin
          // Experimental HLS mode: completion is driven by the HLS wrapper.
          if (hls_ntt_done) begin
            busy_q   <= 1'b0;
            done_q   <= 1'b1;
            output_q <= 32'h0000_0A11;
          end
        end else begin
          // Local modes keep the previous fixed-latency behaviour.
          cycle_cnt_q <= cycle_cnt_q + 8'h1;

          if (cycle_cnt_q == 8'd16) begin
            busy_q <= 1'b0;
            done_q <= 1'b1;

            unique case (mode_q)
              MODE_DUMMY: begin
                output_q <= (input_q ^ 32'hFA1C_0F00) & DATA_MASK;
              end

              MODE_NTT: begin
                compute_ntt_local();
                output_q <= 32'h0000_0F11;
              end

              default: begin
                output_q <= 32'hDEAD_BEEF;
              end
            endcase
          end
        end
      end
    end
  end

  // --------------------------------------------------------------------------
  // Register read path
  // --------------------------------------------------------------------------
  always_comb begin
    reg_rsp_o.rdata = 32'h0;
    reg_rsp_o.error = 1'b0;
    reg_rsp_o.ready = 1'b1;

    if (reg_req_i.valid) begin
      unique case (reg_addr)
        CONTROL_OFFSET: begin
          reg_rsp_o.rdata = 32'h0;
        end

        STATUS_OFFSET: begin
          reg_rsp_o.rdata = (32'(done_q) << STATUS_DONE_BIT) |
                            (32'(busy_q) << STATUS_BUSY_BIT);
        end

        MODE_OFFSET: begin
          reg_rsp_o.rdata = mode_q;
        end

        SRC_ADDR_OFFSET: begin
          reg_rsp_o.rdata = src_addr_q;
        end

        DST_ADDR_OFFSET: begin
          reg_rsp_o.rdata = dst_addr_q;
        end

        LENGTH_OFFSET: begin
          reg_rsp_o.rdata = length_q;
        end

        INPUT_OFFSET: begin
          reg_rsp_o.rdata = input_q;
        end

        OUTPUT_OFFSET: begin
          reg_rsp_o.rdata = output_q;
        end

        LOGN_OFFSET: begin
          reg_rsp_o.rdata = logn_q;
        end

        DATA_INDEX_OFFSET: begin
          reg_rsp_o.rdata = data_index_q;
        end

        DATA_RDATA_OFFSET: begin
          if (mode_q == MODE_NTT_HLS) begin
            reg_rsp_o.rdata = hls_ntt_debug_rdata;
          end else if (data_index_q[31:4] == 28'h0) begin
            reg_rsp_o.rdata = ntt_mem_q[data_index_q[3:0]];
          end else begin
            reg_rsp_o.rdata = 32'h0;
          end
        end

        default: begin
          reg_rsp_o.rdata = 32'h0;
        end
      endcase
    end
  end

  // --------------------------------------------------------------------------
  // OBI read access
  // --------------------------------------------------------------------------
  assign obi_gnt = obi_req_i.req;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      obi_rvalid_q <= 1'b0;
      obi_rdata_q  <= 32'h0;
    end else begin
      obi_rvalid_q <= obi_gnt;

      unique case (obi_addr)
        STATUS_OFFSET: begin
          obi_rdata_q <= (32'(done_q) << STATUS_DONE_BIT) |
                         (32'(busy_q) << STATUS_BUSY_BIT);
        end

        OUTPUT_OFFSET: begin
          obi_rdata_q <= output_q;
        end

        DATA_RDATA_OFFSET: begin
          if (mode_q == MODE_NTT_HLS) begin
            obi_rdata_q <= hls_ntt_debug_rdata;
          end else if (data_index_q[31:4] == 28'h0) begin
            obi_rdata_q <= ntt_mem_q[data_index_q[3:0]];
          end else begin
            obi_rdata_q <= 32'h0;
          end
        end

        default: begin
          obi_rdata_q <= 32'h0;
        end
      endcase
    end
  end

  assign obi_rsp_o = '{
    gnt: obi_gnt,
    rvalid: obi_rvalid_q,
    rdata: obi_rdata_q
  };

  assign done_int_o = done_q;

endmodule
