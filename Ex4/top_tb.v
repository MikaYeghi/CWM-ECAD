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
	integer i = 0; // counter for clock ticks
	wire [2:0] counter;

	dice top(.rst(rst), .clk(clk), .button(button), .dice(counter));

    // clock control
	initial
	begin
	clk = 0;
	button = 0;
	forever
	begin
	// clock control begin
	#5;
	clk=~clk;
	i = i + 1;
	// clock control end
	
	// button control begin
	if (i == 10)
	button = 1;
	else
	begin
	if (i == 26)
	button = 0;
	if (i == 35)
	rst <= 1;
	if  (i == 45)
	begin
	button <= 1;
	rst <= 0;
	end
	if (i == 60)
	button <= 0;
	end
	// button control end
	
	end
	end

	// reset control
	initial
	begin
	rst = 1;
	#10;
	rst = 0;
	end

endmodule
