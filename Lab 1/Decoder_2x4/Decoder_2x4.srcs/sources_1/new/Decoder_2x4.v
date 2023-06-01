`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2023 16:58:29
// Design Name: 
// Module Name: Decoder_2x4
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


module Decoder_2x4(
    input [1:0] Data_in,
    output out0,
    output out1,
    output out2,
    output out3
    );
    
    assign out0 = ~Data_in[1] & ~Data_in[0];
    assign out1 = ~Data_in[1] &  Data_in[0];
    assign out2 =  Data_in[1] & ~Data_in[0];
    assign out3 =  Data_in[1] &  Data_in[0];
    
endmodule
