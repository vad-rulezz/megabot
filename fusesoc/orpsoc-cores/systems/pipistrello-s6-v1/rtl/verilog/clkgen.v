/*
 *
 * Clock, reset generation unit for Atlys board
 *
 * Implements clock generation according to design defines
 *
 */
`include "orpsoc-defines.v"

module clkgen
       (
	// Main clocks in, depending on board
	input  sys_clk_pad_i,
	// Asynchronous, active low reset in
	input  rst_n_pad_i,
	// Input reset - through a buffer, asynchronous
	output async_rst_o,

	// Wishbone clock and reset out
	output wb_clk_o,
	output wb_rst_o,
	
	// SDRAM clock and reset out
	output sdram_clk_o,
	output sdram_rst_o

);

wire async_rst_n;
// First, deal with the asychronous reset
assign async_rst_n = rst_n_pad_i;

// Everyone likes active-high reset signals...
assign async_rst_o = ~async_rst_n;



//
// Declare synchronous reset wires here
//


wire	sys_clk_pad_ibufg;



/* DCM0 wires */
wire	dcm0_clk0_prebufg, dcm0_clk0;
wire	dcm0_clkdv_prebufg, dcm0_clkdv;
wire	dcm0_locked;


IBUFG sys_clk_in_ibufg (
	.I	(sys_clk_pad_i),
	.O	(sys_clk_pad_ibufg)
);


// DCM providing main system/Wishbone clock
DCM_SP #(
	.CLKFX_MULTIPLY	(4),
	.CLKFX_DIVIDE	(1),
	.CLKDV_DIVIDE	(2.0),
	.CLKIN_DIVIDE_BY_2("FALSE"),
//	.CLKIN_PERIOD(20.0),
	.CLKOUT_PHASE_SHIFT("NONE"),
	.CLK_FEEDBACK("1X"),
	.DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"),
	.DLL_FREQUENCY_MODE("LOW"),
	.DUTY_CYCLE_CORRECTION("TRUE"),
	.PHASE_SHIFT(0),
	.STARTUP_WAIT("FALSE")
	
) dcm0 (
	// Outputs
	.CLK0		(dcm0_clk0_prebufg),
	.CLK180		(),
	.CLK270		(),
	.CLK2X180	(),
	.CLK2X		(),
	.CLK90		(),
	.CLKDV		(dcm0_clkdv_prebufg),
	.CLKFX180	(),
	.CLKFX		(),
	.LOCKED		(dcm0_locked),
	.PSDONE		(),
	.STATUS		(),
	// Inputs
	.CLKFB		(dcm0_clk0),
	.CLKIN		(sys_clk_pad_ibufg),
	.PSCLK		(1'b0),
	.PSEN		(1'b0),
	.PSINCDEC	(1'b0),
	.RST		(async_rst_o)
);


BUFG dcm0_clk0_bufg
       (// Outputs
	.O	(dcm0_clk0),
	// Inputs
	.I	(dcm0_clk0_prebufg)
);
/*
BUFG dcm0_clk2x_bufg
       (// Outputs
	.O	(dcm0_clk2x),
	// Inputs
	.I	(dcm0_clk2x_prebufg)
);
*/
BUFG dcm0_clkfx_bufg
       (// Outputs
	.O	(dcm0_clkfx),
	// Inputs
	.I	(dcm0_clkfx_prebufg)
);


BUFG dcm0_clkdv_bufg
       (// Outputs
	.O	(dcm0_clkdv),
	// Inputs
	.I	(dcm0_clkdv_prebufg)
);


wire	sync_rst_n;


assign wb_clk_o = dcm0_clkdv;
assign sdram_clk_o = dcm0_clk0;

assign sync_rst_n = dcm0_locked;


//
// Reset generation
//
//

// Reset generation for wishbone
reg [15:0] 	   wb_rst_shr;
always @(posedge wb_clk_o or posedge async_rst_o)
	if (async_rst_o)
		wb_rst_shr <= 16'hffff;
	else
		wb_rst_shr <= {wb_rst_shr[14:0], ~(sync_rst_n)};

assign wb_rst_o = wb_rst_shr[15];

// Reset generation for SDRAM controller
reg [15:0]	sdram_rst_shr;

always @(posedge sdram_clk_o or posedge async_rst_o)
    if (async_rst_o)
	sdram_rst_shr <= 16'hffff;
    else
	sdram_rst_shr <= {sdram_rst_shr[14:0], ~(sync_rst_n)};

assign sdram_rst_o = sdram_rst_shr[15];



endmodule // clkgen
