`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 16:43:16
// Design Name: 
// Module Name: top
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


module top(
    input [1:0] sel,
    input [3:0] din,
    output y
    );
    
    wire [3:0] X;
    wire [3:0] Y;
    decoder_2x4 instance1 (.din(sel), .dout(X));
    and (Y[0], din[0], X[0]);
    and (Y[1], din[1], X[1]);
    and (Y[2], din[2], X[2]);
    and (Y[3], din[3], X[3]);
    
    assign y = |Y;
    
endmodule
