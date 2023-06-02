`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 16:43:16
// Design Name: 
// Module Name: decoder_2x4
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


module decoder_2x4(
    input [1:0] din,
    output [3:0] dout
    );
    
    assign dout[0] = ~din[1] & ~din[0];
    assign dout[1] = ~din[1] &  din[0];
    assign dout[2] =  din[1] & ~din[0];
    assign dout[3] =  din[1] &  din[0];
    
endmodule
