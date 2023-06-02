`timescale 1ns / 1ps

module Register_file_sim_tb();

reg [1:0] R_Addr;
reg [1:0] W_Addr;
reg Write_Reg;
reg [7:0] W_Data;
reg clk;
reg reset;
wire [7:0] R_Data;

Register_file_sim uut(
  .R_Addr(R_Addr),
  .W_Addr(W_Addr),
  .Write_Reg(Write_Reg),
  .W_Data(W_Data),
  .clk(clk),
  .reset(reset),
  .R_Data(R_Data)
);

initial begin
  $dumpfile("Register_file_sim_tb.vcd");
  $dumpvars(0, Register_file_sim_tb);
end

always #5 clk = ~clk;

initial begin
  reset = 1;
  Write_Reg = 0;
  W_Addr = 2;
  W_Data = 8;
  R_Addr = 2;
  #10 reset = 0;
  #10 Write_Reg = 1;
  #10 W_Addr = 1;
  #10 W_Data = 16;
  #20 W_Addr = 3;
  #20 W_Data = 32;
  #30 Write_Reg = 0;
  #40 R_Addr = 0;
  #50 R_Addr = 1;
  #60 R_Addr = 2;
  #70 R_Addr = 3;
  #80 $finish();
end

endmodule

