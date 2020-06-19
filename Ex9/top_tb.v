//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #9  
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex9
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();

	reg rst_n, button;
	integer i = 0;
	wire [2:0] led;
	
	// connect to top

	initial
	begin
	rst_n = 0;
	button = 0;

	forever
	begin
	// reset control begin
	if (i == 5)
	rst_n <= 1;
	// reset control end

	// button control begin
	if (i == 5)
	button <= 1;
	// button control end

	i = i + 1;
	end
	end

endmodule
