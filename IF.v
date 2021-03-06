`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:21 11/12/2009 
// Design Name: 
// Module Name:    IF 
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
module IF(clk, reset, Z, J, JR, PC_IFWrite, JumpAddr, 
           JrAddr, BranchAddr, Instruction_if,PC, NextPC_if);
    input clk;
    input reset;
    input Z;
    input J;
    input JR;
    input PC_IFWrite;
    input [31:0] JumpAddr;
    input [31:0] JrAddr;
    input [31:0] BranchAddr;
    output [31:0] Instruction_if;
    output [31:0] PC,NextPC_if;
 

// MUX for PC
    reg[31:0] PC_in;
    always@(*)
    begin
        case({JR, J, Z})
            3'b000:
                PC_in = NextPC_if;
            3'b001:
                PC_in = BranchAddr;
            3'b010:
                PC_in = JumpAddr;
            3'b100:
                PC_in = JrAddr;
        endcase
    end
    

	
//PC REG
//A dffre, with Reset and En
    dffre #(.N(32)) pcreg(.d(PC_in), .en(PC_IFWrite), .r(reset), .clk(clk), .q(PC));

     
//Adder for NextPC
//这里CO接口不接是不是可以不描述
    adder_32bits PC_adder(.a(PC), .b(32'd4), .ci(1'b0), .s(NextPC_if), .co());

  	
	  
//ROM
InstructionROM  InstructionROM(
	.addr(PC[7:2]),
	.dout(Instruction_if));
	
endmodule
