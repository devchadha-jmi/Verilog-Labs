module FSM_tb;
    reg I, J, clk;
    wire X, Y;
    wire [1:0] state;
    wire [1:0] Money_Recieved;

    // Instantiate the FSM_top module
    FSM_top dut (
        .I(I),
        .J(J),
        .clk(clk),
        .X(X),
        .Y(Y),
        .state_out(state),
        .Money_Recieved(Money_Recieved)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initialize inputs
    initial begin
        
        I = 0;
        J = 0;
        clk = 0;
        
        // Test Case 1: Idle state, no money received or product delivered
        #10;
        
        // Test Case 2: Money being received and getting added up
        I = 1;
        #20 J = 1;
        #10 J = 1;
        #10 J = 0;
        #10;
        
        // Test Case 3: Money exceeds 3, product delivery and extra money being returned
        #10 J = 1;
        #10 J = 1;
        #10 J = 1;
        #10 J = 0;
        #10;
        
        // Test Case 4: Idle state after product delivery
        I = 0;
        #10;
        
        // Add more test cases as needed
        
        #100 $finish; // End simulation after 100 time units
    end
endmodule

