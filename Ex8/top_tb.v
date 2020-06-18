//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();

	reg clk, enable, rst;
	reg [2:0] a;
	reg [2:0] b;
	wire [5:0] result;
	parameter clk_period = 10;
	integer i = 0;

	multiplier_with_axi4 top(
	.clk(clk),
	.enable(enable),
	.rst(rst),
	.a(a),
	.b(b),
	.result(result));

	initial
	begin
	clk = 0;
	enable = 0;
	a = 3'b000; // set initial value
	b = 3'b000; // set initial value
	
	forever
	begin
	// clock control begin
	#(clk_period / 2);
	clk =~ clk;
	// clock control end
	
	// a/b control begin
	if (i == 10)
	begin
	a <= 3'b111;
	b <= 3'b010;
	end
	else
	begin
	if (i == 15)
	begin
	a <= 3'b101;
	b <= 3'b111;
	end
	end
	// a/b control end
	
	// enable control begin
	if (i == 5)
	enable <= 1;
	else
	begin
	if (i == 12)
	enable <= 0;
	else
	begin
	if (i == 26)
	enable <= 1;
	else
	begin
	if (i == 29)
	enable <= 0;
	end
	end
	end
	// enable control end
	
	i = i + 1;
	end
	end
	
	// initial reset
	initial
	begin
	rst <= 1;
//	#(clk_period);
//	rst <= 0;
	end

endmodule