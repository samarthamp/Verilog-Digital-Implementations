`timescale 1ns/1ns

module demux_1x2(input I, input S, output A, output B);
    assign A = (~S) & I;
    assign B = S & I;
endmodule

module demux_1x4(input I, input [1:0] S, output A, output B, output C, output D);
    demux_1x2 demux_1x2_1(.I(I), .S(S[1]), .A(temp1), .B(temp2));
    demux_1x2 demux_1x2_2(.I(temp1), .S(S[0]), .A(A), .B(B));
    demux_1x2 demux_1x2_3(.I(temp2), .S(S[0]), .A(C), .B(D));
endmodule

module demux_1x8(input I, input [2:0] S, output A, output B, output C, output D, output E, output F, output G, output H);
    demux_1x2 demux_1x2_1(.I(I), .S(S[2]), .A(temp1), .B(temp2));
    demux_1x4 demux_1x4_1(.I(temp1), .S(S[1:0]), .A(A), .B(B), .C(C), .D(D));
    demux_1x4 demux_1x4_2(.I(temp2), .S(S[1:0]), .A(E), .B(F), .C(G), .D(H));
endmodule

