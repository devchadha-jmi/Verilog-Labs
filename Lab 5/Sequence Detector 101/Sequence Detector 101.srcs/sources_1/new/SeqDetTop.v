`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 13:37:59
// Design Name: 
// Module Name: SeqDetTop
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


module SeqDetTop(
    input clk,
    input seq_in,
    output seq_det,
    output [1:0] state_out
    );
    
    // State Definition
    parameter s0 = 2'b00,
              s1 = 2'b01,
              s2 = 2'b10,
              s3 = 2'b11;
     
     // State Reg
     reg [1:0] state , next_state; 
        
    // State Transition 
    always @ (posedge clk)
        begin
            state <= next_state;
        end
        
    // Next State Logic
    always @ (seq_in)
        begin
            case (state)
                s0: next_state <= (seq_in)  ? s1 : s0;
                s1: next_state <= (!seq_in) ? s2 : s1;
                s2: next_state <= (seq_in)  ? s3 : s0;
                s3: next_state <= (seq_in)  ? s1 : s2;
                default next_state <= s0;
            endcase
        end
    // Output Logic
    assign seq_det = (state == s3) ? 1'b1 : 1'b0;
    assign state_out = state; 
    
endmodule
