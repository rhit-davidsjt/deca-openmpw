module adder32b (
	input [31:0] a,
	input [31:0] b,
	input cin,
	output [31:0] sum,
	output cout,
	output [32:0] io_oeb );
	
	assign io_oeb = 0; 
	
	wire cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7;
	wire cout8, cout9, cout10, cout11, cout12, cout13, cout14, cout15;
	wire cout16, cout17, cout18, cout19, cout20, cout21, cout22, cout23;
	wire cout24, cout25, cout26, cout27, cout28, cout29, cout30, cout31;

	adder1b_gates add0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout0));
	adder1b_gates add1(.a(a[1]), .b(b[1]), .cin(cout0), .sum(sum[1]), .cout(cout1));
	adder1b_gates add2(.a(a[2]), .b(b[2]), .cin(cout1), .sum(sum[2]), .cout(cout2));
	adder1b_gates add3(.a(a[3]), .b(b[3]), .cin(cout2), .sum(sum[3]), .cout(cout3));
	adder1b_gates add4(.a(a[4]), .b(b[4]), .cin(cout3), .sum(sum[4]), .cout(cout4));
	adder1b_gates add5(.a(a[5]), .b(b[5]), .cin(cout4), .sum(sum[5]), .cout(cout5));
	adder1b_gates add6(.a(a[6]), .b(b[6]), .cin(cout5), .sum(sum[6]), .cout(cout6));
	adder1b_gates add7(.a(a[7]), .b(b[7]), .cin(cout6), .sum(sum[7]), .cout(cout7));
	adder1b_gates add8(.a(a[8]), .b(b[8]), .cin(cout7), .sum(sum[8]), .cout(cout8));
	adder1b_gates add9(.a(a[9]), .b(b[9]), .cin(cout8), .sum(sum[9]), .cout(cout9));
	adder1b_gates add10(.a(a[10]), .b(b[10]), .cin(cout9), .sum(sum[10]), .cout(cout10));
	adder1b_gates add11(.a(a[11]), .b(b[11]), .cin(cout10), .sum(sum[11]), .cout(cout11));
	adder1b_gates add12(.a(a[12]), .b(b[12]), .cin(cout11), .sum(sum[12]), .cout(cout12));
	adder1b_gates add13(.a(a[13]), .b(b[13]), .cin(cout12), .sum(sum[13]), .cout(cout13));
	adder1b_gates add14(.a(a[14]), .b(b[14]), .cin(cout13), .sum(sum[14]), .cout(cout14));
	adder1b_gates add15(.a(a[15]), .b(b[15]), .cin(cout14), .sum(sum[15]), .cout(cout15));
	adder1b_gates add16(.a(a[16]), .b(b[16]), .cin(cout15), .sum(sum[16]), .cout(cout16));
	adder1b_gates add17(.a(a[17]), .b(b[17]), .cin(cout16), .sum(sum[17]), .cout(cout17));
	adder1b_gates add18(.a(a[18]), .b(b[18]), .cin(cout17), .sum(sum[18]), .cout(cout18));
	adder1b_gates add19(.a(a[19]), .b(b[19]), .cin(cout18), .sum(sum[19]), .cout(cout19));
	adder1b_gates add20(.a(a[20]), .b(b[20]), .cin(cout19), .sum(sum[20]), .cout(cout20));
	adder1b_gates add21(.a(a[21]), .b(b[21]), .cin(cout20), .sum(sum[21]), .cout(cout21));
	adder1b_gates add22(.a(a[22]), .b(b[22]), .cin(cout21), .sum(sum[22]), .cout(cout22));
	adder1b_gates add23(.a(a[23]), .b(b[23]), .cin(cout22), .sum(sum[23]), .cout(cout23));
	adder1b_gates add24(.a(a[24]), .b(b[24]), .cin(cout23), .sum(sum[24]), .cout(cout24));
	adder1b_gates add25(.a(a[25]), .b(b[25]), .cin(cout24), .sum(sum[25]), .cout(cout25));
	adder1b_gates add26(.a(a[26]), .b(b[26]), .cin(cout25), .sum(sum[26]), .cout(cout26));
	adder1b_gates add27(.a(a[27]), .b(b[27]), .cin(cout26), .sum(sum[27]), .cout(cout27));
	adder1b_gates add28(.a(a[28]), .b(b[28]), .cin(cout27), .sum(sum[28]), .cout(cout28));
	adder1b_gates add29(.a(a[29]), .b(b[29]), .cin(cout28), .sum(sum[29]), .cout(cout29));
	adder1b_gates add30(.a(a[30]), .b(b[30]), .cin(cout29), .sum(sum[30]), .cout(cout30));
	adder1b_gates add31(.a(a[31]), .b(b[31]), .cin(cout30), .sum(sum[31]), .cout(cout31));
	
	assign cout = cout31;

endmodule
