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

`timescale 1ns/100ps

module counter(input rst,
                     enable,
                     direction,
                     clk,
    output [7:0] counter_out);
    reg [7:0] counter;

// counter code
    always @(posedge clk or posedge rst)
        begin
            if (rst) // if reset = 1
                begin
                    counter <= 0; // reset the counter to 0
                end // end if reset = 1

            else // if reset = 0
                begin
                    if (enable) // if enable = 1
                        begin

                            if (direction) // if direction = 1
                                begin
                                    counter <= counter+1; // +1
                                end // end if direction = 1
                            else // if direction = 0
                                begin
                                    counter <= counter-1; // -1
                                end // end if direction = 0

                        end // end if enable = 1
                    else // if enable = 0
                        begin
                            counter <= counter; // counter doesn't change
                        end // end if enable = 0
                    $display("Counter = %b", counter);
                end // end if reset = 0

        end // end always

    assign counter_out = counter;

endmodule
