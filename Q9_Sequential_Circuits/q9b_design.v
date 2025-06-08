`timescale 1ns/1ns

// Reset is Active High
module q9b(input clk, input reset, output reg A, B);
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            A <= 1'b0;
            B <= 1'b0;
        end
        else begin
            if ((~A) & (~B)) begin
                A <= 1'b0;
                B <= 1'b1;                
            end
            else if ((~A) & B) begin
                A <= 1'b1;
                B <= 1'b0;
            end
            else if (A & (~B)) begin
                A <= 1'b0;
                B <= 1'b0;
            end
            else if (A & B) begin
                A <= 1'b0;
                B <= 1'b0;
            end
        end
    end
endmodule
