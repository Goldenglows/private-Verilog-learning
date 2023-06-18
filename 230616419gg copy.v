module instruction_memory_and_cpu(
    input clk,
    input rst_n,
    input Mem_Read,
    input Mem_Write,
    input [7:0] Mem_Addr,
    input [7:0] M_W_Data,
    output reg [7:0] M_R_Data,
    output reg [7:0] Register_Output1,
    output reg [7:0] Register_Output2
);

  reg [7:0] memory [255:0];
  reg [7:0] R1;
  reg [7:0] R2;
  reg [7:0] ALU_Output;

  always @ (posedge clk or negedge rst_n) begin
      if (!rst_n) begin
          // 复位
          R1 <= 8'b0;
          R2 <= 8'b0;
          ALU_Output <= 8'b0;
      end else begin
          // 从寄存器中读取数据
          R1 <= memory[R1];
          R2 <= memory[R2];

          // 执行指令
          if (Mem_Read) begin
              M_R_Data <= memory[Mem_Addr];
          end else if (Mem_Write) begin
              memory[Mem_Addr] <= M_W_Data;
          end else begin
              case (M_R_Data)
                  8'b100: begin // 加法指令
                      ALU_Output <= R1 + R2;
                      Register_Output1 <= ALU_Output;
                  end

                  8'b101: begin // 减法指令
                      ALU_Output <= R1 - R2;
                      Register_Output1 <= ALU_Output;
                  end

                  8'b110: begin // 逻辑左移指令
                      ALU_Output <= {R1[6:0], 1'b0};
                      Register_Output1 <= ALU_Output;
                  end

                  default: begin
                      Register_Output1 <= R1;
                  end
              endcase
          end
      end
  end

endmodule