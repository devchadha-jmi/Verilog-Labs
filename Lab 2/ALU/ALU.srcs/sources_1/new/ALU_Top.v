`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2023 17:40:54
// Design Name: 
// Module Name: ALU_Top
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
module ALU_Top(
    input alu_en,
    input [3:0] operation,
    input [7:0] a_in,
    input [7:0] b_in,
    output [15:0] outp
    );
    reg [15:0] out;
    always @ (operation, a_in, b_in)
        begin
            case (operation)
            4'b0000 : out = a_in + b_in;
            4'b0001 : out = a_in + 1'b1;
            4'b0010 : out = a_in - b_in;
            4'b0011 : out = a_in - 1'b1;
            4'b0100 : out = a_in * b_in;
            4'b0101 : out = a_in / b_in;
            4'b0110 : out = a_in << 1'b1;
            4'b0111 : out = a_in >> 1'b1;
            4'b1000 : out = ~a_in;
            4'b1001 : out = a_in & b_in;
            4'b1010 : out = a_in | b_in;
            4'b1011 : out = ~(a_in & b_in);
            4'b1100 : out = ~(a_in | b_in);
            4'b1101 : out = a_in ^ b_in;
            4'b1110 : out = a_in ~^ b_in;
            4'b1111 : out = a_in;
            default out = a_in;
            endcase
        end
    assign outp = alu_en ? 16'bz : out;
endmodule
