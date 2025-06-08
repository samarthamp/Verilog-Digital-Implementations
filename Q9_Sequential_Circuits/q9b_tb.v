`timescale 1ns/1ns
`include "q9b_design.v"

module q9b_test();
    reg clk, reset;
    wire A, B;

    q9b uut(clk, reset, A, B);

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("q9b.vcd");
        $dumpvars(0, q9b_test);
        reset =1;
        #10;
        reset = 0;

        for (integer i = 0;i< 6;i = i+1)
        begin
            #10;
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, reset = %b, A = %b, B = %b", 
        $time, clk, reset, A, B);
    end

endmodule