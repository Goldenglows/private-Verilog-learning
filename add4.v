module add_4
    (
    	input[3:0] a,b,
    	output[3:0] sum,
    	output cout,
    	input cin
    );
    assign{cout,sum} = a+b+cin;
    endmodule


