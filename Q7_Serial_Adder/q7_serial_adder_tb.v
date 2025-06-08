`timescale 1ns/1ns
`include "q7_serial_adder_design.v"

    // module three_bit_SR_test();
    //     reg [2:0] A;
    //     reg clk = 0;
    //     reg reset = 0;
    //     reg d;
    //     wire q;

    //     three_bit_SR2 uut(
    //         .clk(clk),
    //         .reset(reset),
    //         .d(d),
    //         .A(A),
    //         .q(q)
    //     );

    //     initial begin
    //         $dumpfile("q7_SR.vcd");
    //         $dumpvars(0, three_bit_SR_test);
    //         for (integer i = 0;i< 3;i = i+1)
    //         begin
    //             for (integer j = 0;j< 2;j = j+1)
    //             begin
    //                 A = 6;
    //                 d = A[i];
    //                 clk = j;
    //                 reset = 0;
    //                 #10;
    //             end
    //         end
    //         $finish;
    //     end

    //     initial begin
    //         $monitor("Time = %0t: clk = %b, d = %b, q = %b", $time, clk, d, q);
    //     end
    // endmodule

module three_bit_SA_test();
    reg [2:0] A, B;
    reg clk, reset, d;
    wire [2:0] q;
    wire Cout;

    three_bit_SA uut(
        .clk(clk),
        .reset(reset),
        .d(d),
        .A(A),
        .B(B),
        .Cout(Cout),
        .q(q)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("q7_SA.vcd");
        $dumpvars(0, three_bit_SA_test);
        reset =1;
        d = 0;
        #10;
        reset = 0;
        
        for (integer i = 0;i< 3;i = i+1)
        begin
            A = 3;
            B = 4;
            d = A[i];
            #10;
        end
        $display("A is loaded onto B");
        
        for (integer i = 0;i< 3;i = i+1)
        begin
            A = 3;
            B = 4;
            d = B[i];
            #10;
        end
        $display("B is loaded");
        
        for (integer i = 0;i< 3;i = i+1)
        begin
            d = 0;
            #10;
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: clk = %b, d = %b, reset = %b, Cout = %b, q = %b", $time, clk, d, reset, Cout, q);
    end
endmodule