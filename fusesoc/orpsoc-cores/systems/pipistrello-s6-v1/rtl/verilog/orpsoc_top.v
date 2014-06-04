//////////////////////////////////////////////////////////////////////
///                                                               ////
/// ORPSoC top for Atlys board                                    ////
///                                                               ////
/// Instantiates modules, depending on ORPSoC defines file        ////
///                                                               ////
/// Copyright (C) 2013 Stefan Kristiansson                        ////
///  <stefan.kristiansson@saunalahti.fi                           ////
///                                                               ////
//////////////////////////////////////////////////////////////////////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "orpsoc-defines.v"

module orpsoc_top #(
	parameter	rom0_aw = 6,
	parameter	uart0_aw = 3
)(
	input		sys_clk_pad_i,
	input		rst_n_pad_i,


	// UART
	input		uart0_srx_pad_i,
	output		uart0_stx_pad_o,
	
	//SDRAM
	output	[1:0]	sdram_ba_pad_o,
	output	[12:0]	sdram_a_pad_o,
	output		sdram_cs_n_pad_o,
	output		sdram_ras_pad_o,
	output		sdram_cas_pad_o,
	output		sdram_we_pad_o,
	inout	[15:0]	sdram_dq_pad_io,
	output	[1:0]	sdram_dqm_pad_o,
	output		sdram_cke_pad_o,
	output		sdram_clk_pad_o
	

/*
	// SPI
	output		spi0_sck_o,
	output		spi0_mosi_o,
	input		spi0_miso_i,
	output [0:0]	spi0_ss_o,
*/
);

parameter	IDCODE_VALUE=32'h14951185;

////////////////////////////////////////////////////////////////////////
//
// Clock and reset generation module
//
////////////////////////////////////////////////////////////////////////

wire	async_rst;
wire	wb_clk, wb_rst;
wire	sdram_clk, sdram_rst;


clkgen clkgen0 (
	.sys_clk_pad_i	(sys_clk_pad_i),
	.rst_n_pad_i	(rst_n_pad_i),
	.async_rst_o	(async_rst),
	.wb_clk_o	(wb_clk),
	.wb_rst_o	(wb_rst),
	.sdram_clk_o	(sdram_clk),
	.sdram_rst_o	(sdram_rst)
);

////////////////////////////////////////////////////////////////////////
//
// Modules interconnections
//
////////////////////////////////////////////////////////////////////////
`include "wb_intercon.vh"

`ifdef JTAG_DEBUG
////////////////////////////////////////////////////////////////////////
//
// GENERIC JTAG TAP
//
////////////////////////////////////////////////////////////////////////

wire	dbg_if_select;
wire	dbg_if_tdo;
wire	jtag_tap_tdo;
wire	jtag_tap_shift_dr;
wire	jtag_tap_pause_dr;
wire	jtag_tap_update_dr;
wire	jtag_tap_capture_dr;

wire	xilinx_internal_jtag_clk;
wire	xilinx_internal_jtag_rst;

xilinx_internal_jtag xilinx_internal_jtag_fuse
(
        .tck_o              (xilinx_internal_jtag_clk),
        .debug_tdo_i        (dbg_if_tdo),
        .tdi_o              (jtag_tap_tdo),
        .test_logic_reset_o (xilinx_internal_jtag_rst),
        .run_test_idle_o    (),
        .shift_dr_o         (jtag_tap_shift_dr),
        .capture_dr_o       (jtag_tap_capture_dr),
        .pause_dr_o         (jtag_tap_pause_dr),
        .update_dr_o        (jtag_tap_update_dr),
        .debug_select_o     (dbg_if_select)
);
assign pause_dr_o = 1'b0;
assign run_test_idle_o = 1'b0;



`endif

////////////////////////////////////////////////////////////////////////
//
// OR1K CPU
//
////////////////////////////////////////////////////////////////////////

wire	[31:0]	or1k_irq;

wire	[31:0]	or1k_dbg_dat_i;
wire	[31:0]	or1k_dbg_adr_i;
wire		or1k_dbg_we_i;
wire		or1k_dbg_stb_i;
wire		or1k_dbg_ack_o;
wire	[31:0]	or1k_dbg_dat_o;

wire		or1k_dbg_stall_i;
wire		or1k_dbg_ewt_i;
wire	[3:0]	or1k_dbg_lss_o;
wire	[1:0]	or1k_dbg_is_o;
wire	[10:0]	or1k_dbg_wp_o;
wire		or1k_dbg_bp_o;
wire		or1k_dbg_rst;

wire		sig_tick;

wire		or1k_rst;

assign or1k_rst = wb_rst | or1k_dbg_rst;


or1200_top #(.boot_adr(32'hf0000100))
or1200_top0 (
	// Instruction bus, clocks, reset
	.iwb_clk_i			(wb_clk),
	.iwb_rst_i			(wb_rst),
	.iwb_ack_i			(wb_s2m_or1k_i_ack),
	.iwb_err_i			(wb_s2m_or1k_i_err),
	.iwb_rty_i			(wb_s2m_or1k_i_rty),
	.iwb_dat_i			(wb_s2m_or1k_i_dat),

	.iwb_cyc_o			(wb_m2s_or1k_i_cyc),
	.iwb_adr_o			(wb_m2s_or1k_i_adr),
	.iwb_stb_o			(wb_m2s_or1k_i_stb),
	.iwb_we_o			(wb_m2s_or1k_i_we),
	.iwb_sel_o			(wb_m2s_or1k_i_sel),
	.iwb_dat_o			(wb_m2s_or1k_i_dat),
	.iwb_cti_o			(wb_m2s_or1k_i_cti),
	.iwb_bte_o			(wb_m2s_or1k_i_bte),

	// Data bus, clocks, reset
	.dwb_clk_i			(wb_clk),
	.dwb_rst_i			(wb_rst),
	.dwb_ack_i			(wb_s2m_or1k_d_ack),
	.dwb_err_i			(wb_s2m_or1k_d_err),
	.dwb_rty_i			(wb_s2m_or1k_d_rty),
	.dwb_dat_i			(wb_s2m_or1k_d_dat),

	.dwb_cyc_o			(wb_m2s_or1k_d_cyc),
	.dwb_adr_o			(wb_m2s_or1k_d_adr),
	.dwb_stb_o			(wb_m2s_or1k_d_stb),
	.dwb_we_o			(wb_m2s_or1k_d_we),
	.dwb_sel_o			(wb_m2s_or1k_d_sel),
	.dwb_dat_o			(wb_m2s_or1k_d_dat),
	.dwb_cti_o			(wb_m2s_or1k_d_cti),
	.dwb_bte_o			(wb_m2s_or1k_d_bte),

	// Debug interface ports
	.dbg_stall_i			(or1k_dbg_stall_i),
	.dbg_ewt_i			(1'b0),
	.dbg_lss_o			(or1k_dbg_lss_o),
	.dbg_is_o			(or1k_dbg_is_o),
	.dbg_wp_o			(or1k_dbg_wp_o),
	.dbg_bp_o			(or1k_dbg_bp_o),

	.dbg_adr_i			(or1k_dbg_adr_i),
	.dbg_we_i			(or1k_dbg_we_i),
	.dbg_stb_i			(or1k_dbg_stb_i),
	.dbg_dat_i			(or1k_dbg_dat_i),
	.dbg_dat_o			(or1k_dbg_dat_o),
	.dbg_ack_o			(or1k_dbg_ack_o),

	.pm_clksd_o			(),
	.pm_dc_gate_o			(),
	.pm_ic_gate_o			(),
	.pm_dmmu_gate_o			(),
	.pm_immu_gate_o			(),
	.pm_tt_gate_o			(),
	.pm_cpu_gate_o			(),
	.pm_wakeup_o			(),
	.pm_lvolt_o			(),

	// Core clocks, resets
	.clk_i				(wb_clk),
	.rst_i				(or1k_rst),

	.clmode_i			(2'b01), //(2'b00),

	// Interrupts
	.pic_ints_i			(or1k_irq),
	.sig_tick			(sig_tick),

	.pm_cpustall_i			(1'b0)
);


////////////////////////////////////////////////////////////////////////
//
// Debug Interface
//
////////////////////////////////////////////////////////////////////////

adbg_top dbg_if0 (
	// OR1K interface
	.cpu0_clk_i	(wb_clk),
	.cpu0_rst_o	(or1k_dbg_rst),
	.cpu0_addr_o	(or1k_dbg_adr_i),
	.cpu0_data_o	(or1k_dbg_dat_i),
	.cpu0_stb_o	(or1k_dbg_stb_i),
	.cpu0_we_o	(or1k_dbg_we_i),
	.cpu0_data_i	(or1k_dbg_dat_o),
	.cpu0_ack_i	(or1k_dbg_ack_o),
	.cpu0_stall_o	(or1k_dbg_stall_i),
	.cpu0_bp_i	(or1k_dbg_bp_o),

	// TAP interface
	.tck_i		(xilinx_internal_jtag_clk), //(dbg_tck),
	.tdi_i		(jtag_tap_tdo),
	.tdo_o		(dbg_if_tdo),
	.rst_i		(xilinx_internal_jtag_rst),//(wb_rst),
	.capture_dr_i	(jtag_tap_capture_dr),
	.shift_dr_i	(jtag_tap_shift_dr),
	.pause_dr_i	(jtag_tap_pause_dr),
	.update_dr_i	(jtag_tap_update_dr),
	.debug_select_i	(dbg_if_select),

	// Wishbone debug master
	.wb_rst_i	(wb_rst),
	.wb_clk_i	(wb_clk),
	.wb_dat_i	(wb_s2m_dbg_dat),
	.wb_ack_i	(wb_s2m_dbg_ack),
	.wb_err_i	(wb_s2m_dbg_err),

	.wb_adr_o	(wb_m2s_dbg_adr),
	.wb_dat_o	(wb_m2s_dbg_dat),
	.wb_cyc_o	(wb_m2s_dbg_cyc),
	.wb_stb_o	(wb_m2s_dbg_stb),
	.wb_sel_o	(wb_m2s_dbg_sel),
	.wb_we_o	(wb_m2s_dbg_we),
	.wb_cti_o	(wb_m2s_dbg_cti),
	.wb_bte_o	(wb_m2s_dbg_bte)
);

////////////////////////////////////////////////////////////////////////
//
// ROM
//
////////////////////////////////////////////////////////////////////////

assign	wb_s2m_rom0_err = 1'b0;
assign	wb_s2m_rom0_rty = 1'b0;

`ifdef BOOTROM
rom #(.addr_width(rom0_aw))
rom0 (
	.wb_clk		(wb_clk),
	.wb_rst		(wb_rst),
	.wb_adr_i	(wb_m2s_rom0_adr[(rom0_aw + 2) - 1 : 2]),
	.wb_cyc_i	(wb_m2s_rom0_cyc),
	.wb_stb_i	(wb_m2s_rom0_stb),
	.wb_cti_i	(wb_m2s_rom0_cti),
	.wb_bte_i	(wb_m2s_rom0_bte),
	.wb_dat_o	(wb_s2m_rom0_dat),
	.wb_ack_o	(wb_s2m_rom0_ack)
);
`else
assign	wb_s2m_rom0_dat_o = 0;
assign	wb_s2m_rom0_ack_o = 0;
`endif
////////////////////////////////////////////////////////////////////////
//
// SDRAM Memory Controller
//
////////////////////////////////////////////////////////////////////////

wire	[15:0]	sdram_dq_i;
wire	[15:0]	sdram_dq_o;
wire		sdram_dq_oe;

assign	sdram_dq_i = sdram_dq_pad_io;
assign	sdram_dq_pad_io = sdram_dq_oe ? sdram_dq_o : 16'bz;
assign	sdram_clk_pad_o = sdram_clk;

assign	wb_s2m_sdram_ibus_err = 0;
assign	wb_s2m_sdram_ibus_rty = 0;

assign	wb_s2m_sdram_dbus_err = 0;
assign	wb_s2m_sdram_dbus_rty = 0;
wb_sdram_ctrl #(

//    	.TECHNOLOGY		("XILINX"),
	.CLK_FREQ_MHZ		(50),// sdram_clk freq in MHZ
	.POWERUP_DELAY		(200),// power up delay in us
	.WB_PORTS		(2),// Number of wishbone ports
	.ROW_WIDTH		(15),// Row width
	.COL_WIDTH		(9),// Column width
	.BA_WIDTH		(2),// Ba width
	.tCAC			(2),// CAS Latency
	.tRAC			(5),// RAS Latency
	.tRP			(2),// Command Period (PRE to ACT)
	.tRC			(7),// Command Period (REF to REF /
	.tMRD			(2)// Mode Register Set To Command
)

wb_sdram_ctrl0 (
// External SDRAM interface
.ba_pad_o	(sdram_ba_pad_o[1:0]),
.a_pad_o	(sdram_a_pad_o[12:0]),
.cs_n_pad_o	(sdram_cs_n_pad_o),
.ras_pad_o	(sdram_ras_pad_o),
.cas_pad_o	(sdram_cas_pad_o),
.we_pad_o	(sdram_we_pad_o),
.dq_i		(sdram_dq_i[15:0]),
.dq_o		(sdram_dq_o[15:0]),
.dqm_pad_o	(sdram_dqm_pad_o[1:0]),
.dq_oe		(sdram_dq_oe),
.cke_pad_o	(sdram_cke_pad_o),
.sdram_clk	(sdram_clk),
.sdram_rst	(sdram_rst),

.wb_clk		(wb_clk),
.wb_rst		(wb_rst),

.wb_adr_i	({wb_m2s_sdram_ibus_adr, wb_m2s_sdram_dbus_adr}),
.wb_stb_i	({wb_m2s_sdram_ibus_stb, wb_m2s_sdram_dbus_stb}),
.wb_cyc_i	({wb_m2s_sdram_ibus_cyc, wb_m2s_sdram_dbus_cyc}),
.wb_cti_i	({wb_m2s_sdram_ibus_cti, wb_m2s_sdram_dbus_cti}),
.wb_bte_i	({wb_m2s_sdram_ibus_bte, wb_m2s_sdram_dbus_bte}),
.wb_we_i	({wb_m2s_sdram_ibus_we,  wb_m2s_sdram_dbus_we }),
.wb_sel_i	({wb_m2s_sdram_ibus_sel, wb_m2s_sdram_dbus_sel}),
.wb_dat_i	({wb_m2s_sdram_ibus_dat, wb_m2s_sdram_dbus_dat}),
.wb_dat_o	({wb_s2m_sdram_ibus_dat, wb_s2m_sdram_dbus_dat}),
.wb_ack_o	({wb_s2m_sdram_ibus_ack, wb_s2m_sdram_dbus_ack})
);




////////////////////////////////////////////////////////////////////////
//
// UART0
//
////////////////////////////////////////////////////////////////////////

wire	uart0_irq;

uart_top uart16550_0 (
	// Wishbone slave interface
	.wb_clk_i	(wb_clk),
	.wb_rst_i	(wb_rst),
	.wb_adr_i	(wb_m2s_uart0_adr[uart0_aw-1:0]),
	.wb_dat_i	(wb_m2s_uart0_dat),
	.wb_we_i	(wb_m2s_uart0_we),
	.wb_stb_i	(wb_m2s_uart0_stb),
	.wb_cyc_i	(wb_m2s_uart0_cyc),
	.wb_sel_i	(4'b0), // Not used in 8-bit mode
	.wb_dat_o	(wb_s2m_uart0_dat),
	.wb_ack_o	(wb_s2m_uart0_ack),

	// Outputs
	.int_o		(uart0_irq),
	.stx_pad_o	(uart0_stx_pad_o),
	.rts_pad_o	(),
	.dtr_pad_o	(),

	// Inputs
	.srx_pad_i	(uart0_srx_pad_i),
	.cts_pad_i	(1'b0),
	.dsr_pad_i	(1'b0),
	.ri_pad_i	(1'b0),
	.dcd_pad_i	(1'b0)
);
/*
`ifdef SPI0
////////////////////////////////////////////////////////////////////////
//
// SPI0 controller
//
////////////////////////////////////////////////////////////////////////

//
// Wires
//
wire            spi0_irq;

//
// Assigns
//
assign  wb_s2m_spi0_err = 0;
assign  wb_s2m_spi0_rty = 0;
assign  spi0_hold_n_o = 1;
assign  spi0_w_n_o = 1;

simple_spi spi0(
	// Wishbone slave interface
	.clk_i	(wb_clk),
	.rst_i	(wb_rst),
	.adr_i	(wb_m2s_spi0_adr[2:0]),
	.dat_i	(wb_m2s_spi0_dat),
	.we_i	(wb_m2s_spi0_we),
	.stb_i	(wb_m2s_spi0_stb),
	.cyc_i	(wb_m2s_spi0_cyc),
	.dat_o	(wb_s2m_spi0_dat),
	.ack_o	(wb_s2m_spi0_ack),

	// Outputs
	.inta_o		(spi0_irq),
	.sck_o		(spi0_sck_o),
	.ss_o		(spi0_ss_o[0]),
	.mosi_o		(spi0_mosi_o),

	// Inputs
	.miso_i		(spi0_miso_i)
);

`endif
*/

////////////////////////////////////////////////////////////////////////
//
// Interrupt assignment
//
////////////////////////////////////////////////////////////////////////

assign or1k_irq[0] = 0; // Non-maskable inside OR1K
assign or1k_irq[1] = 0; // Non-maskable inside OR1K
assign or1k_irq[2] = uart0_irq;
assign or1k_irq[3] = 0;
assign or1k_irq[4] = 0;//eth0_irq;
assign or1k_irq[5] = 0;//ps2_0_irq;
assign or1k_irq[6] = 0;//spi0_irq;
assign or1k_irq[7] = 0;
assign or1k_irq[8] = 0;//vga0_irq;
assign or1k_irq[9] = 0;
assign or1k_irq[10] = 0;
assign or1k_irq[11] = 0;
assign or1k_irq[12] = 0;//ac97_irq;
assign or1k_irq[13] = 0;//ps2_1_irq;
assign or1k_irq[14] = 0;//ps2_2_irq;
assign or1k_irq[15] = 0;
assign or1k_irq[16] = 0;
assign or1k_irq[17] = 0;
assign or1k_irq[18] = 0;
assign or1k_irq[19] = 0;
assign or1k_irq[20] = 0;
assign or1k_irq[21] = 0;
assign or1k_irq[22] = 0;
assign or1k_irq[23] = 0;
assign or1k_irq[24] = 0;
assign or1k_irq[25] = 0;
assign or1k_irq[26] = 0;
assign or1k_irq[27] = 0;
assign or1k_irq[28] = 0;
assign or1k_irq[29] = 0;
assign or1k_irq[30] = 0;
assign or1k_irq[31] = 0;

endmodule // orpsoc_top
