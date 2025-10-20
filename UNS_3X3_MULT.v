//-----------------------------------------------------------------------------
//
// Title       : UNS_3X3_MULT
// Design      : UNS_3X3_MULT
// Author      : ashiqurakash403@gmail.com
// Company     : AIUB
//
//-----------------------------------------------------------------------------
//
// File        : E:\!\S10\VHDL\FinalTerm\Lab\Project\Final_Project\UNS_3X3_MULT\src\UNS_3X3_MULT.v
// Generated   : Sat Feb  1 02:14:58 2025
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
import MULT_PKG::*;

extern module UNS_3X3_MULT (  	
	input logic SYS_CLOCK, 
	input logic FSM_ARESET,
	input logic GO,
	input logic [MULTIPLICAND_WIDTH-1 : 0] A,
	input logic [MULTIPLIER_WIDTH-1 : 0] B,
	output var logic [PRODUCT_WIDTH-1 : 0] Y_REG,
	output logic READY
);

module UNS_3X3_MULT (.*);

//INTERNAL SIGNALS
//CONTROL SIGNALS 

	logic [1:0] MUX_IN1_CONT;
	logic [1:0] MUX_IN2_CONT;
	logic [2:0] ALU_CONT;
	logic LOAD_A_REG;
	logic LOAD_B_REG;
	logic LOAD_R1_REG;
	logic LOAD_R2_REG;
	logic LOAD_Y_REG;
	logic EQUAL;
	
	MULT_FSM FSM (.*); 
	MULT_DATAPATH DP (.*);
	
endmodule : UNS_3X3_MULT

