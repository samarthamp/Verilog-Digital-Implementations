`timescale 1ns/1ns

module q11(input clk, reset, ONE, ZERO, output reg [3:0] state, output out);
    parameter S_0_0 = 0; // 0 ones and 0 zeroes
    parameter S_0_1 = 1; // 0 ones and 1 zeroes
    parameter S_0_2 = 2; // 0 ones and 2 zeroes
    parameter S_1_0 = 3; // 1 ones and 0 zeroes
    parameter S_1_1 = 4; // 1 ones and 1 zeroes
    parameter S_1_2 = 5; // 1 ones and 2 zeroes
    parameter S_2_0 = 6; // 2 ones and 0 zeroes
    parameter S_2_1 = 7; // 2 ones and 1 zeroes
    parameter S_2_2 = 8; // 2 ones and 2 zeroes

    reg prev_one, prev_zero;
    // reg [3:0] state;
    wire in_one, in_zero;

    always @(posedge clk or posedge reset) begin
        prev_one <= reset ? 0 : ONE;
        prev_zero <= reset ? 0 : ZERO;
    end

    assign in_one = ~prev_one & ONE;
    assign in_zero = ~prev_zero & ZERO;

    always@(posedge clk)
    begin
        if(reset)
            state <= S_0_0;
        else
            case(state)
                S_0_0: 
                begin
                    if (in_one)
                        state <= S_1_0;
                    else if (in_zero)
                        state <= S_0_1;
                    else
                        state <= state;
                end
                S_0_1:
                begin
                    if (in_one)
                        state <= S_1_1;
                    else if (in_zero)
                        state <= S_0_2;
                    else
                        state <= state;
                end
                S_0_2:
                begin
                    if (in_one)
                        state <= S_1_2;
                    else
                        state <= state;
                end 
                S_1_0:
                begin
                    if (in_one)
                        state <= S_2_0;
                    else if (in_zero)
                        state <= S_1_1;
                    else
                        state <= state;
                end
                S_1_1:
                begin
                    if (in_one)
                        state <= S_2_1;
                    else if (in_zero)
                        state <= S_1_2;
                    else
                        state <= state;
                end
                S_1_2:
                begin
                    if (in_one)
                        state <= S_2_2;
                    else
                        state <= state;
                end
                S_2_0:
                begin
                    if (in_zero)
                        state <= S_2_1;
                    else
                        state <= state;
                end
                S_2_1:
                begin
                    if (in_zero)
                        state <= S_2_2;
                    else
                        state <= state;
                end
                S_2_2:
                begin
                    state <= state;
                end
                default: state <= S_0_0;
            endcase
    end
    assign out = (state == S_2_2);
endmodule