timeunit 1ns;
timeprecision 1ps;

import MULT_PKG::*;

module UNS_3X3_MULT_tb;


//Internal signals declarations:
logic SYS_CLOCK;
logic GO; 
logic FSM_ARESET;
logic READY;

//HIERARCHICAL REFERENCE TO VIEW INTERNAL SIGNALS IN SIMULATION DIRECTLY 
logic [STATE_REG_WIDTH-1 : 0] P_STATE, N_STATE;

logic LOAD_A_REG;
logic [MULTIPLICAND_WIDTH-1:0]A;
logic [PRODUCT_WIDTH-1 : 0] A_REG;
 
logic LOAD_B_REG;
logic [MULTIPLIER_WIDTH-1:0]B;
logic [PRODUCT_WIDTH-1 : 0] B_REG;	
  
logic [PRODUCT_WIDTH-1 : 0] ALU_OUT; 

logic LOAD_R1_REG;
logic [PRODUCT_WIDTH-1 : 0] R1_REG;
logic LOAD_R2_REG;
logic [PRODUCT_WIDTH-1 : 0] R2_REG;
logic LOAD_Y_REG;
logic [PRODUCT_WIDTH-1:0]Y_REG;	  


//HIERARCHICAL REFERENCE TO VIEW INTERNAL SIGNALS IN SIMULATION DIRECTLY 

assign A_REG = UNS_3X3_MULT_tb.UUT.DP.A_REG; 
assign B_REG = UNS_3X3_MULT_tb.UUT.DP.B_REG;	
assign R1_REG = UNS_3X3_MULT_tb.UUT.DP.R1_REG;
assign R2_REG = UNS_3X3_MULT_tb.UUT.DP.R2_REG;
assign LOAD_A_REG = UNS_3X3_MULT_tb.UUT.LOAD_A_REG;
assign LOAD_B_REG = UNS_3X3_MULT_tb.UUT.LOAD_B_REG;
assign LOAD_R1_REG = UNS_3X3_MULT_tb.UUT.LOAD_R1_REG;
assign LOAD_R2_REG = UNS_3X3_MULT_tb.UUT.LOAD_R2_REG;
assign LOAD_Y_REG = UNS_3X3_MULT_tb.UUT.LOAD_Y_REG;	
assign ALU_OUT = UNS_3X3_MULT_tb.UUT.DP.ALU_OUT;
assign P_STATE = UNS_3X3_MULT_tb.UUT.FSM.P_STATE;
assign N_STATE = UNS_3X3_MULT_tb.UUT.FSM.N_STATE;  
assign EQUAL = UNS_3X3_MULT_tb.UUT.FSM.EQUAL;
// Unit Under Test port map
	UNS_3X3_MULT UUT (
		.SYS_CLOCK(SYS_CLOCK),
		.FSM_ARESET(FSM_ARESET),
		.GO(GO),
		.A(A),
		.B(B),
		.Y_REG(Y_REG),
		.READY(READY));
	
	time CLOCK_PERIOD = 100ns; 	
	
	initial
	begin : CLOCK_GENERATOR
	SYS_CLOCK = '0;
	
		forever
		begin	
		#(CLOCK_PERIOD/2);
		SYS_CLOCK = ~ SYS_CLOCK;			
		end			
	end : CLOCK_GENERATOR 

	initial
	begin : ARESET_GENERATOR
	FSM_ARESET = '0;
	fork
	#3000ns FSM_ARESET = '1;	
	#3020ns FSM_ARESET = '0;	
	join
	end : ARESET_GENERATOR
	
	initial
	begin : DATA_GENERATOR
	A = 3'd7; B = 3'd2;
	
		forever
		begin	
		@ (negedge SYS_CLOCK);
			if (READY)
			begin	
				//PSEUD-RANDOM NUMBER GENERATOR FOR GENERATING A AND B
				A = { A[1:0], (A[2] ^ A[0]) };
				B = { B[1:0], (B[2] ^ B[0]) }; 
			end
		end			
	end : DATA_GENERATOR

	initial
	begin : GO_GENERATOR
	GO = '0;
	
		forever
		begin	
		@ (negedge SYS_CLOCK);
			if (UNS_3X3_MULT_tb.UUT.READY)
			begin			
				GO = '1;
				#100ns;
				GO = '0;
			end
		end			
	end : GO_GENERATOR	

	  
	time RUN_TIME = 10000ns; 
	
	initial
	begin : SIMULATION_CONTROL 			

		#RUN_TIME;
		$finish;	
		
	end : SIMULATION_CONTROL 

endmodule : UNS_3X3_MULT_tb