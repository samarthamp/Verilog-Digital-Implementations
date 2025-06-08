`timescale 1ns/1ns

module comb_ckt(input A, input B, input C, input D, input E, input F, 
output Y1, output Y2, output Y3, output Y4, output Y5, output temp);
    
    // int_x are the intermediate wires used for making connections between gates
    nand(int1, A, B);
    nand(int2, C, D);
    nand(Y1, int1, int2);

    nand(int3, A, B, C);
    nand(int5, int3, int3);
    nand(int4, D, E);
    nand(int6, int4, int4);
    nor(int7, int5, int6);
    nand(int8, F, F);
    nor(Y2, int7, int8);

    nand(int9, A, A);
    nand(int10, int9, B);
    nand(int11, C, D);
    nand(int12, E, E);
    nand(int13, int11, int12);
    nand(Y3, int10, int13);

    nand(int14, A, A);
    nand(int15, int14, D);
    nand(int16, B, D);
    nand(Y4, int15, int16);

    nand(notB, B, B);
    nand(notC, C, C);
    nand(notD, D, D);
    nand(int17, C, notD);
    nand(int18, notB, notD);
    nand(int19, A, B, notC, D);
    nand(Y5, int17, int18, int19);

    // Cross - verification
    // assign temp = ((A & B) | (C & D));
    // assign temp = ((A & B & C) | (D & E)) & F;
    // assign temp = ~( (A | (~B)) & ((C & D) | E) );
    // assign temp = ((~A) & D) | (B  & D);
    assign temp = (C & (~D)) | ((~B) & (~D)) | (A & B & (~C) & D);
endmodule