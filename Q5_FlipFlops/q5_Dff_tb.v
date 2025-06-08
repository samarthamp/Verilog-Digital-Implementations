`timescale 1ns/1ns
`include "q5_Dff_design.v"

module D_flipflop_tb();
    reg d, clk, reset;
    wire q;
    D_flipflop uut(
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        $dumpfile("q5_Dff.vcd");
        $dumpvars(0, D_flipflop_tb);
        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                d = i;
                clk = j;
                reset = 0;
                #10;
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: d = %b, clk = %b, q = %b", $time, d, clk, q);
    end
endmodule