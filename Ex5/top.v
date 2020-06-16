//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module traffic_lights(
		input clk,
		output red,
		output amber,
		output green);

	reg [2:0] state; // storing the state in a register

	always @(posedge clk)
	begin
	// begin always

	case (state)
	3'b100: state = 3'b110; // red -> red, amber
	3'b110: state = 3'b001; // reg, amber -> green
	3'b001: state = 3'b010; // green -> amber
	3'b010: state = 3'b100; // amber -> red
	default: state = 3'b100; // default - red
	endcase

	// end always
	end

	assign red = state[2]; // assign red
	assign amber = state[1]; // assign amber
	assign green = state[0]; // assign green

endmodule
