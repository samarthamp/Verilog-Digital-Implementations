`timescale 1ns/1ns
`include "q10_mealy_fsm_design.v"

module mealy_fsm_tb();    
    reg clk, reset, x;
    wire [1:0] state;
    wire y;

    mealy_fsm uut(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .state(state)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("q10_mealy_fsm.vcd");
        $dumpvars(0, mealy_fsm_tb);
        
        reset =1;
        x = 0;
        #10
        reset = 0;
        
        x = 0; #20;
        x = 0; #20;
        x = 1; #20;
        x = 1; #20; // back to state 0
        $display("Back to state a");
        x = 1; #20;
        x = 1; #20;
        x = 1; #20; // back to state 0
        $display("Back to state a");
        x = 0; #20;
        x = 1; #20;
        x = 1; #30;
        $display("Back to state a");
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, reset = %b, x = %b, state = %b , y = %b", $time, clk, reset, x, state , y);
    end
endmodule