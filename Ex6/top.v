//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module dice_or_traffic_lights (
	input sel,
	input button,
	input rst,
	input clk,
	output [2:0] result);

	wire red, amber, green; // take the output of traffic_lights
	wire [2:0] thrown; // takes the output of dice
	wire [2:0] out; // takes the output of MUX

	traffic_lights lights(.clk(clk), .red(red), .amber(amber), .green(green)); // connect to traffic_lights
	dice dice(.rst(rst), .clk(clk), .button(button), .dice(thrown)); // connect to dice
	mux multiplexer(.dice(thrown), .red(red), .amber(amber), .green(green), .sel(sel), .out(out)); // connect to multiplexer

	assign result = out;

endmodule
