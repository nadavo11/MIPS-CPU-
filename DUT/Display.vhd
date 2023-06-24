-- Ifetch module (provides the PC and instruction 
--memory for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Display IS

	PORT(	ID_Instruction 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   ID_read_data_1   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   ID_read_data_2   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   ID_write_data	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   ID_Regwrite		: IN STD_LOGIC;
   ID_Branch		: IN STD_LOGIC;
   
   EX_Instruction	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   EX_ALU_result	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   EX_ALUAinput		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   EX_ALUBinput	 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   EX_Zero			: IN STD_LOGIC;
   
   MEM_Instruction	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   MEM_MEM_write	: IN STD_LOGIC;
   MEM_write_data	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   MEM_read_data	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   MEM_address		: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
   
   WB_Instruction	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   WB_memtoreg      : IN STD_LOGIC
   );

			
END Display;
ARCHITECTURE behavior OF Display IS
	begin
END behavior;


