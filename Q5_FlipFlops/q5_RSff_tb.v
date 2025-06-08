`timescale 1ns/1ns
`include "q5_RSff_design.v"

module RS_flipflop_test();
    reg R, S, clk, reset;
    wire q, qbar;
    RS_flipflop uut(
        .R(R),
        .S(S),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qbar(qbar)
    );

    initial begin
        $dumpfile("q5_RSff.vcd");
        $dumpvars(0, RS_flipflop_test);
        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                for (integer k = 0;k< 2;k = k+1)
                begin
                    R = i;
                    S = j;
                    clk = k;
                    reset = 0;
                    #10;
                end
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: R = %b, S = %b, clk = %b, reset = %b, q = %b, qbar = %b",
         $time, R, S, clk, reset, q, qbar);
    end
endmodule