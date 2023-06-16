module instruction_memory_and_cpu (
  input wire clk,       // 时钟
  input wire rst_n,     // 复位信号，低电平有效
  input wire Mem_Read,  // 存储器读信号
  input wire Mem_Write, // 存储器写信号
  input wire [7:0] Mem_Addr,
  input wire [7:0] M_W_Data,
  output reg [7:0] M_R_Data,
  output wire [7:0] Register_Output1,
  output wire [7:0] Register_Output2
);

// 存储器模块
reg [7:0] memory [0:255];

always @(posedge clk) begin
  if (rst_n == 0) begin
    // 复位时将存储器清零并将程序计数器归零
    for (int i = 0; i < 256; i=i+1)
      memory[i] = 8'h00;
    Program_Counter <= 8'h00;
    ALU_Output <= 8'h00;
  end else begin
    // 取指令操作
    if (Mem_Read == 1 && Mem_Write == 0 && Mem_Addr != 8'h00) begin
      M_R_Data <= memory[Mem_Addr];
      Program_Counter <= Program_Counter + 1;
    end

    // 写操作
    else if (Mem_Read == 0 && Mem_Write == 1 && Mem_Addr != 8'h00) begin
      memory[Mem_Addr] <= M_W_Data;
      Program_Counter <= Program_Counter + 1;
    end
  end
end

// 程序计数器
reg [7:0] Program_Counter;

// ALU
reg signed [7:0] Register1;
reg signed [7:0] Register2;
reg signed [7:0] ALU_Output;
reg [2:0] ALU_Control;

always @(*) begin
  case (ALU_Control)
    3'b000: ALU_Output = Register1 + Register2; // 加法
    3'b001: ALU_Output = Register1 - Register2; // 减法
    3'b010: ALU_Output = Register1 << 1;        // 逻辑左移
  endcase
end

// 寄存器
reg [7:0] Register [0:1];

assign Register_Output1 = Register[0];
assign Register_Output2 = Register[1];

always @(posedge clk) begin
  if (rst_n == 0) begin
    // 复位时将寄存器清零
    for (int i = 0; i < 2; i=i+1)
      Register[i] = 8'h00;
  end else begin
    // 指令解码
    case (memory[Program_Counter])
      3'b100: begin // 加法指令
        Register1 <= Register[0];
        Register2 <= Register[1];
        ALU_Control <= 3'b000;
        Register[0] <= ALU_Output;
        Program_Counter <= Program_Counter + 1;
      end
      3'b101: begin // 减法指令
        Register1 <= Register[0];
        Register2 <= Register[1];
        ALU_Control <= 3'b001;
        Register[0] <= ALU_Output;
        Program_Counter <= Program_Counter + 1;
      end
      3'b110: begin // 逻辑左移指令
        Register1 <= Register[0];
        ALU_Control <= 3'b010;
        Register[0] <= ALU_Output;
        Program_Counter <= Program_Counter + 1;
      end
      default: Program_Counter <= Program_Counter + 1; // 如果不是这三种指令，则简单地将PC加一
    endcase
  end
end

endmodule