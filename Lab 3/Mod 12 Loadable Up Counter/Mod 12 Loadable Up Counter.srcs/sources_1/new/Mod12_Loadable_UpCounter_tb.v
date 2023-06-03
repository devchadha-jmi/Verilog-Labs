module Mod12_Loadable_UpCounter_tb();
    
    // Reg type variables for driving inputs
    reg clk;
    reg rst, load_en;
    reg [3:0] load_count;
    
    // Wire type variable to store output
    wire [3:0] count;
    
    // Design Instantiation
    Mod12_Loadable_UpCounter DUT (.clk(clk), .rst(rst), .load_en(load_en), .load_count(load_count), .count(count));
    
    // Clk generation
    initial clk <= 1'b0;
    always #5 clk <= ~clk;
    
    // rst, load_count & load_en generation
    initial 
        begin
            #25 rst = 1'b1;
            #25 rst = 1'b0;
            #60 load_en = 1'b1;
                load_count = 4'b1010;
            #20 load_en = 1'b0;
            #200 $finish;
        end

endmodule