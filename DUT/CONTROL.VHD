		-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY control IS
   PORT( 	
	Opcode 		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	jump		: OUT 	STD_LOGIC;
	RegDst 		: OUT 	STD_LOGIC;
	ALUSrc 		: OUT 	STD_LOGIC;
	MemtoReg 	: OUT 	STD_LOGIC;
	RegWrite 	: OUT 	STD_LOGIC;
	MemRead 	: OUT 	STD_LOGIC;
	MemWrite 	: OUT 	STD_LOGIC;
	Branch 		: OUT 	STD_LOGIC;
	ALUop 		: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	clock, reset: IN 	STD_LOGIC );

END control;

ARCHITECTURE behavior OF control IS

	SIGNAL  R_format, Lw, Sw, Beq, addi, bne 	: STD_LOGIC;

BEGIN           
				-- Code to generate control signals using opcode bits
	R_format 	<=  '1'  WHEN  Opcode = "000000" ELSE '0';
	Lw          <=  '1'  WHEN  Opcode = "100011"  ELSE '0';
 	Sw          <=  '1'  WHEN  Opcode = "101011"  ELSE '0';
   	Beq         <=  '1'  WHEN  Opcode = "000100"  ELSE '0';
   	addi        <=  '1'  WHEN  ( (Opcode = "001000") or (Opcode = "001001") ) ELSE '0';	--!! 	addiu do addi
	jump        <=  '1'  WHEN  Opcode = "000010"  ELSE '0';	--!!
	Bne         <=  '1'  WHEN  Opcode = "000101"  ELSE '0';
	
	
  	RegDst    	<=  R_format;	-- '0' at addi [20-16] (ext_imm)
 	ALUSrc  	<=  Lw OR Sw OR addi;	--!!
	MemtoReg 	<=  Lw;
  	RegWrite 	<=  R_format OR Lw OR addi;	--!!
  	MemRead 	<=  Lw;
   	MemWrite 	<=  Sw; 
 	Branch      <=  Beq OR bne;
	ALUOp( 1 ) 	<=  R_format;	-- '0' at addi
	ALUOp( 0 ) 	<=  Beq; 	-- '0' at addi

   END behavior;


