`timescale 1ns/1ns

// Reset is active high
module D_flipflop(input d, input clk, input reset, output reg q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module one_bit_FA(input x, y, z, output S, Cout);
    xor(P, x, y);
    and(G, x, y);
    xor(S, P, z);

    and(temp, P, z);
    or(Cout, G, temp);
endmodule

module three_bit_SR1(input clk, input reset, input d, input [2:0] A, output[2:0] q);
    D_flipflop D1(d, clk, reset, q1);
    D_flipflop D2(q1, clk, reset, q2);
    D_flipflop D3(q2, clk, reset, q3);

    assign q = {q1, q2, q3};
endmodule

module three_bit_SR2(input clk, input reset, input d, input [2:0] A, output q);
    D_flipflop D1(d, clk, reset, q1);
    D_flipflop D2(q1, clk, reset, q2);
    D_flipflop D3(q2, clk, reset, q3);

    assign q = q3;
endmodule

// shift control = 1 always
module three_bit_SA(input clk, reset, input d, input [2:0] A, input [2:0] B, output [2:0] q, output Cout);
    three_bit_SR1 SR1(clk, reset, S, 3'b0, q);
    three_bit_SR2 SR2(clk, reset, d, 3'b0, y);
    
    one_bit_FA FA1(q[0], y, z, S, Cout);
    D_flipflop D1(Cout, clk, reset, z);
endmodule

