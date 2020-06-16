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
`timescale 1ns/100ps

module top_tb();
    reg rst, enable, direction, clk;
    integer i;
    wire [7:0] counter;

    counter top(.rst(rst), .enable(enable), .direction(direction), .clk(clk), .counter_out(counter));

    initial
        begin
            clk = 0;
            direction = 1;
            enable = 1;
	    i = 0;

            forever // cycle forever
                begin
		    i = i + 1;
                    #5;
                    $display("Clock = %b", clk);
                    clk = ~clk;
			// change direction
		    if (i == 30)
		    begin
		    direction <= 0;
		    end

			// reset
			if (i == 50)
			rst <= 1;
			
			if (i == 60)
			begin
			rst <= 0;
			direction <= 1;
			end

			// enable = 0
			if (i == 90)
			begin
			enable <= 0;
			end
			
			if (i == 110)
			begin
			enable = 1;
			direction = 1;
			end			
			
                end

        end

    initial // resetting
        begin
            rst = 1;
            #5;
            rst = 0;
        end

endmodule
