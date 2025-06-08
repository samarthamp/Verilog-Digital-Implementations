`timescale 1ns/1ns

module mux_2x1(input A, input B, input S, output Y_2x1);
    assign Y_2x1 = ((~S) & A) | (S & B);
endmodule

// for 4x1 mux, A(00), B(01), C(10), D(11)
module mux_4x1(input A, input B, input C, input D, input [1:0] S, output Y_4x1);
    mux_2x1 mux_2x1_1(.A(A), .B(B), .S(S[0]), .Y_2x1(Y1));
    mux_2x1 mux_2x1_2(.A(C), .B(D), .S(S[0]), .Y_2x1(Y2));
    mux_2x1 mux_2x1_3(.A(Y1), .B(Y2), .S(S[1]), .Y_2x1(Y_4x1));
endmodule

module D_flipflop(input d, input clk, input reset, output reg q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

/* 
    Universal shift register design
    I: input data
    S: shift control
    MSB_in: input data at MSB
    LSB_in: input data at LSB
    clk: clock
    clear: clear (active high)
    A: output data

    S  | Operation
    00 | No change
    01 | Shift right
    10 | Shift left
    11 | Parallel load
*/
module Universal_shift_reg(input [3:0] I, input [1:0] S, 
input MSB_in, input LSB_in, input clk, input clear, output [3:0] A);
    mux_4x1 mux_0(.A(A[0]), .B(A[1]), .C(LSB_in), .D(I[0]), .S(S), .Y_4x1(Y0));
    mux_4x1 mux_1(.A(A[1]), .B(A[2]), .C(A[0]), .D(I[1]), .S(S), .Y_4x1(Y1));
    mux_4x1 mux_2(.A(A[2]), .B(A[3]), .C(A[1]), .D(I[2]), .S(S), .Y_4x1(Y2));
    mux_4x1 mux_3(.A(A[3]), .B(MSB_in), .C(A[2]), .D(I[3]), .S(S), .Y_4x1(Y3));

    D_flipflop DFF0(.d(Y0), .clk(clk), .reset(clear), .q(A[0]));
    D_flipflop DFF1(.d(Y1), .clk(clk), .reset(clear), .q(A[1]));
    D_flipflop DFF2(.d(Y2), .clk(clk), .reset(clear), .q(A[2]));
    D_flipflop DFF3(.d(Y3), .clk(clk), .reset(clear), .q(A[3]));
endmodule
