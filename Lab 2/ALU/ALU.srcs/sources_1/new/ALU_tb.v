`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2023 17:40:54
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    
    // Reg type inputs
    reg alu_en;
    reg [3:0] operation;
    reg [7:0] a_in, b_in;
    // Wire tupe outputs
    wire [15:0] outp;
    
    // Design instantiated
    ALU_Top DUT (.alu_en(alu_en), .operation(operation), .a_in(a_in), .b_in(b_in), .outp(outp));
    
    // Generate Random Signals
    integer i;
    initial
        begin
            alu_en = 1'b0;
            for (i = 0; i < 20; i=i+1)
                begin
                    operation = {$random}%16;
                    a_in = {$random}%256;
                    b_in = {$random}%256;
                    #5 alu_en = 1'b1;
                    #5 alu_en = 1'b0;
                    #20;
                end
            #20 $finish; 
        end  
endmodule
