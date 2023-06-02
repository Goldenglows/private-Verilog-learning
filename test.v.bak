`timescale 1ns/1ps

module Register_file_sim_TB;
    // Inputs
    reg [1:0] R_Addr;
    reg [1:0] W_Addr;
    reg Write_Reg;
    reg [7:0] W_Data;
    reg clk;
    reg reset;

    // Outputs
    wire [7:0] R_Data;

    // Instantiate the Unit Under Test (UUT)
    Register_file_sim uut (
        .R_Addr(R_Addr),
        .W_Addr(W_Addr),
        .Write_Reg(Write_Reg),
        .W_Data(W_Data),
        .clk(clk),
        .reset(reset),
        .R_Data(R_Data)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        R_Addr = 0;
        W_Addr = 0;
        Write_Reg = 0;
        W_Data = 8'h00;

        // Wait 100 ns for global reset to finish
        #100;

        // Test writing and reading data from register files
        W_Addr = 1;
        Write_Reg = 1;
        W_Data = 8'h12;
        #10;
        W_Addr = 2;
        Write_Reg = 1;
        W_Data = 8'h34;
        #10;
        R_Addr = 1;
        #10;
        W_Addr = 3;
        Write_Reg = 1;
        W_Data = 8'h56;
        #10;
        R_Addr = 2;
        #10;
        R_Addr = 3;
        #10;
        R_Addr = 0;
        #10;
        W_Addr = 0;
        Write_Reg = 0;
        W_Data = 8'h00;

        // Finish the simulation
        $finish;
    end

    always #5 clk = ~clk; // Create a 10ns clock period
    
endmodule
