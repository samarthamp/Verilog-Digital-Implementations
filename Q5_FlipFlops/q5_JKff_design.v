`timescale 1ns/1ns

// Reset is active high
module JK_flipflop(input J, k, clk, reset, output reg q, output reg qbar);
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else begin
            if (J & ~k) begin
                q <= 1'b1;
                qbar <= 1'b0;
            end
            else if (~J & k) begin
                q <= 1'b0;
                qbar <= 1'b1;
            end
            else if (J & k) begin
                q <= ~q;
                qbar <= q;
            end
        end
    end 
endmodule