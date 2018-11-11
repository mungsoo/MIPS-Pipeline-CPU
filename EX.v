`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:30:20 11/12/2009 
// Design Name: 
// Module Name:    EX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module EX(RegDst_ex, ALUCode_ex, ALUSrcA_ex, ALUSrcB_ex, Imm_ex, Sa_ex, RsAddr_ex, RtAddr_ex, RdAddr_ex,
          RsData_ex, RtData_ex, RegWriteData_wb, ALUResult_mem, RegWriteAddr_wb, RegWriteAddr_mem, 
			 RegWrite_wb, RegWrite_mem, RegWriteAddr_ex, ALUResult_ex, MemWriteData_ex, ALU_A, ALU_B);
    input RegDst_ex;
    input [4:0] ALUCode_ex;
    input ALUSrcA_ex;
    input ALUSrcB_ex;
    input [31:0] Imm_ex;
    input [31:0] Sa_ex;
    input [4:0] RsAddr_ex;
    input [4:0] RtAddr_ex;
    input [4:0] RdAddr_ex;
    input [31:0] RsData_ex;
    input [31:0] RtData_ex;
    input [31:0] RegWriteData_wb;
    input [31:0] ALUResult_mem;
    input [4:0] RegWriteAddr_wb;
    input [4:0] RegWriteAddr_mem;
    input RegWrite_wb;
    input RegWrite_mem;
    output [4:0] RegWriteAddr_ex;
    output [31:0] ALUResult_ex;
    output [31:0] MemWriteData_ex;
    output [31:0] ALU_A;
    output [31:0] ALU_B;

//forwarding
	wire[1:0] ForwardA,ForwardB;
    assign ForwardA[0] = RegWrite_wb && (RegWriteAddr_wb != 0) && (RegWriteAddr_mem != RsAddr_ex) && (RegWriteAddr_wb == RsAddr_ex);
    assign ForwardA[1] = RegWrite_mem && (RegWriteAddr_mem != 0) && (RegWriteAddr_mem == RsAddr_ex);
    assign ForwardB[0] = RegWrite_wb && (RegWriteAddr_wb != 0) && (RegWriteAddr_mem != RtAddr_ex) && (RegWriteAddr_wb == RtAddr_ex);
    assign ForwardB[1] = RegWrite_mem && (RegWriteAddr_mem != 0) && (RegWriteAddr_mem == RtAddr_ex);
    
//MUX for A
    wire[31:0] A;
    
    mux3to1 #(.N(32)) mux3to1_inst_1(.out(A), .in0(RsData_ex), .in1(RegWriteData_wb), .in2 (ALUResult_mem), .sel(ForwardA));

//MUX for B
    
    wire[31:0] B;
	mux3to1 #(.N(32)) mux3to1_inst_2(.out(B), .in0(RtData_ex), .in1(RegWriteData_wb),  .in2(ALUResult_mem), .sel(ForwardB));

 
//MUX for ALU_A
    mux2to1 #(.N(32)) mux2to1_inst_1(.out(ALU_A), .in0(A), .in1(Sa_ex), .sel(ALUSrcA_ex));
    


//MUX for ALU_B
    mux2to1 #(.N(32)) mux2to1_inst_2(.out(ALU_B), .in0(B), .in1(Imm_ex), .sel(ALUSrcB_ex));
    assign MemWriteData_ex = B;


//ALU inst
	 ALU  ALU (
	 // Outputs
	.Result(ALUResult_ex),
	.overflow(),
	// Inputs
	.ALUCode(ALUCode_ex), 
	.A(ALU_A), 
	.B(ALU_B)
);
	 
//MUX for RegWriteAddr_ex

    mux2to1 #(.N(5)) mux2to1_inst_3(.out(RegWriteAddr_ex), .in0(RtAddr_ex), .in1(RdAddr_ex), .sel(RegDst_ex));


endmodule
