`timescale 1ns/1ns

// Reset is Active High
module mealy_fsm(input clk, reset, input x, output reg y, output reg [1:0] state);
    reg [1:0] next_state;

    parameter S_a = 2'b00, S_b = 2'b01, S_c = 2'b10, S_d = 2'b11;
    
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            state <= S_a;
            next_state <= S_a;
            y <= 1'b0;
        end
        else begin
            state <= next_state;
            case (state)
                S_a: begin
                    if (x==1)
                    begin
                        next_state <= S_c;
                        y <= 1'b0;
                    end
                    else
                    begin
                        next_state <= S_b;
                        y <= 1'b1;
                    end
                end
                S_b: begin
                    if (x==1)
                    begin
                        next_state <= S_d;
                        y <= 1'b1;
                    end
                    else
                    begin
                        next_state <= S_c;
                        y <= 1'b0;
                    end
                end
                S_c: begin
                    if (x==1)
                    begin
                        next_state <= S_d;
                        y <= 1'b1;
                    end
                    else
                    begin
                        next_state <= S_b;
                        y <= 1'b0;
                    end
                end
                S_d: begin
                    if (x==1)
                    begin
                        next_state <= S_a;
                        y <= 1'b0;
                    end
                    else
                    begin
                        next_state <= S_c;
                        y <= 1'b1;
                    end
                end
            endcase
        end
    end
endmodule