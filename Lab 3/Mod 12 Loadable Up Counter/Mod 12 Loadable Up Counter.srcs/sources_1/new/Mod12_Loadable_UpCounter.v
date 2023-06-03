`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2023 18:40:19
// Design Name: 
// Module Name: Mod12_Loadable_UpCounter
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


module Mod12_Loadable_UpCounter(
    input clk,
    input rst,
    input load_en,
    input [3:0] load_count,
    output [3:0] count
    );
    
    reg [3:0]counter = 4'b0000;
    
    always @ (posedge clk)
        begin
            if (rst || counter == 4'b1011)
                counter <= 4'b0;
            else if (load_en)
                counter <= load_count;
            else
                counter <= counter + 1'b1;  
        end
    
    assign count = counter;
    
endmodule
