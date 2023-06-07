`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 13:37:59
// Design Name: 
// Module Name: SeqDetTb
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


module SeqDetTb();

  // Inputs
  reg clk;
  reg seq_in;

  // Outputs
  wire seq_det;
  wire [1:0] state_out;

  // Instantiate the module under test
  SeqDetTop dut (
    .clk(clk),
    .seq_in(seq_in),
    .seq_det(seq_det),
    .state_out(state_out)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    seq_in = 0;

    // Wait for a few clock cycles
    #10;

    // Test sequence
    seq_in = 1;
    #5;
    seq_in = 0;
    #5;
    seq_in = 1;
    #5;
    seq_in = 1;
    #5;

    // Add more test cases as needed

    // End simulation
    $finish;
  end

  // Monitor
  always @(posedge clk)
    $display("seq_det = %b", seq_det);

endmodule
