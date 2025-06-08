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

module updown_counter(input clk, reset, up, down, input [3:0] count, output [3:0] A);
    wire [3:0] Abar;
    not(not_up, up);
    and(int1, down, not_up);

    and(int2, Abar[0], int1);
    and(int3, A[0], up);

    and(int4, Abar[1], int2);
    and(int5, A[1], int3);

    and(int6, Abar[2], int4);
    and(int7, A[2], int5);

    or(in1, up, int1);
    or(in2, int2, int3);
    or(in3, int4, int5);
    or(in4, int6, int7);

    T_flipflop tff0(in1, clk, reset, A[0], Abar[0]);
    T_flipflop tff1(in2, clk, reset, A[1], Abar[1]);
    T_flipflop tff2(in3, clk, reset, A[2], Abar[2]);
    T_flipflop tff3(in4, clk, reset, A[3], Abar[3]);
endmodule