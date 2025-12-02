// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

module testharness #(
    parameter COREV_PULP                  = 0,
    parameter FPU                         = 0,
    parameter ZFINX                       = 0,
    parameter X_EXT                       = 0,         // eXtension interface in cv32e40x
    parameter JTAG_DPI                    = 0,
    parameter USE_EXTERNAL_DEVICE_EXAMPLE = 1,
    parameter CLK_FREQUENCY               = 'd100_000  //KHz
) (
    inout wire clk_i,
    inout wire rst_ni,

    inout wire boot_select_i,
    inout wire execute_from_flash_i,

    input  wire         jtag_tck_i,
    input  wire         jtag_tms_i,
    input  wire         jtag_trst_ni,
    input  wire         jtag_tdi_i,
    output wire         jtag_tdo_o,
    output logic [31:0] exit_value_o,
    inout  wire         exit_valid_o
);
  `include "tb_util.svh"

  import obi_pkg::*;
  import reg_pkg::*;

  localparam SWITCH_ACK_LATENCY = 15;

  localparam EXT_DOMAINS_RND = core_v_mini_mcu_pkg::EXTERNAL_DOMAINS == 0 ? 1 : core_v_mini_mcu_pkg::EXTERNAL_DOMAINS;

  wire uart_rx;
  wire uart_tx;
  logic sim_jtag_enable = (JTAG_DPI == 1);
  wire sim_jtag_tck;
  wire sim_jtag_tms;
  wire sim_jtag_tdi;
  wire sim_jtag_tdo;
  wire sim_jtag_trstn;
  wire mux_jtag_tck;
  wire mux_jtag_tms;
  wire mux_jtag_tdi;
  wire mux_jtag_tdo;
  wire mux_jtag_trstn;
  wire [13:0] gpio;
  wire spi_flash_sck;
  wire [1:0] spi_flash_cs;
  wire [3:0] spi_flash_sd;
  wire spi_sck;
  wire [1:0] spi_cs;
  wire [3:0] spi_sd;
  wire spi_slave_sck;
  wire spi_slave_cs;
  wire spi_slave_miso;
  wire spi_slave_mosi;
  wire i2c_scl;
  wire i2c_sda;
  wire pdm2pcm_clk;
  wire pdm2pcm_pdm;
  wire i2s_sck;
  wire i2s_ws;
  wire i2s_sd;
  wire spi2_sck;
  wire [1:0] spi2_cs;
  wire [3:0] spi2_sd;
  wire exit_value;

  // External subsystems
//   logic [EXT_DOMAINS_RND-1:0] external_subsystem_powergate_switch_n;
//   logic [EXT_DOMAINS_RND-1:0] external_subsystem_powergate_switch_ack_n;
//   logic [EXT_DOMAINS_RND-1:0] external_subsystem_powergate_iso_n;
//   logic [EXT_DOMAINS_RND-1:0] external_subsystem_rst_n;
//   logic [EXT_DOMAINS_RND-1:0] external_ram_banks_set_retentive_n;
//   logic [EXT_DOMAINS_RND-1:0] external_subsystem_clkgate_en_n;

  logic [EXT_DOMAINS_RND-1:0] external_subsystem_powergate_switch_ack_n[SWITCH_ACK_LATENCY:0];
  logic [EXT_DOMAINS_RND-1:0] cpu_subsystem_powergate_switch_ack_n[SWITCH_ACK_LATENCY:0];
  logic [EXT_DOMAINS_RND-1:0] peripheral_subsystem_powergate_switch_ack_n[SWITCH_ACK_LATENCY:0];

  //log parameters
  initial begin
    $display("%t: the parameter COREV_PULP is %x", $time, COREV_PULP);
    $display("%t: the parameter FPU is %x", $time, FPU);
    $display("%t: the parameter ZFINX is %x", $time, ZFINX);
    $display("%t: the parameter X_EXT is %x", $time, X_EXT);
    $display("%t: the parameter ZFINX is %x", $time, ZFINX);
    $display("%t: the parameter JTAG_DPI is %x", $time, JTAG_DPI);
    $display("%t: the parameter EXT_DOMAINS is %x", $time, core_v_mini_mcu_pkg::EXTERNAL_DOMAINS);
    $display("%t: the parameter USE_EXTERNAL_DEVICE_EXAMPLE is %x", $time,
             USE_EXTERNAL_DEVICE_EXAMPLE);
    $display("%t: the parameter CLK_FREQUENCY is %d KHz", $time, CLK_FREQUENCY);
  end

  gr_heep_top gr_heep_top_i (
      .clk_i,
      .rst_ni,
      .boot_select_i,
      .execute_from_flash_i,
      .jtag_tck_i(mux_jtag_tck),
      .jtag_tms_i(mux_jtag_tms),
      .jtag_trst_ni(mux_jtag_trstn),
      .jtag_tdi_i(mux_jtag_tdi),
      .jtag_tdo_o(mux_jtag_tdo),
      .uart_rx_i(uart_rx),
      .uart_tx_o(uart_tx),
      .exit_valid_o,
      .exit_value_o(exit_value),
      .gpio_0_io(gpio[0]),
      .gpio_1_io(gpio[1]),
      .gpio_2_io(gpio[2]),
      .gpio_3_io(gpio[3]),
      .gpio_4_io(gpio[4]),
      .gpio_5_io(gpio[5]),
      .gpio_6_io(gpio[6]),
      .gpio_7_io(gpio[7]),
      .gpio_8_io(gpio[8]),
      .gpio_9_io(gpio[9]),
      .gpio_10_io(gpio[10]),
      .gpio_11_io(gpio[11]),
      .gpio_12_io(gpio[12]),
      .gpio_13_io(gpio[13]),
      .spi_flash_sck_io(spi_flash_sck),
      .spi_flash_cs_0_io(spi_flash_cs[0]),
      .spi_flash_cs_1_io(spi_flash_cs[1]),
      .spi_flash_sd_0_io(spi_flash_sd[0]),
      .spi_flash_sd_1_io(spi_flash_sd[1]),
      .spi_flash_sd_2_io(spi_flash_sd[2]),
      .spi_flash_sd_3_io(spi_flash_sd[3]),
      .spi_sck_io(spi_sck),
      .spi_cs_0_io(spi_cs[0]),
      .spi_cs_1_io(spi_cs[1]),
      .spi_sd_0_io(spi_sd[0]),
      .spi_sd_1_io(spi_sd[1]),
      .spi_sd_2_io(spi_sd[2]),
      .spi_sd_3_io(spi_sd[3]),
      .spi_slave_sck_io(spi_slave_sck),
      .spi_slave_cs_io(spi_slave_cs),
      .spi_slave_miso_io(spi_slave_miso),
      .spi_slave_mosi_io(spi_slave_mosi),
      .pdm2pcm_clk_io(pdm2pcm_clk),
      .pdm2pcm_pdm_io(pdm2pcm_pdm),
      .i2s_sck_io(i2s_sck),
      .i2s_ws_io(i2s_ws),
      .i2s_sd_io(i2s_sd),
      .spi2_sck_io(spi2_sck),
      .spi2_cs_0_io(spi2_cs[0]),
      .spi2_cs_1_io(spi2_cs[1]),
      .spi2_sd_0_io(spi2_sd[0]),
      .spi2_sd_1_io(spi2_sd[1]),
      .spi2_sd_2_io(spi2_sd[2]),
      .spi2_sd_3_io(spi2_sd[3]),
      .i2c_scl_io(i2c_scl),
      .i2c_sda_io(i2c_sda)
  );

  assign exit_value_o[31:0] = gr_heep_top_i.exit_value[31:0];

  // Power switch emulation
  // ----------------------
  always_ff @(posedge clk_i) begin : blockName
    for (int unsigned i = 0; i <= SWITCH_ACK_LATENCY; i++) begin
      if (i == 0) begin
        external_subsystem_powergate_switch_ack_n[0] <= gr_heep_top_i.external_subsystem_powergate_switch_n;
        cpu_subsystem_powergate_switch_ack_n[0] <= gr_heep_top_i.cpu_subsystem_powergate_switch_n;
        peripheral_subsystem_powergate_switch_ack_n[0] <= gr_heep_top_i.peripheral_subsystem_powergate_switch_n;
      end else begin
        external_subsystem_powergate_switch_ack_n[i] <= external_subsystem_powergate_switch_ack_n[i-1];
        cpu_subsystem_powergate_switch_ack_n[i] <= cpu_subsystem_powergate_switch_ack_n[i-1];
        peripheral_subsystem_powergate_switch_ack_n[i] <= peripheral_subsystem_powergate_switch_ack_n[i-1];
      end
    end
  end

  assign gr_heep_top_i.external_subsystem_powergate_switch_ack_n = external_subsystem_powergate_switch_ack_n[SWITCH_ACK_LATENCY];
  assign gr_heep_top_i.cpu_subsystem_powergate_switch_ack_n = cpu_subsystem_powergate_switch_ack_n[SWITCH_ACK_LATENCY];
  assign gr_heep_top_i.peripheral_subsystem_powergate_switch_ack_n = peripheral_subsystem_powergate_switch_ack_n[SWITCH_ACK_LATENCY];

  uartdpi #(
      .BAUD('d256000),
      .FREQ(CLK_FREQUENCY * 1000),  //Hz
      .NAME("uart0")
  ) i_uart0 (
      .clk_i,
      .rst_ni,
      .tx_o(uart_rx),
      .rx_i(uart_tx)
  );

  // jtag calls from dpi
  SimJTAG #(
      .TICK_DELAY(1),
      .PORT      (4567)
  ) i_sim_jtag (
      .clock(clk_i),
      .reset(~rst_ni),
      .enable(sim_jtag_enable),
      .init_done(rst_ni),
      .jtag_TCK(sim_jtag_tck),
      .jtag_TMS(sim_jtag_tms),
      .jtag_TDI(sim_jtag_tdi),
      .jtag_TRSTn(sim_jtag_trstn),
      .jtag_TDO_data(sim_jtag_tdo),
      .jtag_TDO_driven(1'b1),
      .exit()
  );

  assign mux_jtag_tck   = JTAG_DPI ? sim_jtag_tck : jtag_tck_i;
  assign mux_jtag_tms   = JTAG_DPI ? sim_jtag_tms : jtag_tms_i;
  assign mux_jtag_tdi   = JTAG_DPI ? sim_jtag_tdi : jtag_tdi_i;
  assign mux_jtag_trstn = JTAG_DPI ? sim_jtag_trstn : jtag_trst_ni;

  assign sim_jtag_tdo   = JTAG_DPI ? mux_jtag_tdo : '0;
  assign jtag_tdo_o     = !JTAG_DPI ? mux_jtag_tdo : '0;

  spiflash flash_boot_i (
      .clk(spi_flash_sck),
      .csb(spi_flash_cs[0]),
      .io0(spi_flash_sd[0]),  // MOSI
      .io1(spi_flash_sd[1]),  // MISO
      .io2(spi_flash_sd[2]),
      .io3(spi_flash_sd[3])
  );

endmodule  // testharness
