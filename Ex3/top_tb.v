//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Mikael Yeghiazaryan
// Date: 15/06/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
	//Todo: Parameters
	parameter CLK_PERIOD = 10;

	//Todo: Registers and wires
	reg clk;
	reg err;
	reg rst;
	reg enable;
	reg direction;
	reg [7:0] counter;

	//Todo: Clock generation
	initial
	    begin
	       clk = 1'b0;
	       forever
		begin
		 #(CLK_PERIOD/2) clk=~clk;
		$display("Clock value = %d", clk);
		end
	     end
	
//Todo: User logic
	initial
	begin
	
	// variables	
	err = 0; // initially there're no errors
	direction = 1; // go upwards
	rst = 1; // initially reset it
	
	// start looping
	forever
	begin

	if (rst)
	rst = 0;

	end

	end
    
//Todo: Finish test, check for success
	// test for success
	initial begin
		#50 
		if (err==0)
		  $display("***TEST PASSED! :) ***");
		$finish;
	      end

//Todo: Instantiate counter module
	counter top(
	.clk(clk),
	.rst(rst),
	.enable(enable),
	.direction(direction),
	.counter(counter_out)
);
 
endmodule 
