`timescale 1ns/1ns

`include "q2_design.v"
module comb_ckt_test;
    reg A, B, C, D, E, F;

    comb_ckt uut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .Y5(Y5),
        .temp(temp)
    );

    initial begin
        $dumpfile("q2.vcd");
        $dumpvars(0, comb_ckt_test);

        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                for (integer k = 0;k< 2;k = k+1)
                begin
                    for (integer l = 0;l< 2;l = l+1)
                    begin
                        for (integer m = 0;m< 2;m = m+1)
                        begin
                            for (integer n = 0;n< 2;n = n+1)
                            begin
                                A = i; B = j; C = k; D = l; E = m; F = n;
                                #10;
                            end
                        end
                    end
                end                
            end
        end
        
        $finish;
    end

    initial begin
        $monitor("Time = %0t: A = %b, B = %b, C = %b, D = %b, E = %b, F = %b, Y5 = %b, temp = %b", 
        $time, A, B, C, D, E, F, Y5, temp);
    end
endmodule