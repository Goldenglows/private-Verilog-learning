module reg_file_tb;

reg clk;
reg [2:0] rd_reg1, rd_reg2;
reg [31:0] write_data;
reg write_enable;

wire [31:0] read_data1, read_data2, read_data3, read_data4,
            read_data5, read_data6, read_data7, read_data8;

reg_file reg_file_inst (
    .rd_reg1(rd_reg1),
    .rd_reg2(rd_reg2),
    .write_data(write_data),
    .write_enable(write_enable),
    .read_data1(read_data1),
    .read_data2(read_data2),
    .read_data3(read_data3),
    .read_data4(read_data4),
    .read_data5(read_data5),
    .read_data6(read_data6),
    .read_data7(read_data7),
    .read_data8(read_data8)
);

initial begin
    clk = 0;
    rd_reg1 = 3'd0;
    rd_reg2 = 3'd0;
    write_data = 32'd0;
    write_enable = 0;
end

always #5 clk = ~clk;

initial begin
    // ????9????42
    write_enable = 1;
    write_data = 32'd42;
    #10;
    write_enable = 0;

    // ?????9??
    rd_reg1 = 3'd1;
    #10;
    // ?????42
    $display("read_data1 = %d", read_data1);
end

initial begin
    // ????10????12345
    write_enable = 1;
    write_data = 32'd12345;
    #10;
    write_enable = 0;

    // ?????10??
    rd_reg2 = 3'd2;
    #10;
    // ?????12345
    $display("read_data2 = %d", read_data2);
end

endmodule
