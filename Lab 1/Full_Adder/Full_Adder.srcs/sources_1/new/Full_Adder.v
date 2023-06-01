`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2023 16:07:50
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    wire net1, net2, net3, net4;
    Half_Adder HA1 (.A(A), .B(B), .Sum1(net1), .Carry(net2));
    Half_Adder HA2 (.A(net1), .B(Cin), .Sum1(net4), .Carry(net3));
    assign Sum = net4;
    assign Cout = net2 & net3;
endmodule