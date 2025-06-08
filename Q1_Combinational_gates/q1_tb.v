`timescale 1ns/1ns

`include "q1_design.v"
module gates_test;
    reg a;
    reg b;
    wire And,Or,Nor, Nand, Xor, Not, Xnor;

    gates uut(
        .A(a),
        .B(b),
        .And(And),
        .Or(Or),
        .Nor(Nor),
        .Nand(Nand),
        .Xor(Xor),
        .Not(Not),
        .Xnor(Xnor)
    );

    initial begin
        $dumpfile("q1.vcd");
        $dumpvars(0, gates_test);

        #0  a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10; $finish;
    end

    initial begin
        $monitor("And Time = %0t: a = %b, b = %b, y = %b", $time, a, b, And);
    end
endmodule