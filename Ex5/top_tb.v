//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();

	wire red, amber, green;
	reg clk;
	parameter clk_period = 10;

	traffic_lights top(.clk(clk), .red(red), .amber(amber), .green(green));

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
