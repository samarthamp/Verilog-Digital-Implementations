`timescale 1ns/1ns
`include "q3_pri_enc_design.v"
module pri_enc_8x3_test();
    reg [7:0] D;
    wire [2:0] Y;
    wire E = 1'b1;
    pri_enc_8x3 uut(
        .D(D),
        .E(E),
        .Y(Y)
    );

    initial begin
        $dumpfile("q3_pri_enc.vcd");
        $dumpvars(0, pri_enc_8x3_test);
        for (integer i = 0;i< 8;i = i+1)
        begin
            D[i] = 0;
        end
        for (integer i = 0;i< 8;i = i+1)
        begin
            D[i] = 1;
            #10;
            D[i] = 0;
        end
        $finish;
    end

    initial begin
        for (integer i = 0;i< 8;i = i+1)
        begin
            $monitor("Time = %0t: D = %b%b%b%b%b%b%b%b, Y = %b%b%b", $time, D[7], D[6], D[5], 
            D[4], D[3], D[2], D[1], D[0], Y[2], Y[1], Y[0]);
        end
    end
endmodule