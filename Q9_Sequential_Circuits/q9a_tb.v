`timescale 1ns/1ns
`include "q9a_design.v"

module q9a_test();
    reg clk, reset, x, y;
    wire A, B, z;

    q9a uut(clk, reset, x, y, A, B, z);

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("q9a.vcd");
        $dumpvars(0, q9a_test);
        reset =1;
        x = 0;
        y = 0;
        #10;
        reset = 0;

        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                x = i;
                y = j;
                #10;
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, reset = %b, A = %b, B = %b, x = %b, y = %b, z = %b", 
        $time, clk, reset, A, B, x, y, z);
    end
endmodule
