`timescale 1ns / 1ps
module Register_file_sim(R_Addr,W_Addr,Write_Reg,W_Data,clk,reset,R_Data);
	input [1:0]R_Addr, W_Addr;
	input Write_Reg, clk, reset;
	input [7:0]W_Data;
	output [7:0]R_Data;
	reg [7:0]REG_Files[0:3];
	reg [2:0]i;
	assign R_Data=REG_Files[R_Addr];

always@(posedge clk or posedge reset)
	begin
	 if(reset)
		for(i=0;i<=3;i=i+1)
			REG_Files[i]=0;
	 else if(Write_Reg&&W_Addr!=0)
			REG_Files[W_Addr]=W_Data;
	end
endmodule

