`timescale 1ns/1ns
`include "q4_cla_design.v"

module four_bit_cla_test();
    reg [3:0] A, B; 
    reg C0;
    wire [3:0] S; 
    wire Cout;
    four_bit_cla uut(
        .A(A),
        .B(B),
        .C0(C0),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("q4_cla.vcd");
        $dumpvars(0, four_bit_cla_test);
        for (integer i = 0;i< 16;i = i+1)
        begin
            for (integer j = 0;j< 16;j = j+1)
            begin
                for (integer k = 0;k< 2;k = k+1)
                begin
                    A = i;
                    B = j;
                    C0 = k;
                    #10;
                end
            end
        end
        $finish;
    end

    initial begin
        $monitor("Time = %0t: A = %b, B = %b, C0 = %b,Cout = %b, S = %b", $time, A, B, C0, Cout, S);
    end
endmodule

// module sixteen_bit_cla_test();
//     reg [15:0] A, B; 
//     reg C0;
//     wire [15:0] S; 
//     wire Cout;
//     sixteen_bit_cla uut(
//         .A(A),
//         .B(B),
//         .C0(C0),
//         .S(S),
//         .Cout(Cout)
//     );

//     initial begin
//         $dumpfile("q4_cla.vcd");
//         $dumpvars(0, sixteen_bit_cla_test);
    
//         $display("Testcase -1");
//         A = 23541;
//         B = 12352;
//         C0 = 1;
//         $display("A = %d, B = %d, C = %d", A, B, C0);
//         #10;
//         $display("Expected Answer = %d", A + B + C0);
//         $display("Answer calculated = %d\n", S);
//         C0 = 0;
//         #10;
        
//         $display("Testcase -2");
//         A = 12343;
//         B = 12368;
//         C0 = 0;
//         $display("A = %d, B = %d, C = %d", A, B, C0);
//         #10;
//         $display("Expected Answer = %d", A + B + C0);
//         $display("Answer calculated = %d", S);
//         #10;

//         $finish;
//     end

//     initial begin
//         // $monitor("Time = %0t: A = %b, B = %b, C0 = %b,Cout = %b, S = %b", $time, A, B, C0, Cout, S);
//     end 
// endmodule