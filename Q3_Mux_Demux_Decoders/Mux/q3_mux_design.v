`timescale 1ns/1ns

module mux_2x1(input A, input B, input S, output Y_2x1);
    assign Y_2x1 = ((~S) & A) | (S & B);
endmodule

module mux_4x1(input A, input B, input C, input D, input [1:0] S, output Y_4x1);
    mux_2x1 mux_2x1_1(.A(A), .B(B), .S(S[0]), .Y_2x1(Y1));
    mux_2x1 mux_2x1_2(.A(C), .B(D), .S(S[0]), .Y_2x1(Y2));
    mux_2x1 mux_2x1_3(.A(Y1), .B(Y2), .S(S[1]), .Y_2x1(Y_4x1));
endmodule

module mux_8x1(input A, input B, input C, input D, input E, input F, input G, input H, input [2:0] S, output Y_8x1);
    mux_4x1 mux_4x1_1(.A(A), .B(B), .C(C), .D(D), .S(S[1:0]), .Y_4x1(Y1));
    mux_4x1 mux_4x1_2(.A(E), .B(F), .C(G), .D(H), .S(S[1:0]), .Y_4x1(Y2));
    mux_2x1 mux_2x1_1(.A(Y1), .B(Y2), .S(S[2]), .Y_2x1(Y_8x1));
endmodule