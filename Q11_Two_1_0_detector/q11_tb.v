`timescale 1ns/1ns
`include "q11_design.v"

module q11_test();
    reg clk, reset, ONE, ZERO;
    wire out;
    wire [3:0] state;

    q11 uut(
        .clk(clk),
        .reset(reset),
        .ONE(ONE),
        .ZERO(ZERO),
        .state(state),
        .out(out)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("q11.vcd");
        $dumpvars(0, q11_test);
        
        reset =1;
        ONE = 0;
        ZERO = 0;
        #10
        reset = 0;
        ONE = 1; ZERO = 0; #10;
        ONE = 0; ZERO = 1; #10; // back to state 0
        ONE = 1; ZERO = 0; #10;
        ONE = 0; ZERO = 1; #10;
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, reset = %b, ONE = %b, ZERO = %b, State = %b, out = %b", $time, clk, reset, ONE, ZERO, state, out);
    end
endmodule