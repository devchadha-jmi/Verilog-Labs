`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2023 22:21:50
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb;
    reg rst, clk_a, clk_b, wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire buf_empty, buf_full;
    
    wire [6:0]fifo_counter;

    // Instantiate the FIFO_Top module
    FIFO_Top dut (
        .rst(rst),
        .clk_a(clk_a),
        .clk_b(clk_b),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .buf_empty(buf_empty),
        .buf_full(buf_full),
        .fifo_counter(fifo_counter)
    );

    // Clock generation
    always #5 clk_a = ~clk_a;
    always #10 clk_b = ~clk_b;

    // Initialize inputs
    initial begin
        rst = 1;
        clk_a = 0;
        clk_b = 0;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        #15 rst = 0; // Release reset after 15 time units

        // Test Case 1: Write and Read a single data
        wr_en = 1;
        data_in = 8'hAA;
        #20 wr_en = 0;
        rd_en = 1;
        #20 rd_en = 0;
        
        // Test Case 2: Write multiple data and Read in the same order
        wr_en = 1;
        data_in = 8'hAA;
        #20 wr_en = 1;
        data_in = 8'hBB;
        #20 wr_en = 1;
        data_in = 8'hCC;
        #20 wr_en = 0;
        
        rd_en = 1;
        #20 rd_en = 1;
        #20 rd_en = 1;
        #20 rd_en = 0;
        
        // Test Case 3: Write and Read multiple data in different order
        wr_en = 1;
        data_in = 8'hAA;
        #20 wr_en = 1;
        data_in = 8'hBB;
        #20 wr_en = 1;
        data_in = 8'hCC;
        #20 wr_en = 1;
        data_in = 8'hDD;
        #20 wr_en = 1;
        data_in = 8'hEE;
        #20 wr_en = 0;
        
        rd_en = 1;
        #20 rd_en = 1;
        #20 rd_en = 1;
        #20 rd_en = 1;
        #20 rd_en = 1;
        #20 rd_en = 0;
        
        // Test Case 4: Fill the FIFO and attempt to write when full
        wr_en = 1;
        data_in = 8'hAA;
        #200 wr_en = 1;
        data_in = 8'hBB;
        #200 wr_en = 1;
        data_in = 8'hCC;
        #200 wr_en = 1;
        data_in = 8'hDD;
        #200 wr_en = 1;
        data_in = 8'hEE;
        #200 wr_en = 1;
        data_in = 8'hFF;
        #20 wr_en = 0;
        
        // Test Case 5: Read from empty FIFO
        rd_en = 1;
        #20 rd_en = 0;
        
        // Test Case 6: Write, Read, and Reset
        wr_en = 1;
        data_in = 8'hAA;
        #20 wr_en = 1;
        data_in = 8'hBB;
        #20 wr_en = 0;
        
        rd_en = 1;
        #20 rd_en = 1;
        #20 rst = 1;
        #20 rst = 0;
        #20 rd_en = 0;
        
        // Add more test cases as needed
        
        #100 $finish; // End simulation after 100 time units
    end
endmodule

