module Priority_Encoder_8x3_tb();
    
    // reg variable to drive input
    reg [7:0] sequence_in;
    // wire variable to get output
    wire [2:0] sequence_out;
    
    Priority_Encoder_8x3 instance1 (.sequence_in(sequence_in), .sequence_out(sequence_out));
    
    //Driving Parametrs
    integer i;
  initial
    begin
      for (i = 0; i < 10; i= i+1) 
          begin
            sequence_in = $urandom_range (0, 8'b11111111);
            #5;
          end
      $finish;
    end

endmodule