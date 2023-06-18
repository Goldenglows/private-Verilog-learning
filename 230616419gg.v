module instruction_memory_and_cpu_tb;

  reg clk;
  reg rst_n;
  reg Mem_Read;
  reg Mem_Write;
  reg [7:0] Mem_Addr;
  reg [7:0] M_W_Data;

  wire [7:0] M_R_Data;
  wire [7:0] Register_Output1;
  wire [7:0] Register_Output2;

  instruction_memory_and_cpu dut(
      .clk(clk),
      .rst_n(rst_n),
      .Mem_Read(Mem_Read),
      .Mem_Write(Mem_Write),
      .Mem_Addr(Mem_Addr),
      .M_W_Data(M_W_Data),
      .M_R_Data(M_R_Data),
      .Register_Output1(Register_Output1),
      .Register_Output2(Register_Output2)
  );

  integer i;

  initial begin
      clk = 0;
      rst_n = 0;
      #10; // 等待10个时钟周期
      rst_n = 1;
  end

  always #5 clk = ~clk;

  always @ (posedge clk) begin
      if (!rst_n) begin
          Mem_Read <= 0;
          Mem_Write <= 0;
          Mem_Addr <= 0;
          M_W_Data <= 0;
      end else begin
          // 写入指令
          Mem_Read <= 0;
          Mem_Write <= 1;

          // 将三条指令分别写入内存中
          M_W_Data <= 8'b100; // 加法指令，地址为1
          Mem_Addr <= 8'b0000_0001;
          #10;

          M_W_Data <= 8'b101; // 减法指令，地址为2
          Mem_Addr <= 8'b0000_0010;
          #10;

          M_W_Data <= 8'b110; // 逻辑左移指令，地址为3
          Mem_Addr <= 8'b0000_0011;
          #10;

          // 将其他位置的内存数据设置为0（初始化）
          M_W_Data <= 8'b00;
          for (i = 0; i < 256; i=i+1) begin
              if (i != 1 && i != 2 && i != 3) begin
                  Mem_Addr <= i;
                  #5;
              end
          end

          // 执行指令
          Mem_Read <= 1;
          Mem_Write <= 0;

          // 加法指令
          Mem_Addr <= 8'b0000_0001;
          #20;
          $display("Register_Output1 after add instruction: %d", Register_Output1);

          // 减法指令
          Mem_Addr <= 8'b0000_0010;
          #20;
          $display("Register_Output1 after sub instruction: %d", Register_Output1);

          // 逻辑左移指令
          Mem_Addr <= 8'b0000_0011;
          #20;
          $display("Register_Output1 after shl instruction: %d", Register_Output1);
      end
  end

endmodule