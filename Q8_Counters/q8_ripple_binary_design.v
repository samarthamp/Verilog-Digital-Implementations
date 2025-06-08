`timescale 1ns/1ns

// Reset is active high
module T_flipflop(input T, clk, reset, output reg q, qbar);
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else begin
            if (T) begin
                q <= ~q;
                qbar <= ~qbar;
            end
        end
    end
endmodule

module ripple_counter_binary(input [3:0] count, input clk, reset, output [3:0] q);
    wire [3:0] q;
    wire [3:0] qbar;
    
    T_flipflop tff0(1'b1, clk,  reset, q[0], qbar[0]);
    T_flipflop tff1(1'b1, qbar[0], reset, q[1], qbar[1]);
    T_flipflop tff2(1'b1, qbar[1], reset, q[2], qbar[2]);
    T_flipflop tff3(1'b1, qbar[2], reset, q[3], qbar[3]);
endmodule