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
	parameter clk_period = 10;
	integer i = 0; // counter
	wire [2:0] result; // MUX output

	dice_or_traffic_lights top(.sel(sel), .button(button), .rst(rst), .clk(clk), .result(result)); // connect to top

	initial
	begin
    clk = 0; // clk starts at 0
    button = 1; // button pressed
    sel = 1; // initially select = 1
	forever
	begin
	
	// clock control begin
	#(clk_period / 2); // change state each half a period
	clk =~ clk;
	// clock control end
	
	// select control begin
	if (i == 30)
	sel <= 0; // select = 0
	else
	begin
	if (i == 70)
	button <= 0; // button = 0
	else
	begin
	if (i == 50)
	begin
	rst <= 1;
	#10;
	rst <= 0;
	end
	end
	end
	// select control end
	
	i = i + 1; // counter increment
	end
	end
	
	// reset control
	initial
	begin
	rst <= 1;
	#5;
	rst <= 0;
	end

endmodule
