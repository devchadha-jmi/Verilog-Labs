`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 16:22:48
// Design Name: 
// Module Name: Priority_Encoder_8x3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Priority_Encoder_8x3(
    input [7:0] sequence_in,
    input [2:0] sequence_out
    );
    
    // This code has been written after solving K-Map
    or (sequence_out[0], sequence_in[1], sequence_in[3], sequence_in[5], sequence_in[7]);
    or (sequence_out[1], sequence_in[2], sequence_in[3], sequence_in[6], sequence_in[7]);
    or (sequence_out[2], sequence_in[4], sequence_in[5], sequence_in[6], sequence_in[7]);

    
endmodule
