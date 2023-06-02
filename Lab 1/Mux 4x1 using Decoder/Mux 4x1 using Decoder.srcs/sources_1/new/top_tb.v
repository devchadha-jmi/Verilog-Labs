module top_tb();
    reg [1:0]sel;
    reg [3:0]din;
    wire y;
    
    top instance1(.sel(sel), .din(din), .y(y));
    
// Driving parameters
  parameter N2 = 2'b11;
  parameter N1 = 4'b1111;
  integer i;
initial
    begin
      for(i= 0; i<10; i=i+1)
        begin
          sel   = $urandom_range(0, N2);
          din   = $urandom_range(0, N1);
          #10;
        end
      $finish;
    end

endmodule