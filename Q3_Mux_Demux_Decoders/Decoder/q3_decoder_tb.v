`timescale 1ns/1ns

`include "q3_decoder_design.v"

// module decoder_1x2_test;
//     reg A;
//     integer temp;
//     wire [1:0] Y;
//     wire E = 1'b1;
//     decoder_1x2 uut(
//         .A(A),
//         .E(E),
//         .Y(Y)
//     );

//     initial begin
//         $dumpfile("q3_decoder.vcd");
//         $dumpvars(0, decoder_1x2_test);

//         for (integer i = 0;i< 2;i = i+1)
//         begin
//             A = i;
//             #10;
//         end
//         $finish;
//     end

//     initial begin
//         for (integer i = 0;i< 2;i = i+1)
//         begin
//             // integer temp = Y[1-i];
//             $monitor("Time = %0t: A = %b, Y = %b%b", $time, A, Y[0], Y[1]);
//         end
//     end
// endmodule

// module decoder_2x4_test;
//     reg [1:0] A;
//     wire E = 1'b1;  
//     wire [3:0] Y;  
//     decoder_2x4 uut(
//         .A(A),
//         .E(E),
//         .Y(Y)
//     );

//     initial begin
//         $dumpfile("q3_decoder.vcd");
//         $dumpvars(0, decoder_2x4_test);

//         for (integer i = 0;i< 4;i = i+1)
//         begin
//             A = i;
//             #10;
//         end
//         $finish;
//     end

//     initial begin
//         for (integer i = 0;i< 4;i = i+1)
//         begin
//             $monitor("Time = %0t: A = %b, B = %b, Y = %b%b%b%b", $time, A[1], A[0], Y[0], Y[1], Y[2], Y[3]);
            
//         end
//     end
// endmodule

module decoder_3x8_test;
    reg [2:0] A;
    wire E = 1'b1;  
    wire [7:0] Y;  
    decoder_3x8 uut(
        .A(A),
        .E(E),
        .Y(Y)
    );

    initial begin
        $dumpfile("q3_decoder.vcd");
        $dumpvars(0, decoder_3x8_test);

        for (integer i = 0;i< 8;i = i+1)
        begin
            A = i;
            #10;
        end
        $finish;
    end

    initial begin
        for (integer i = 0;i< 8;i = i+1)
        begin
            $monitor("Time = %0t: A = %b, B = %b, C = %b, Y = %b%b%b%b%b%b%b%b", $time, A[2], A[1], A[0], Y[0], Y[1], Y[2], Y[3], Y[4], Y[5], Y[6], Y[7]);
            
        end
    end
endmodule