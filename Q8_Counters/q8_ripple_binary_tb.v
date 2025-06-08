`timescale 1ns/1ns
`include "q8_ripple_binary_design.v"

module ripple_binary_tb();
    reg [3:0] count;
    wire [3:0] q;
    reg clk, reset;

    ripple_counter_binary uut(
        .count(count),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("q8_ripple_binary.vcd");
        $dumpvars(0, ripple_binary_tb);
        reset =1;
        #10;
        reset = 0;

        for (integer i = 0;i< 16;i = i+1)
        begin
            count = i;
            #10;
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, count = %d, out = %b", $time, clk, count, q);
    end
endmodule