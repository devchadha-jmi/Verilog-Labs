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
    output [1:0] state_out,
    output [1:0] Money_Recieved 
    );
    
    parameter IDLE     = 2'b00,
              OneRupee = 2'b01,
              TwoRupee = 2'b10;
              
    reg [1:0] state;
    reg [1:0] next_state;
    reg [2:0] money_recieved = 3'b0;
              
      always @ (posedge clk)
        begin
            state <= next_state;
        end       
      
      always @ (*)
        begin
            case (state)
            IDLE: begin 
                    next_state       <= ({IJ} = 2'b10) ? OneRupee : ({IJ} = 2'b11) ? TwoRupee : 0;
                    money_recieved   <= ({IJ} = 2'b10) ? money_recieved + 3'b001 : ({IJ} = 2'b11) ? money_recieved + 3'b010 : money_recieved;
                  end
            OneRupee: begin
                        next_state       <= ({IJ} = 2'b10) ? OneRupee : ({IJ} = 2'b11) ? TwoRupee : 0;
                        money_recieved   <= ({IJ} = 2'b10) ? money_recieved + 3'b001 : ({IJ} = 2'b11) ? money_recieved + 3'b010 : money_recieved;
                  end 
                  endcase 
        end           
endmodule
