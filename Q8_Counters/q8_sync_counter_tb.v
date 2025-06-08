`timescale 1ns/1ns
`include "q8_sync_counter_design.v"

module sync_counter_test();
    reg [3:0] count;
    reg clk, reset, en;
    wire [3:0] A;

    sync_counter uut(
        .clk(clk),
        .reset(reset),
        .en(en),
        .count(count),
        .A(A)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("q8_sync_counter.vcd");
        $dumpvars(0, sync_counter_test);
        reset =1;
        #10;
        reset = 0;

        for (integer i = 0;i< 16;i = i+1)
        begin
            en = 1;
            count = i;
            #10;
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, count = %d, reset = %b, out = %b", $time, clk, count, reset, A);
    end
endmodule