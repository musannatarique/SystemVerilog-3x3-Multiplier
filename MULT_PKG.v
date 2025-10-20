//-----------------------------------------------------------------------------
//
// Title       : MULT_PKG
// Design      : UNS_3X3_MULT
// Company     : AIUB
//
//-----------------------------------------------------------------------------
//
// File        : E:\!\S10\VHDL\FinalTerm\Lab\Project\Final_Project\UNS_3X3_MULT\src\MULT_PKG.v
// Generated   : Fri Jan 31 22:46:02 2025
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
package MULT_PKG; 

parameter MULTIPLICAND_WIDTH = 3;	  
parameter MULTIPLIER_WIDTH = 3;
localparam PRODUCT_WIDTH = MULTIPLICAND_WIDTH + MULTIPLIER_WIDTH; 

parameter NO_OF_STATE = 6;
localparam STATE_REG_WIDTH = $clog2(NO_OF_STATE);
	
endpackage : MULT_PKG