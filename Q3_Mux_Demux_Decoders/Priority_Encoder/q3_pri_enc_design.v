`timescale 1ns/1ns

module pri_enc_8x3(input [7:0] D, input E, output [2:0] Y);
    wire [2:0] Z;
    not(not_D2, D[2]);
    not(not_D4, D[4]);
    not(not_D5, D[5]);
    not(not_D6, D[6]);

    or(temp_y1, D[2], D[3]);
    and(temp_y2, temp_y1, not_D4, not_D5);
    and(temp_z1, D[1], not_D2);
    or(temp_z2, temp_z1, D[3]);
    and(temp_z3, temp_z2, not_D4);
    or(temp_z4, temp_z3, D[5]);
    and(temp_z5, temp_z4, not_D6);
    
    or(Z[2], D[4], D[5], D[6], D[7]);
    or(Z[1], temp_y2, D[6], D[7]);
    or(Z[0], temp_z5, D[7]);

    and(Y[2], Z[2], E);
    and(Y[1], Z[1], E);
    and(Y[0], Z[0], E);
endmodule