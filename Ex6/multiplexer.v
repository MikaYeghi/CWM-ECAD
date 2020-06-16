//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:
// Date: 
//
//  Description: MUX for Ex6 
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic_lights
//
//  inputs:
//           dice, traffic_lights, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
	input [2:0] dice,
	input red,
	input amber,
	input green,
	input sel,
	output [2:0] out		
    );

	//reg [2:0] value_out;

//    initial
//    begin
//    //#5;
//	if (sel)
//	begin
//	value_out <= dice;
//	end
//	else
//	begin
//	value_out <= {red, amber, green};
//	end
//	//#5;
//    end
    
	assign out = (sel == 0) ? dice:
	   {red, amber, green};

endmodule
