`timescale 1ns/1ns

module four_bit_cla(input [3:0] A, B, input C0, output [3:0] S, output Cout);
    wire [4:0] C;

    // Propagate and Generate Block
    xor(P0, A[0], B[0]);
    xor(P1, A[1], B[1]);
    xor(P2, A[2], B[2]);
    xor(P3, A[3], B[3]);

    and(G0, A[0], B[0]);
    and(G1, A[1], B[1]);
    and(G2, A[2], B[2]);
    and(G3, A[3], B[3]);

    // Carry Lookahead Block
    // C[1] = G0 + P0*C0
    and(x1, P0, C0);
    
    // C[2] = G1 + P1*G0 + P1*P0*C0
    and(x2, P1, G0);
    and(x3, P1, P0, C0);
    
    // C[3] = G2 + P2*G1 + P2*P1*G0 + P2*P1*P0*C0
    and(x4, P2, G1);
    and(x5, P2, P1, G0);
    and(x6, P2, P1, P0, C0);
    
    // C[4] = G3 + P3*G2 + P3*P2*G1 + P3*P2*P1*G0 + P3*P2*P1*P0*C0
    and(x7, P3, G2);
    and(x8, P3, P2, G1);
    and(x9, P3, P2, P1, G0);
    and(x10, P3, P2, P1, P0, C0);  
    
    assign C[0] = C0; 
    or(C[1], G0, x1);
    or(C[2], G1, x2, x3);
    or(C[3], G2, x4, x5, x6);
    or(C[4], G3, x7, x8, x9, x10);
    
    // Sum Block
    xor(S[0], P0, C[0]);
    xor(S[1], P1, C[1]);
    xor(S[2], P2, C[2]);
    xor(S[3], P3, C[3]);

    assign Cout = C[4];
endmodule

// use 4 bit cla to design 16 bit cla
module sixteen_bit_cla(input [15:0] A, B, input C0, output [15:0] S, output Cout);
    wire [3:0] C;

    four_bit_cla uut0(
        .A(A[3:0]),
        .B(B[3:0]),
        .C0(C0),
        .S(S[3:0]),
        .Cout(C[0])
    );

    four_bit_cla uut1(
        .A(A[7:4]),
        .B(B[7:4]),
        .C0(C[0]),
        .S(S[7:4]),
        .Cout(C[1])
    );

    four_bit_cla uut2(
        .A(A[11:8]),
        .B(B[11:8]),
        .C0(C[1]),
        .S(S[11:8]),
        .Cout(C[2])
    );

    four_bit_cla uut3(
        .A(A[15:12]),
        .B(B[15:12]),
        .C0(C[2]),
        .S(S[15:12]),
        .Cout(C[3])
    );

    assign Cout = C[3];
endmodule

