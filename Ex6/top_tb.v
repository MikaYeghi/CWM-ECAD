//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();

	reg clk, button, rst, sel;
	reg clk_period = 10;
	wire [2:0] result; // MUX output

	dice_or_traffic_lights top(.sel(sel), .button(button), .rst(rst), .clk(clk), .result(result)); // connect to top

	initial
	begin
    	clk = 0;
	forever
	begin
	// clock control begin
	#(clk_period / 2); // change state each half a period
	clk =~ clk;
	// clock control end
	end
	end

endmodule
