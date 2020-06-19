//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top(
    input clk_p,
    input clk_n,
     //Todo: add all other ports besides clk_n and clk_p
	input rst_n,
	input button,
	output led_0,
	output led_1,
	output led_2
   );
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

//Add logic here
    reg [2:0] led_out;
    always @(posedge clk or negedge clk)
    begin
    if (rst_n || button)
    led_out <= 3'b000;
    else
    begin
    if (clk)
    led_out <= 3'b111;
    else
    led_out <= 3'b000;
    end 
    end
    
	assign led_0 = led_out[0];
	assign led_1 = led_out[1];
	assign led_2 = led_out[2];

endmodule
