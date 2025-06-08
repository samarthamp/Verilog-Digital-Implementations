`timescale 1ns/1ns

module one_bit_FA(input A, B, Cin, output S, Cout);
    xor(P, A, B);
    and(G, A, B);
    xor(S, P, Cin);

    and(temp, P, Cin);
    or(Cout, G, temp);
endmodule

module four_bit_FA(input [3:0] A, B, input Cin, output [3:0] S, output Cout);
    wire [3:0] C;
    one_bit_FA uut0(
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .S(S[0]),
        .Cout(C[0])
    );
    one_bit_FA uut1(
        .A(A[1]),
        .B(B[1]),
        .Cin(C[0]),
        .S(S[1]),
        .Cout(C[1])
    );
    one_bit_FA uut2(
        .A(A[2]),
        .B(B[2]),
        .Cin(C[1]),
        .S(S[2]),
        .Cout(C[2])
    );
    one_bit_FA uut3(
        .A(A[3]),
        .B(B[3]),
        .Cin(C[2]),
        .S(S[3]),
        .Cout(C[3])
    );
    assign Cout = C[3];
endmodule

module sixteen_bit_FA(input [15:0] A, B, input Cin, output [15:0] S, output Cout);
    wire [15:0] C;
    four_bit_FA uut0(
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .S(S[3:0]),
        .Cout(C[0])
    );
    four_bit_FA uut1(
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(C[0]),
        .S(S[7:4]),
        .Cout(C[1])
    );
    four_bit_FA uut2(
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(C[1]),
        .S(S[11:8]),
        .Cout(C[2])
    );
    four_bit_FA uut3(
        .A(A[15:12]),
        .B(B[15:12]),
        .Cin(C[2]),
        .S(S[15:12]),
        .Cout(C[3])
    );
    assign Cout = C[3];

endmodule