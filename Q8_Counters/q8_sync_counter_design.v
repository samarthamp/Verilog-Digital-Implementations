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

module sync_counter(input clk, reset, en, input [3:0] count, output [3:0] A);
    wire [3:0] Abar;
    and(in1, A[0], en);
    and(in2, A[1], in1);
    and(in3, A[2], in2);
    T_flipflop tff0(en,  clk, reset, A[0], Abar[0]);
    T_flipflop tff1(in1, clk, reset, A[1], Abar[1]);
    T_flipflop tff2(in2, clk, reset, A[2], Abar[2]);
    T_flipflop tff3(in3, clk, reset, A[3], Abar[3]);
endmodule
