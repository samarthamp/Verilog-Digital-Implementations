`timescale 1ns/1ns
`include "q5_JKff_design.v"

module JK_flipflop_test();
    reg J, K, clk, reset;
    wire q, qbar;
    JK_flipflop uut(
        .J(J),
        .k(K),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qbar(qbar)
    );

    initial begin
        $dumpfile("q5_JKff.vcd");
        $dumpvars(0, JK_flipflop_test);
        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                for (integer k = 0;k< 2;k = k+1)
                begin
                    J = i;
                    K = j;
                    clk = k;
                    reset = 0;
                    #10;
                end
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: J = %b, K = %b, clk = %b, reset = %b, q = %b, qbar = %b",
         $time, J, K, clk, reset, q, qbar);
    end
endmodule