//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();

	reg [2:0] a;
	reg [2:0] b;
	reg enable, clk;
	wire [5:0] result;
	parameter clk_period = 10;
	integer i = 0;

	multiplier top(.a(a), .b(b), .enable(enable), .clk(clk), .result(result));

	initial
	begin
	clk = 0;
	enable = 0;
	a <= 0;
	b <= 0;

	forever
	begin
	
	// clock control begin
	#(clk_period / 2);
	clk =~ clk;
	// clock control end
	
	// enable control begin
	if (i == 15)
	enable = 1;
	else
	begin
	if (i == 20)
	enable = 0;
	end
	// enable control end
	
	// a/b control begin
	if (i == 15)
	begin
	a <= 3'b111;
	b <= 3'b111;
	end
	// a/b control end
	
	i = i + 1;
	end
	end

endmodule
