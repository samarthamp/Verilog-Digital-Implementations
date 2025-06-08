`timescale 1ns/1ns

`include "q3_mux_design.v"

module mux_2x1_test;
    reg A, B, S;

    mux_2x1 uut(
        .A(A),
        .B(B),
        .S(S),
        .Y_2x1(Y_2x1)
    );

    initial begin
        $dumpfile("q3_mux.vcd");
        $dumpvars(0, mux_2x1_test);

        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                for (integer k = 0;k< 2;k = k+1)
                begin
                    A = i; B = j; S = k;
                    #10;
                end                
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: A = %b, B = %b, S = %b, Y_2x1 = %b", 
        $time, A, B, S, Y_2x1);
    end
endmodule

module mux_4x1_test;
    reg A, B, C, D;
    reg [1:0] S;

    mux_4x1 uut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S(S),
        .Y_4x1(Y_4x1)
    );

    initial begin
        $dumpfile("q3_mux.vcd");
        $dumpvars(0, mux_4x1_test);

        for (integer i = 0;i< 2;i = i+1)
        begin
            for (integer j = 0;j< 2;j = j+1)
            begin
                for (integer k = 0;k< 2;k = k+1)
                begin
                    for (integer l = 0;l< 2;l = l+1)
                    begin
                        for (integer m = 0;m< 4;m = m+1)
                        begin
                            A = i; B = j; C = k; D = l; S = m;
                            #10;
                        end
                    end
                end
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: A = %b, B = %b, C = %b, D = %b, S = %b%b Y_4x1 = %b", 
        $time, A, B, C, D, S[1], S[0], Y_4x1);
    end

endmodule

module mux_8x1_test;
    reg A, B, C, D, E, F, G, H;
    reg [2:0] S;

    mux_8x1 uut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G),
        .H(H),
        .S(S),
        .Y_8x1(Y_8x1)
    );

    initial begin
        $dumpfile("q3_mux.vcd");
        $dumpvars(0, mux_8x1_test);

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
                                for (integer o = 0;o< 2;o = o+1)
                                begin
                                    for (integer p = 0;p< 2;p = p+1)
                                    begin
                                        for (integer q = 0;q< 8;q = q+1)
                                        begin
                                            A = i; B = j; C = k; D = l; E = m; F = n; G = o; H = p; S = q;
                                            #10;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: A = %b, B = %b, C = %b, D = %b, E = %b, F = %b, G = %b, H = %b, S = %b%b%b Y_8x1 = %b", 
        $time, A, B, C, D, E, F, G, H, S[2], S[1], S[0], Y_8x1);
    end
endmodule