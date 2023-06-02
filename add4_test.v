module adder_4();
    wire[3:0] sum;
    wire cout;
    reg[3:0] a,b;
    reg cin;
    initial
        begin
            #0 a = 4'b0001; b = 4'b1010; cin = 1'b0;
            #5 a = 4'b0010; b = 4'b1010; cin = 1'b1;
            #5 a = 4'b0010; b = 4'b1110; cin = 1'b0;
            #5 a = 4'b0011; b = 4'b1100; cin = 1'b1;
            #5 a = 4'b0111; b = 4'b1001; cin = 1'b0;
            #5 a = 4'b0001; b = 4'b1100; cin = 1'b1;
            #5 a = 4'b0011; b = 4'b1100; cin = 1'b0;
            #5 a = 4'b0111; b = 4'b1111; cin = 1'b1;
            #5 $finish;
        end
    add_4 u1(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
endmodule


