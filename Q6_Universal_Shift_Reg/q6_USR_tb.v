`timescale 1ns/1ns
`include "q6_USR_design.v"

module Universal_shift_reg_test();
    reg [3:0] I;
    reg [1:0] S;
    reg clk, reset, MSB_in, LSB_in;
    wire [3:0] A;

    Universal_shift_reg uut(
        .I(I),
        .S(S),
        .MSB_in(MSB_in),
        .LSB_in(LSB_in),
        .clk(clk),
        .clear(reset),
        .A(A)
    );

    initial begin
        $dumpfile("q6_USR.vcd");
        $dumpvars(0, Universal_shift_reg_test);
        for (integer i = 0;i< 16;i = i+1)
        begin
            for (integer j = 0;j< 4;j = j+1)
            begin
                for (integer k = 0;k< 2;k = k+1)
                begin
                    for (integer l = 0;l< 2;l = l+1)
                    begin
                        I = i;
                        S = j;
                        MSB_in = k;
                        LSB_in = l;
                        clk = 0;
                        reset = 0;
                        #10;
                        clk = 1;
                        #10;
                    end
                end
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: I = %b, S = %b, MSB_in = %b, LSB_in = %b, clk = %b, A = %b", 
        $time, I, S, MSB_in, LSB_in, clk, A);
    end
endmodule