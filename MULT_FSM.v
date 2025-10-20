//-----------------------------------------------------------------------------
//
// Title       : MULT_FSM
// Design      : UNS_3X3_MULT
// Author      : ashiqurakash403@gmail.com
// Company     : AIUB
//
//-----------------------------------------------------------------------------
//
// File        : E:\!\S10\VHDL\FinalTerm\Lab\Project\Final_Project\UNS_3X3_MULT\src\MULT_FSM.v
// Generated   : Fri Jan 31 22:49:21 2025
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
import MULT_PKG::*;

extern module MULT_FSM (
	input logic SYS_CLOCK,
	input logic FSM_ARESET,
	input logic GO,
	input logic EQUAL,
	output logic [1:0] MUX_IN1_CONT,
	output logic [1:0] MUX_IN2_CONT,
	output logic [2:0] ALU_CONT,
	output logic LOAD_A_REG,
	output logic LOAD_B_REG,
	output logic LOAD_R1_REG,
	output logic LOAD_R2_REG,
	output logic LOAD_Y_REG,
	output logic READY
);

module MULT_FSM (.*);	
	
	logic [STATE_REG_WIDTH-1 : 0] P_STATE, N_STATE;
	
	always_comb
	begin : NEXT_STATE_AND_OUTPUT_LOGIC
		
	begin : NEXT_STATE_LOGIC
	N_STATE = 'x; 	
	
	case (P_STATE)		
	3'b000: begin 				
			 if (!GO) N_STATE = 3'b000;	 
			 else N_STATE = 3'b001;	
			 end
			 
	3'b001: N_STATE = 3'b010;
	3'b010: N_STATE = 3'b011;
	3'b011:	begin
			if(EQUAL) N_STATE = 3'b100;
			else N_STATE = 3'b010;
			end
	3'b100: N_STATE = 3'b000; 
 			
	default: N_STATE = '0;	
	endcase		
	end : NEXT_STATE_LOGIC	
		
	begin : OUTPUT_LOGIC
	 	
	{READY,LOAD_A_REG,LOAD_B_REG,LOAD_R1_REG, LOAD_R2_REG, LOAD_Y_REG,ALU_CONT,MUX_IN1_CONT,MUX_IN2_CONT} = '0;
	case (P_STATE)		
	3'b000: begin READY = '1;
		if (GO) begin
			LOAD_A_REG = '1;
			LOAD_B_REG = '1;
		end	   end
		 																	
	3'b001: 	begin 
							
				ALU_CONT = 2'b10 ;	 
				LOAD_R1_REG = '1;
				LOAD_R2_REG = '1;
					
					end	
	
	3'b010: 	begin 			 
				 	MUX_IN1_CONT = 1;
					MUX_IN2_CONT = 0;
					ALU_CONT = 2'b01;	
					LOAD_R1_REG = '1;
				end							
	
	3'b011: 	begin 
					MUX_IN1_CONT = 0;
					ALU_CONT = 2'b00;
					LOAD_R2_REG = '1;
					end
	  
	
	3'b100: 	LOAD_Y_REG = '1; 
				 	

	default: ;	
	endcase		
	end : OUTPUT_LOGIC	 
	
	end : NEXT_STATE_AND_OUTPUT_LOGIC 
	
	
	always_ff @ (posedge SYS_CLOCK,posedge FSM_ARESET)
	begin : PRESENT_STATE_REGISTER
		if (FSM_ARESET)
			P_STATE <= '0;
		else
			P_STATE <= N_STATE;		
	end : PRESENT_STATE_REGISTER
	
endmodule : MULT_FSM                                                                                                                             
								

