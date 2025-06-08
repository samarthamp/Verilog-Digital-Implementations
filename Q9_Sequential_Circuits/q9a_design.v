`timescale 1ns/1ns

// Reset is active high
module D_flipflop(input d, input clk, input reset, output reg q, output reg qbar);
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else begin
            q <= d;
            qbar <= ~d;
        end 
    end
endmodule

// A(t+1) = x.y' + x.B
// B(t+1) = x.A + x.B'
// z = A
module q9a(input clk, reset, x, y, output A, B, z);
    wire A, B, Abar, Bbar;
    // reg in1, in2;
    not(noty, y);
    and(temp1, x, noty);
    and(temp2, x, B);
    and(temp3, x, A);
    and(temp4, x, Bbar);

    or(in1, temp1, temp2);
    or(in2, temp3, temp4);

    D_flipflop dff1(in1, clk, reset, A, Abar);
    D_flipflop dff2(in2, clk, reset, B, Bbar);

    assign z = A;
endmodule