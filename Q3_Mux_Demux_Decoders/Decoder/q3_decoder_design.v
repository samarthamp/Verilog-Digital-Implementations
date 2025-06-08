`timescale 1ns/1ns

module decoder_1x2(input A, input E, output [1:0] Y);
    assign Y[0] = (~A) & E;
    assign Y[1] = A & E;
endmodule 

module decoder_2x4(input [1:0] A, input E, output [3:0] Y);
    wire [1:0] temp1, temp2, temp3;
    assign en = 1;
    decoder_1x2 decoder_1x2_1(.A(A[1]), .E(E), .Y(temp1));
    decoder_1x2 decoder_1x2_2(.A(A[0]), .E(temp1[0]), .Y(temp2));
    decoder_1x2 decoder_1x2_3(.A(A[0]), .E(temp1[1]), .Y(temp3));
    assign Y[0] = temp2[0];
    assign Y[1] = temp2[1];
    assign Y[2] = temp3[0];
    assign Y[3] = temp3[1];
endmodule   

module decoder_3x8(input [2:0] A, input E, output [7:0] Y);
    wire [1:0] temp1; 
    wire [3:0] temp2, temp3;
    assign en = 1;
    decoder_1x2 decoder_1x2_1(.A(A[2]), .E(E), .Y(temp1));
    decoder_2x4 decoder_2x4_1(.A(A[1:0]), .E(temp1[0]), .Y(temp2));
    decoder_2x4 decoder_2x4_2(.A(A[1:0]), .E(temp1[1]), .Y(temp3));
    assign Y[0] = temp2[0];
    assign Y[1] = temp2[1];
    assign Y[2] = temp2[2];
    assign Y[3] = temp2[3];
    assign Y[4] = temp3[0];
    assign Y[5] = temp3[1];
    assign Y[6] = temp3[2];
    assign Y[7] = temp3[3];
endmodule

