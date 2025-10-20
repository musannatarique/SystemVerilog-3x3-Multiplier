//-----------------------------------------------------------------------------
//
// Title       : MULT_DATAPATH
// Design      : UNS_3X3_MULT
// Author      : ashiqurakash403@gmail.com
// Company     : AIUB
//
//-----------------------------------------------------------------------------
//
// File        : E:\!\S10\VHDL\FinalTerm\Lab\Project\Final_Project\UNS_3X3_MULT\src\MULT_DATAPATH.v
// Generated   : Sat Feb  1 01:05:09 2025
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
import MULT_PKG::*;

module MULT_DATAPATH (
    input logic SYS_CLOCK,	 
    input logic [MULTIPLICAND_WIDTH-1 : 0] A,
    input logic [MULTIPLIER_WIDTH-1 : 0] B,
    input logic [1:0] MUX_IN1_CONT,
    input logic [1:0] MUX_IN2_CONT,
    input logic [2:0] ALU_CONT,
    input logic LOAD_A_REG,
    input logic LOAD_B_REG,
    input logic LOAD_R1_REG,
    input logic LOAD_R2_REG,
    input logic LOAD_Y_REG,
    output logic [PRODUCT_WIDTH-1 : 0] Y_REG,
    output logic EQUAL
);

    logic [PRODUCT_WIDTH-1 : 0] A_REG, B_REG;	 
    logic [PRODUCT_WIDTH-1 : 0] R1_REG, R2_REG;
    logic [PRODUCT_WIDTH-1 : 0] ALU_INP1, ALU_INP2, ALU_OUT;   

    // Input Registers
    always_ff @(posedge SYS_CLOCK) begin : INP_REGS
        if (LOAD_A_REG)
            A_REG <= { {MULTIPLICAND_WIDTH{'0}}, A};
        if (LOAD_B_REG)
            B_REG <= { {PRODUCT_WIDTH{'0}}, B};
    end : INP_REGS

    // Accumulator/Data Registers
    always_ff @(posedge SYS_CLOCK) 
	begin : ACCUM_REGS
        if (LOAD_R1_REG)
            R1_REG <= ALU_OUT;
        if (LOAD_R2_REG)
            R2_REG <= ALU_OUT;
		
    end : ACCUM_REGS

    // Output Register
    always_ff @(posedge SYS_CLOCK) 
	begin : OUT_REGS
//        if (EQUAL)
//			Y_REG <= R1_REG;
		if (LOAD_Y_REG)
            Y_REG <= R1_REG;			
    end : OUT_REGS

    // MUXes
    always_comb begin : MUXES
        case (MUX_IN1_CONT)
            1'b0: ALU_INP1 = R2_REG;  
            1'b1: ALU_INP1 = A_REG;	
            default: ALU_INP1 = 'x;	
        endcase

        case (MUX_IN2_CONT)
            1'b0: ALU_INP2 = R1_REG;    	
            default: ALU_INP2 = 'x;	
        endcase
    end : MUXES

    // ALU
    always_comb begin : ALU
        case (ALU_CONT)
            2'b00: ALU_OUT = ALU_INP1 + 1; //
            2'b01: ALU_OUT = ALU_INP1 + ALU_INP2;     
            2'b10: ALU_OUT = '0; 
			default: ALU_OUT = '0;	
        endcase
    end : ALU

    // Comparator
    always_comb begin : COMPARATOR 
        if (R2_REG == B_REG-1) 
            EQUAL = 1; 
        else 
            EQUAL = 0;  
    end : COMPARATOR

endmodule : MULT_DATAPATH
