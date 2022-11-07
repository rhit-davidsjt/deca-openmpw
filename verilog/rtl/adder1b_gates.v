module adder1b_gates (
	input a,
	input b,
	input cin,
	output sum,
	output cout);
	
	// sum = (a & ~b & ~cin) | (~a & b & ~cin) | (~a & ~b & cin) | (a & b & cin);
	// cout = (a & b) | (b & cin) | (a & cin);
	
	wire a_n, b_n, cin_n;
	wire sum1, sum2, sum3, sum4;
	wire cout1, cout2, cout3;
	
	// sky130_fd_sc_hd__bufinv - buffered inverter
	sky130_fd_sc_hd__bufinv inv_a(.Y(a_n), .A(a));
	sky130_fd_sc_hd__bufinv inv_b(.Y(b_n), .A(b));
	sky130_fd_sc_hd__bufinv inv_cin(.Y(cin_n), .A(cin));

	// sky130_fd_sc_hd__and3 - 3 input AND
	sky130_fd_sc_hd__and3_1 sum_and1(.X(sum1), .A(a), .B(b_n), .C(cin_n));
	sky130_fd_sc_hd__and3_1 sum_and2(.X(sum2), .A(a_n), .B(b), .C(cin_n));
	sky130_fd_sc_hd__and3_1 sum_and3(.X(sum3), .A(a_n), .B(b_n), .C(cin));
	sky130_fd_sc_hd__and3_1 sum_and4(.X(sum4), .A(a), .B(b), .C(cin));
	
	// sky130_fd_sc_hd__a21o - and2 -> or, closest I could find to basic AND
	sky130_fd_sc_hd__a21o cout_and1(.X(cout1), .A1(a), .A2(b), .B1(1'b0)); // feed in a 0 to make equivalent truth table 
	sky130_fd_sc_hd__a21o cout_and2(.X(cout2), .A1(b), .A2(cin), .B1(cout1));
	sky130_fd_sc_hd__a21o cout_and3(.X(cout), .A1(a), .A2(cin), .B1(cout2));
	// cout ORs are handles here, no need for an additional gate
	
	// sky130_fd_sc_hd__or4 - 4 input OR
	sky130_fd_sc_hd__or4 sum_or(.X(sum), .A(sum1), .B(sum2), .C(sum3), .D(sum4));	

endmodule
