module adder_4bits(a, b, ci, s, co);
		
		input[3:0] a, b;
		input ci;
		output[3:0] s;
		output co;
		
		wire P0, P1, P2, P3;
		wire G0, G1, G2, G3;
		wire c0, c1, c2, c3;
		
		assign P0 = a[0] + b[0];
		assign P1 = a[1] + b[1];
		assign P2 = a[2] + b[2];
		assign P3 = a[3] + b[3];
		
		assign G0 = a[0] && b[0];
		assign G1 = a[1] && b[1];
		assign G2 = a[2] && b[2];
		assign G3 = a[3] && b[3];
		
		assign c0 = G0 || P0  && ci;
		assign c1 = G1 || P1  && c0;
		assign c2 = G2 || P2  && c1;
		assign c3 = G3 || P3  && c2;
		
	  assign s[0] = (P0 && !G0) ^ ci;
	  assign s[1] = (P1 && !G1) ^ c0;
	  assign s[2] = (P2 && !G2) ^ c1;
	  assign s[3] = (P3 && !G3) ^ c2;
	  assign co = c3;
endmodule
