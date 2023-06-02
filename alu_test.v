`timescale 1ns / 1ps
module Test();
    reg [31:0] A,B;
    reg [3:0] OP;
    initial//??????????????
    begin
        /*???*/
            OP=4'b0000;A=32'h0000_0000; B=32'h0000_0001;#50;
            OP=4'b0000;A=32'h0000_0001; B=32'h0000_0001;#50;
        /*???*/
            OP=4'b0001;A=32'h0000_0000; B=32'h0000_0001;#50;
            OP=4'b0001;A=32'h0000_0000; B=32'h0000_0000;#50;
        /*????*/
            OP=4'b0010;A=32'h0000_0000; B=32'h0000_0001;#50;
            OP=4'b0010;A=32'h0000_0000; B=32'h0000_0000;#50;
        /*????*/
            OP=4'b0011;A=32'h0000_0000; B=32'h0000_0001;#50;
            OP=4'b0011;A=32'h0000_0000; B=32'h0000_0000;#50;
        /*?????*/
            OP=4'b0100;A=32'h7FFF_FFFF; B=32'h7FFF_FFFF;#50;
            OP=4'b0100;A=32'hFFFF_FFFF; B=32'hFFFF_FFFF;#50;
        /*?????*/
            OP=4'b0101;A=32'h7FFF_FFFF; B=32'h7FFF_FFFD;#50;
            OP=4'b0101;A=32'h7FFF_FFFF; B=32'hFFFF_FFFF;#50;
        /*A<B?,??1?????0*/
            OP=4'b0110;A=32'h7FFF_FFFF; B=32'h8FFF_FFFF;#50;
            OP=4'b0110;A=32'hFFFF_FFFF; B=32'h7FFF_FFFF;#50;
        /*B????A?????*/
            OP=4'b0111;A=32'h0000_0001; B=32'h0000_0001;#50;
            OP=4'b0111;A=32'h0000_0001; B=32'h0000_0008;#50;
    end
    wire [31:0] F;
    wire ZF, CF, OF, SF, PF;
    ALU ALU_test(
        .OP(OP),
        .A(A),
        .B(B),
        .F(F),
        .ZF(ZF),
        .CF(CF),
        .OF(OF),
        .SF(SF),
        .PF(PF)
    );
    
endmodule
