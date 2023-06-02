module reg_file (
    input [2:0] rd_reg1, rd_reg2, // ???????
    input [31:0] write_data,      // ????
    input write_enable,           // ?????
    output reg [31:0] read_data1, read_data2, read_data3, read_data4,
                               read_data5, read_data6, read_data7, read_data8 // ????
);

reg [31:0] regs [0:7]; // ??8?32????

always @(*) begin
    read_data1 = regs[rd_reg1[2:1]];
    read_data2 = regs[rd_reg2[2:1]];
    read_data3 = regs[3][31:0];
    read_data4 = regs[4][31:0];
    read_data5 = regs[5][31:0];
    read_data6 = regs[6][31:0];
    read_data7 = regs[7][31:0];
    read_data8 = regs[0][31:0];
end

always @(posedge clk) begin
    if (write_enable) regs[write_reg[2:1]] <= write_data;
end

endmodule
