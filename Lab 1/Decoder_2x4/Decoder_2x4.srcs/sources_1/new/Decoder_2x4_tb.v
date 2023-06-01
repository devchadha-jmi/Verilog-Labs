`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2023 16:58:29
// Design Name: 
// Module Name: Decoder_2x4_tb
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


module Decoder_2x4_tb();
    reg [1:0]Data_in;
    wire out0, out1, out2, out3;
    
    Decoder_2x4 Decoder1(.Data_in(Data_in), .out0(out0), .out1(out1), .out2(out2), .out3(out3));
    
    initial begin
        Data_in = 2'b00;    
    end 
    
    always 
        begin
         #5;
            Data_in   = $urandom_range (0, 2'b11);
        end 
     
     initial
        begin
        #100 $finish;
        end   

endmodule
