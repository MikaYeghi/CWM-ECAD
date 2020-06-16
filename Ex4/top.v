//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module dice(
	input rst,
	input clk,
	input button,
	output [2:0] dice
);
	reg [2:0] counter; // counter for the dice

	// dice code
	always @(posedge clk or posedge rst)
	begin
	// begin always
	
	if (rst) // if reset = 1
	counter <= 3b'001; // reset to 001
	else // if reset = 0
	begin
	// begin reset = 0

	if (button) // if button = 1 (pressed)
	begin
	case (counter)
	3'b001: counter = 3'b010; // 1->2
	3'b010: counter = 3'b011; // 2->3
	3'b011: counter = 3'b100; // 3->4
	3'b100: counter = 3'b101; // 4->5
	3'b101: counter = 3'b110; // 5->6
	3'b110: counter = 3'b001; // 6->1
	default: counter = 3'b001; // default - 1
	end
	else // if button = 0 (not pressed)
	counter <= counter; // counter doesn't change it's value

	// end reset = 0b
	end

	// end always
	end

	assign dice = dice;

endmodule

