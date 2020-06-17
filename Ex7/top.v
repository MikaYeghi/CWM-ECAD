//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module multiplier(
	input [2:0] a,
	input [2:0] b,
	input enable,
	input clk,
	output [5:0] result);

	wire wea; // not used in the core module
	wire [5:0] dina; // not used in the core module
	wire [5:0] addra;

	assign wea = 0;
	assign dina = 0;
	assign addra = {a, b};

	mybram your_instance_name (
	  .clka(clk),    // input wire clka
	  .ena(enable),      // input wire ena
	  .wea(wea),      // input wire [0 : 0] wea
	  .addra(addra),  // input wire [5 : 0] addra
	  .dina(dina),    // input wire [5 : 0] dina
	  .douta(result)  // output wire [5 : 0] douta
	);

endmodule
