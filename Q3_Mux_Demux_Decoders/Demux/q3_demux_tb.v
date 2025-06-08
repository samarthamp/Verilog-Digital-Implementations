`timescale 1ns/1ns

`include "q3_demux_design.v"

// module demux_1x2_test;
//     reg I, S;

//     demux_1x2 uut(
//         .I(I),
//         .S(S),
//         .A(A),
//         .B(B)
//     );

//     initial begin
//         $dumpfile("q3_demux.vcd");
//         $dumpvars(0, demux_1x2_test);

//         for (integer i = 0;i< 2;i = i+1)
//         begin
//             I = 1; S = i;
//             #10;              
//         end
//         $finish;
//     end

//     initial begin
//         $monitor("Time = %0t: I = %b, S = %b, A = %b, B = %b", 
//         $time, I, S, A, B);
//     end
// endmodule

// module demux_1x4_test;
//     reg I;
//     reg [1:0] S;

//     demux_1x4 uut(
//         .I(I),
//         .S(S),
//         .A(A),
//         .B(B),
//         .C(C),
//         .D(D)
//     );

//     initial begin
//         $dumpfile("q3_demux.vcd");
//         $dumpvars(0, demux_1x4_test);

//         for (integer i = 0;i< 4;i = i+1)
//         begin
//             I = 1; S = i;
//             #10; 
//         end
//         $finish;
//     end

//     initial begin
//         $monitor("Time = %0t: I = %b, S = %b, A = %b, B = %b, C = %b, D = %b", 
//         $time, I, S, A, B, C, D);
//     end
// endmodule

module demux_1x8_test;
    reg I;
    reg [2:0] S;

    demux_1x8 uut(
        .I(I),
        .S(S),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G),
        .H(H)
    );

    initial begin
        $dumpfile("q3_demux.vcd");
        $dumpvars(0, demux_1x8_test);

        for (integer i = 0;i< 8;i = i+1)
        begin
            I = 1; S = i;
            #10; 
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: I = %b, S = %b, A = %b, B = %b, C = %b, D = %b, E = %b, F = %b, G = %b, H = %b", 
        $time, I, S, A, B, C, D, E, F, G, H);
    end
endmodule