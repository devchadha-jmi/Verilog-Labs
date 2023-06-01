module Full_Adder_tb();
    reg A, B, Cin; 
    wire Sum, Cout;
    
    Full_Adder FA1 (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
    
    initial 
        begin
           A = 0;
           B = 0;
           Cin = 0; 
        end
    always
        begin
            #5;
            A   = $urandom_range (0, 1'b1);
            B   = $urandom_range (0, 1'b1);
            Cin = $urandom_range (0, 1'b1);
        end
    initial
        begin
        #100 $finish;
        end            
endmodule