`timescale 1ns/1ns
`include "q8_updown_counter_design.v"

module updown_counter_tb();
    reg [3:0] count;
    wire [3:0] A;
    reg clk, reset, up, down;
    updown_counter uut(
        .clk(clk),
        .reset(reset),
        .up(up),
        .down(down),
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
        $dumpfile("q8_updown_counter.vcd");
        $dumpvars(0, updown_counter_tb);
        reset =1;
        #10;
        reset = 0;

        for (integer i = 0;i< 16;i = i+1)
        begin
            up = 1;
            down = 0;
            count = i;
            #10;
        end
        $display("Up Counter Done");

        for (integer i = 0;i< 16;i = i+1)
        begin
            up = 0;
            down = 1;
            count = i;
            #10;
        end
        $display("Down Counter Done");
        
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, count = %d, out = %b", $time, clk, count, A);
    end
endmodule