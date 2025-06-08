`timescale 1ns/1ns

module gates(input A, input B, output And, output Or, output Nor, output Nand, output Xor, output Not, output Xnor);
    assign And = A & B;
    assign Or = A | B;
    assign Nor = ~(A | B);
    assign Nand = ~(A & B);
    assign Xor = A ^ B;
    assign Not = ~A;
    assign Xnor = ~(A ^ B);
endmodule

