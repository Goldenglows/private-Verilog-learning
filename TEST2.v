
module dual_port_reg_file_tb;
  parameter DELAY = 1;

  reg [4:0] Rd_Addr1;    // ????1???
  reg [4:0] Rd_Addr2;    // ????2???
  reg [31:0] Wr_Data;    // ????
  reg [4:0] Wr_Addr;     // ????
  reg Write_Reg;         // ??????
  reg CLK;               // ????

  wire [31:0] Rd_Data1;  // ????1?????
  wire [31:0] Rd_Data2;  // ????2?????
  wire Busy;             // ????

  dual_port_reg_file dut (
    .Rd_Addr1(Rd_Addr1),
    .Rd_Addr2(Rd_Addr2),
    .Wr_Data(Wr_Data),
    .Wr_Addr(Wr_Addr),
    .Write_Reg(Write_Reg),
    .CLK(CLK),
    .Rd_Data1(Rd_Data1),
    .Rd_Data2(Rd_Data2),
    .Busy(Busy)
  );

  initial begin
    Rd_Addr1 = 5;        // ??????1???
    Rd_Addr2 = 7;        // ??????2???
    Wr_Data = 32'h12345678; // ??????
    Wr_Addr = 10;        // ??????
    Write_Reg = 1;       // ?????????1
    CLK = 0;             // ????????0
    #DELAY;              // ??????

    $display("Read: Rd_Addr1=%d, Rd_Data1=%h, Rd_Addr2=%d, Rd_Data2=%h", Rd_Addr1, Rd_Data1, Rd_Addr2, Rd_Data2);
    $display("Write: Wr_Addr=%d, Wr_Data=%h, Write_Reg=%d, Busy=%d", Wr_Addr, Wr_Data, Write_Reg, Busy);

    #DELAY;              // ??????
    CLK = 1;             // ?????
    #DELAY;              // ??????
    Write_Reg = 0;       // ????????
    #DELAY;              // ??????
    CLK = 0;             // ?????
    #DELAY;              // ??????

    $display("Read: Rd_Addr1=%d, Rd_Data1=%h, Rd_Addr2=%d, Rd_Data2=%h", Rd_Addr1, Rd_Data1, Rd_Addr2, Rd_Data2);
    $display("Write: Wr_Addr=%d, Wr_Data=%h, Write_Reg=%d, Busy=%d", Wr_Addr, Wr_Data, Write_Reg, Busy);
    
    $finish;
  end

endmodule
