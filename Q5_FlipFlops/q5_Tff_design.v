`timescale 1ns/1ns

// Reset is active high
module T_flipflop(input T, clk, reset, output reg q, qbar);
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else begin
            if (T) begin
                q <= ~q;
                qbar <= ~qbar;
            end
            else begin
                q <= q;
                qbar <= qbar;
            end
        end
    end
endmodule