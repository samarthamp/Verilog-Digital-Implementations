`timescale 1ns/1ns

// Reset is active high
module RS_flipflop(input R, S, input clk, input reset, output reg q, qbar);
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else begin
            if (R & ~S) begin
                q <= 1'b0;
                qbar <= 1'b1;
            end
            else if (~R & S) begin
                q <= 1'b1;
                qbar <= 1'b0;
            end
            else if (R & S) begin
                q <= 1'b1;
                qbar <= 1'b1;
            end
        end
    end
endmodule