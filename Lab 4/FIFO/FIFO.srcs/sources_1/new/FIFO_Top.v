`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2023 22:21:50
// Design Name: 
// Module Name: FIFO_Top
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


module FIFO_Top(
    input rst,
    input clk_a,
    input clk_b,
    input wr_en,
    input rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg buf_empty,
    output reg buf_full,
    
    output reg [6:0] fifo_counter
    );
    
    // To-do
    /*
    1) Drive Flags [Based on Counter Value]
    2) Keep a check on Buffer memory [Counter]
                                     Counter = Counter + 1 //When Write
                                     Counter = Counter - 1 //When Read
    3) Read from and Write to location specified by rd_ptr and wr_ptr
       on clk_a and clk_b respectively
    4) rd_ptr and wr_ptr updates only when they are invoked at respective clock edges
    */
    
    //Mmeory Definition
    reg [7:0] BUFFER [63:0];
    
    //reg [6:0]fifo_counter; // Counts from 0 to 64;
    
    // Pointers
    reg [5:0]rd_ptr, wr_ptr;
    
    // Flags
    always @ (fifo_counter) begin
    buf_empty <= (fifo_counter == 0);
    buf_full  <= (fifo_counter == 64);
    end
    
    // fifo_counter to check memory occupancy.
    // fifo_counter starts from 0(empty) increments 
    // if memory write occur and decremnts if memory read occurs
    always @ (posedge clk_a /*or posedge clk_b*/ or posedge rst)
    begin
        // case of reset
        if (rst)
            fifo_counter <= 0;
            
        // Simultaneous Read and Write - No effect on fifo_counter value
        else if ((!buf_full && wr_en) && (!buf_empty && rd_en))
            fifo_counter <= fifo_counter;
            
        // Read
        //else if (!buf_empty && rd_en)
            //fifo_counter <= fifo_counter - 1;
            
        // Write
        else if (!buf_full && wr_en)
            fifo_counter <= fifo_counter + 1;
            
        else 
            fifo_counter <= fifo_counter;
    end
    
    always @ (posedge clk_b /*or posedge clk_a*/ or posedge rst)
    begin
        // case of reset
        if (rst)
            fifo_counter <= 0;
            
        // Simultaneous Read and Write - No effect on fifo_counter value
        else if ((!buf_full && wr_en) && (!buf_empty && rd_en))
            fifo_counter <= fifo_counter;
            
        // Read
        else if (!buf_empty && rd_en)
            fifo_counter <= fifo_counter - 1;
            
        // Write
        //else if (!buf_full && wr_en)
            //fifo_counter <= fifo_counter + 1;
            
        else 
            fifo_counter <= fifo_counter;
    end
    
    // Memory Read
    always @ (posedge clk_b or posedge rst)
    begin
        if (rst)
            data_out <= 0;
        else
            begin
                if(!buf_empty && rd_en)
                    data_out <= BUFFER [rd_ptr];
                else
                    data_out <= data_out;
            end            
    end
    
    // Memory Write
    always @ (posedge clk_a /*or posedge rst*/) // rs is not involved here
    begin
            begin
                if(!buf_full && wr_en)
                    BUFFER [wr_ptr] <= data_in;
                else
                    BUFFER [wr_ptr] <= BUFFER [wr_ptr];
            end            
    end
    
    // Pointer Update
    always @ (posedge clk_a /*or posedge clk_b*/ or posedge rst)
    begin
        if (rst) 
            begin
                rd_ptr <= 0;
                wr_ptr <= 0;
            end
       else
            begin
                // Read Pointer Update
                /*if(!buf_empty && rd_en)
                    rd_ptr <= rd_ptr + 1;
                else 
                    rd_ptr <= rd_ptr;*/
                // Write Pointer Update    
                if(!buf_full && wr_en)
                    wr_ptr <= wr_ptr + 1;
                else
                    wr_ptr <= wr_ptr;
            end            
    end   
    always @ (posedge clk_b /*or posedge clk_a*/ or posedge rst)
    begin
        if (rst) 
            begin
                rd_ptr <= 0;
                wr_ptr <= 0;
            end
       else
            begin
                // Read Pointer Update
                if(!buf_empty && rd_en)
                    rd_ptr <= rd_ptr + 1;
                else 
                    rd_ptr <= rd_ptr;
                // Write Pointer Update    
                /*if(!buf_full && wr_en)
                    wr_ptr <= wr_ptr + 1;
                else
                    wr_ptr <= wr_ptr;*/
            end            
    end   
endmodule
