`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2023 01:35:55
// Design Name: 
// Module Name: FSM_top
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


module FSM_top(
    input I,
    input J,
    input clk,
    output reg X,
    output reg Y,
    output [1:0] state_out
    );
    
    parameter IDLE     = 2'b00,  // IDLE State, no money recieved or product delivered
              MON_REC  = 2'b01,  // Money being recieved and getting added up
              DEL_MONR = 2'b10;  // Product delivery and extra money being returned
              
    reg [1:0] Money_Recieved;    // Cummulates money being recieved in states
    
    reg [1:0] state, next_state; // Stores state transition logic
    
    always @ (posedge clk)
        begin
            state <= next_state;
        end
    
    always @ (I or J or state)
        begin
        next_state <= IDLE;
            case (state)
            IDLE: begin 
                    next_state <= (I) ? MON_REC : IDLE;
                    Money_Recieved <= Money_Recieved + 1'b1 + J;
                  end
          MON_REC: begin
                    next_state <= (Money_Recieved >= 3) ? DEL_MONR : MON_REC;
                    Money_Recieved <= Money_Recieved + 1'b1 + J; 
                   end
         DEL_MONR: begin
                    next_state <= IDLE;
                    X <= 1;
                    Y <= (Money_Recieved > 3) ? 1 : 0;
                    Money_Recieved <= 0; 
                   end
             endcase
        end
        assign state_out = state;       
endmodule
