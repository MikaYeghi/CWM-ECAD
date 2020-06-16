//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps


module top_tb();

	reg rst, clk, button;
	wire [2:0] counter;

	dice top(.rst(rst), .clk(clk), .button(button), .dice(counter));

	initial
	begin

	clk = 0;
	button = 0;

	forever
	begin
	#5;
	clk~=clk;
	end

	end

	// reset
	initial
	begin
	rst = 1;
	#5;
	rst = 0;
	end

endmodule
