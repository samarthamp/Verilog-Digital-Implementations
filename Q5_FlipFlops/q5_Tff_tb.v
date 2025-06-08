`timescale 1ns/1ns
`include "q5_Tff_design.v"

module T_flipflop_test();
    reg T, clk, reset;
    wire q, qbar;
    reg flag;
    T_flipflop uut(
        .T(T),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qbar(qbar)
    );

    initial begin
        $dumpfile("q5_Tff.vcd");
        $dumpvars(0, T_flipflop_test);
        flag = 1;
        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                T = i;
                clk = j;
                if (flag) begin reset = 1; flag = 0; end

                else reset = 0;
                #10;
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: T = %b, clk = %b, reset = %b, q = %b, qbar = %b",
         $time, T, clk, reset, q, qbar);
    end
endmodule