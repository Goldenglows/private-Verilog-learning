`timescale 1ns/1ns
module adder_tb; //???????
reg[3:0] ina,inb; //?????????reg ?
reg cin;
wire[3:0] sum; //?????????wire ?
wire cout;
integer i,j;
adder4 adder(cout,sum,ina,inb,cin); //??????
always #5 cin=~cin; //??cin ???
initial
begin
ina=0;inb=0;cin=0;
for(i=1;i<16;i=i+1)
#10 ina=i; //??a ???
end
initial
begin
for(j=1;j<16;j=j+1)
#10 inb=j; //??b ???
end
endmodule

