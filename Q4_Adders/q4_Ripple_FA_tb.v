`timescale 1ns/1ns
`include "q4_Ripple_FA_design.v"

// module one_bit_FA_test();
//     reg A, B, Cin;
//     wire S, Cout;
//     one_bit_FA uut(
//         .A(A),
//         .B(B),
//         .Cin(Cin),
//         .S(S),
//         .Cout(Cout)
//     );

//     initial begin
//         $dumpfile("q4_Ripple_FA.vcd");
//         $dumpvars(0, one_bit_FA_test);
//         for (integer i = 0;i< 2;i = i+1)
//         begin
//             for (integer j = 0;j< 2;j = j+1)
//             begin
//                 for (integer k = 0;k< 2;k = k+1)
//                 begin
//                     A = i;
//                     B = j;
//                     Cin = k;
//                     #10;
//                 end
//             end
//         end
//         $finish;
//     end

//     initial begin
//         $monitor("Time = %0t: A = %b, B = %b, Cin = %b,Cout = %b, S = %b", $time, A, B, Cin, Cout, S);
//     end
// endmodule

// module four_bit_FA_test();
//     reg [3:0] A, B; 
//     reg Cin;
//     wire [3:0] S;
//     wire Cout;
//     four_bit_FA uut(
//         .A(A),
//         .B(B),
//         .Cin(Cin),
//         .S(S),
//         .Cout(Cout)
//     );

//     initial begin
//         $dumpfile("q4_Ripple_FA.vcd");
//         $dumpvars(0, four_bit_FA_test);
//         for (integer i = 0;i< 16;i = i+1)
//         begin
//             for (integer j = 0;j< 16;j = j+1)
//             begin
//                 for (integer k = 0;k< 2;k = k+1)
//                 begin
//                     A = i;
//                     B = j;
//                     Cin = k;
//                     #10;
//                 end
//             end
//         end
//         $finish;
//     end

//     initial begin
//         $monitor("Time = %0t: A = %b, B = %b, Cin = %b,Cout = %b, S = %b%b%b%b", $time, A, B, Cin, Cout, S[3], S[2], S[1], S[0]);
//     end
// endmodule

module sixteen_bit_FA_test();
    reg [15:0] A, B; 
    reg Cin;
    wire [15:0] S; 
    wire Cout;
    sixteen_bit_FA uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("q4_Ripple_FA.vcd");
        $dumpvars(0, sixteen_bit_FA_test);
        
        $display("Testcase -1");
        A = 11256;
        B = 17958;
        Cin = 1;
        $display("A = %d, B = %d, C = %d", A, B, Cin);
        #10;
        $display("Expected Answer = %d", A + B + Cin);
        $display("Answer calculated = %d\n", S);
        Cin = 0;
        #10;
        
        $display("Testcase -2");
        A = 24159;
        B = 38967;
        Cin = 0;
        $display("A = %d, B = %d, C = %d", A, B, Cin);
        #10;
        $display("Expected Answer = %d", A + B + Cin);
        $display("Answer calculated = %d", S);
        #10;

        $finish;
    end

    initial begin
        // $monitor("Time = %0t: A = %b, B = %b, Cin = %b,Cout = %b, S = %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b", 
        // $time, A, B, Cin, Cout, S[15], S[14], S[13], S[12], S[11], S[10], S[9], 
        // S[8], S[7], S[6], S[5], S[4], S[3], S[2], S[1], S[0]);
    end
endmodule