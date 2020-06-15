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
    integer cycles_number = 10;
    wire [7:0] counter;

    counter top(.rst(rst), .enable(enable), .direction(direction), .clk(clk), .counter_out(counter));

    initial
        begin
            clk = 0;
            direction = 1;
            enable = 1;

            for (i = 0; i < cycles_number*2; i = i+1) // give 10 clock cycles
                begin
                    #5;
                    $display("Clock = %b", clk);
                    clk = ~clk;
                end

        end

    initial // resetting
        begin
            rst = 1;
            #2;
            rst = 0;
        end

endmodule
