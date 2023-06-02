module dual_port_reg_file(
  input [4:0] Rd_Addr1, // ????1???
  input [4:0] Rd_Addr2, // ????2???
  input [31:0] Wr_Data, // ????
  input [4:0] Wr_Addr, // ????
  input Write_Reg, // ??????
  input CLK, // ????
  output reg [31:0] Rd_Data1, // ????1?????
  output reg [31:0] Rd_Data2, // ????2?????
  output reg Busy // ????
);

reg [31:0] Reg_File[31:0]; // ??32??????????32?

/* ???? */
always @(*) begin
  Rd_Data1 = Reg_File[Rd_Addr1];
  Rd_Data2 = Reg_File[Rd_Addr2];
end

/* ???? */
always @(posedge CLK) begin
  if (Write_Reg) begin
    Reg_File[Wr_Addr] <= Wr_Data;
  end
end

/* ???? */
always @(*) begin
  if (Write_Reg) begin
    Busy = 1; // ??????????????1
  end
  else begin
    Busy = 0; // ??????????????0
  end
end

endmodule
