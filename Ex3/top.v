//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
	input clk,
	input rst,
	input enable,
	input direction,
	output reg [7:0] counter_out
    );
                    
    //Todo: add registers and wires, if needed
	reg [7:0] counter_out;
	assign counter_out = counter;
    //Todo: add user logic
	always @(posedge clk or posedge rst)
	begin

	if (rst) // if rst, then set counter to 0
	counter <= 0;

	else // if not rst
	begin

	if (enable) // if enable, then make changes
	begin

	if (direction) // if direction is up, then +1
	counter <= counter + 1;
	else // if direction is down, then -1
	counter <= counter - 1;

	end
	end
	end
endmodule
