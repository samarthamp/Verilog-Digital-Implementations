`timescale 1ns/1ns

// Reset is active high
module D_flipflop(input d, input clk, input reset, output reg q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
