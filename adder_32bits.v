module adder_32bits(a, b, ci, s, co);
	input[31:0] a, b;
	input ci;
	output[31:0] s;
	output co;
	
	//一位全加器扩展成32位串行进位二进制加法器
/* 		wire[31:0] c; 
	
	full_adder full_adder_inst_1(.a(a[0]), .b(b[0]), .ci(ci), .s(s[0]), .co(c[0]));
	full_adder full_adder_inst_2(.a(a[1]), .b(b[1]), .ci(c[0]), .s(s[1]), .co(c[1]));
	full_adder full_adder_inst_3(.a(a[2]), .b(b[2]), .ci(c[1]), .s(s[2]), .co(c[2]));
	full_adder full_adder_inst_4(.a(a[3]), .b(b[3]), .ci(c[2]), .s(s[3]), .co(c[3]));
	full_adder full_adder_inst_5(.a(a[4]), .b(b[4]), .ci(c[3]), .s(s[4]), .co(c[4]));
	full_adder full_adder_inst_6(.a(a[5]), .b(b[5]), .ci(c[4]), .s(s[5]), .co(c[5]));
	full_adder full_adder_inst_7(.a(a[6]), .b(b[6]), .ci(c[5]), .s(s[6]), .co(c[6]));
	full_adder full_adder_inst_8(.a(a[7]), .b(b[7]), .ci(c[6]), .s(s[7]), .co(c[7]));
	full_adder full_adder_inst_9(.a(a[8]), .b(b[8]), .ci(c[7]), .s(s[8]), .co(c[8]));
	full_adder full_adder_inst_10(.a(a[9]), .b(b[9]), .ci(c[8]), .s(s[9]), .co(c[9]));
	full_adder full_adder_inst_11(.a(a[10]), .b(b[10]), .ci(c[9]), .s(s[10]), .co(c[10]));
	full_adder full_adder_inst_12(.a(a[11]), .b(b[11]), .ci(c[10]), .s(s[11]), .co(c[11]));
	full_adder full_adder_inst_13(.a(a[12]), .b(b[12]), .ci(c[11]), .s(s[12]), .co(c[12]));
	full_adder full_adder_inst_14(.a(a[13]), .b(b[13]), .ci(c[12]), .s(s[13]), .co(c[13]));
	full_adder full_adder_inst_15(.a(a[14]), .b(b[14]), .ci(c[13]), .s(s[14]), .co(c[14]));
	full_adder full_adder_inst_16(.a(a[15]), .b(b[15]), .ci(c[14]), .s(s[15]), .co(c[15]));
	full_adder full_adder_inst_17(.a(a[16]), .b(b[16]), .ci(c[15]), .s(s[16]), .co(c[16]));
	full_adder full_adder_inst_18(.a(a[17]), .b(b[17]), .ci(c[16]), .s(s[17]), .co(c[17]));
	full_adder full_adder_inst_19(.a(a[18]), .b(b[18]), .ci(c[17]), .s(s[18]), .co(c[18]));
	full_adder full_adder_inst_20(.a(a[19]), .b(b[19]), .ci(c[18]), .s(s[19]), .co(c[19]));
	full_adder full_adder_inst_21(.a(a[20]), .b(b[20]), .ci(c[19]), .s(s[20]), .co(c[20]));
	full_adder full_adder_inst_22(.a(a[21]), .b(b[21]), .ci(c[20]), .s(s[21]), .co(c[21]));
	full_adder full_adder_inst_23(.a(a[22]), .b(b[22]), .ci(c[21]), .s(s[22]), .co(c[22]));
	full_adder full_adder_inst_24(.a(a[23]), .b(b[23]), .ci(c[22]), .s(s[23]), .co(c[23]));
	full_adder full_adder_inst_25(.a(a[24]), .b(b[24]), .ci(c[23]), .s(s[24]), .co(c[24]));
	full_adder full_adder_inst_26(.a(a[25]), .b(b[25]), .ci(c[24]), .s(s[25]), .co(c[25]));
	full_adder full_adder_inst_27(.a(a[26]), .b(b[26]), .ci(c[25]), .s(s[26]), .co(c[26]));
	full_adder full_adder_inst_28(.a(a[27]), .b(b[27]), .ci(c[26]), .s(s[27]), .co(c[27]));
	full_adder full_adder_inst_29(.a(a[28]), .b(b[28]), .ci(c[27]), .s(s[28]), .co(c[28]));
	full_adder full_adder_inst_30(.a(a[29]), .b(b[29]), .ci(c[28]), .s(s[29]), .co(c[29]));
	full_adder full_adder_inst_31(.a(a[30]), .b(b[30]), .ci(c[29]), .s(s[30]), .co(c[30]));
	full_adder full_adder_inst_32(.a(a[31]), .b(b[31]), .ci(c[30]), .s(s[31]), .co(c[31]));
	
	assign co = c[31]; */
	
	//用四位先行进位加法器扩展成32位二进制加法器
	// wire[7:0] c;
	
	// adder_4bits adder_4bits_inst_1(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c[0]));
	// adder_4bits adder_4bits_inst_2(.a(a[7:4]), .b(b[7:4]), .ci(c[0]), .s(s[7:4]), .co(c[1])); 
	// adder_4bits adder_4bits_inst_3(.a(a[11:8]), .b(b[11:8]), .ci(c[1]), .s(s[11:8]), .co(c[2])); 
	// adder_4bits adder_4bits_inst_4(.a(a[15:12]), .b(b[15:12]), .ci(c[2]), .s(s[15:12]), .co(c[3])); 
	// adder_4bits adder_4bits_inst_5(.a(a[19:16]), .b(b[19:16]), .ci(c[3]), .s(s[19:16]), .co(c[4])); 
	// adder_4bits adder_4bits_inst_6(.a(a[23:20]), .b(b[23:20]), .ci(c[4]), .s(s[23:20]), .co(c[5])); 
	// adder_4bits adder_4bits_inst_7(.a(a[27:24]), .b(b[27:24]), .ci(c[5]), .s(s[27:24]), .co(c[6])); 
	// adder_4bits adder_4bits_inst_8(.a(a[31:28]), .b(b[31:28]), .ci(c[6]), .s(s[31:28]), .co(c[7]));
	
	// assign co = c[7];
       
       
    //用进位选择加法计数设计的32位加法器
       
    wire[7:0] c;
    wire[13:0] c_o;
        
    wire[6:0] sel;
        
    wire[3:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;
        
    mux2to1 #(.N(4)) mux_inst_1 (.out(s[7:4]), .in0(w1), .in1(w0), .sel(c[0]));
	mux2to1 #(.N(4)) mux_inst_2 (.out(s[11:8]), .in0(w3), .in1(w2), .sel(c[1]));
    mux2to1 #(.N(4)) mux_inst_3 (.out(s[15:12]), .in0(w5), .in1(w4), .sel(c[2]));
    mux2to1 #(.N(4)) mux_inst_4 (.out(s[19:16]), .in0(w7), .in1(w6), .sel(c[3]));
    mux2to1 #(.N(4)) mux_inst_5 (.out(s[23:20]), .in0(w9), .in1(w8), .sel(c[4]));
    mux2to1 #(.N(4)) mux_inst_6 (.out(s[27:24]), .in0(w11), .in1(w10), .sel(c[5]));
    mux2to1 #(.N(4)) mux_inst_7 (.out(s[31:28]), .in0(w13), .in1(w12), .sel(c[6]));
        
    assign co = c[7];
        
    adder_4bits adder_4bits_inst_1(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c[0]));
	adder_4bits adder_4bits_inst_2(.a(a[7:4]), .b(b[7:4]), .ci(1), .s(w0), .co(c_o[0])); 
	adder_4bits adder_4bits_inst_3(.a(a[7:4]), .b(b[7:4]), .ci(0), .s(w1), .co(c_o[1])); 
    adder_4bits adder_4bits_inst_4(.a(a[11:8]), .b(b[11:8]), .ci(1), .s(w2), .co(c_o[2])); 
    adder_4bits adder_4bits_inst_5(.a(a[11:8]), .b(b[11:8]), .ci(0), .s(w3), .co(c_o[3])); 
    adder_4bits adder_4bits_inst_6(.a(a[15:12]), .b(b[15:12]), .ci(1), .s(w4), .co(c_o[4])); 
    adder_4bits adder_4bits_inst_7(.a(a[15:12]), .b(b[15:12]), .ci(0), .s(w5), .co(c_o[5])); 
    adder_4bits adder_4bits_inst_8(.a(a[19:16]), .b(b[19:16]), .ci(1), .s(w6), .co(c_o[6])); 
    adder_4bits adder_4bits_inst_9(.a(a[19:16]), .b(b[19:16]), .ci(0), .s(w7), .co(c_o[7])); 
    adder_4bits adder_4bits_inst_10(.a(a[23:20]), .b(b[23:20]), .ci(1), .s(w8), .co(c_o[8])); 
    adder_4bits adder_4bits_inst_11(.a(a[23:20]), .b(b[23:20]), .ci(0), .s(w9), .co(c_o[9])); 
    adder_4bits adder_4bits_inst_12(.a(a[27:24]), .b(b[27:24]), .ci(1), .s(w10), .co(c_o[10])); 
    adder_4bits adder_4bits_inst_13(.a(a[27:24]), .b(b[27:24]), .ci(0), .s(w11), .co(c_o[11])); 
	adder_4bits adder_4bits_inst_14(.a(a[31:28]), .b(b[31:28]), .ci(1), .s(w12), .co(c_o[12]));
	adder_4bits adder_4bits_inst_15(.a(a[31:28]), .b(b[31:28]), .ci(0), .s(w13), .co(c_o[13]));
	        
    assign c[1] = (c[0] && c_o[0]) || c_o[1];
    assign c[2] = (c[1] && c_o[2]) || c_o[3];
    assign c[3] = (c[2] && c_o[4]) || c_o[5];
    assign c[4] = (c[3] && c_o[6]) || c_o[7];
    assign c[5] = (c[4] && c_o[8]) || c_o[9];
    assign c[6] = (c[5] && c_o[10]) || c_o[11];
    assign c[7] = (c[6] && c_o[12]) || c_o[13]; 
        
endmodule
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        