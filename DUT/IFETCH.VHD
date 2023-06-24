-- Ifetch module (provides the PC and instruction 
--memory for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Ifetch IS
	generic( width_A: positive:=10 );

	PORT(	SIGNAL Instruction 		: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	SIGNAL PC_plus_4_out 	: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	SIGNAL Add_result 		: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        	SIGNAL Branch 			: IN 	STD_LOGIC;
        	SIGNAL Zero 			: IN 	STD_LOGIC;
      		SIGNAL PC_out 			: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	SIGNAL clock, reset 	: IN 	STD_LOGIC;
			-----------------------------------------------------------------
			signal Quartus			: IN    STD_LOGIC;
			SIGNAL Instruction_ID 	: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			SIGNAL stall			: IN    STD_LOGIC;
			SIGNAL jump_adress 		: IN 	STD_LOGIC_VECTOR(25 DOWNTO 0);
			SIGNAL jump			 	: IN 	STD_LOGIC; 
			SIGNAL equal			: IN	STD_LOGIC );

			
END Ifetch;

ARCHITECTURE behavior OF Ifetch IS
	SIGNAL PC, PC_plus_4, Mem_Addr 	 : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL next_PC  : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	------------------------------------------------------------
	SIGNAL Instruction_sig   : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Instruction_sig1   : STD_LOGIC_VECTOR( 31 DOWNTO 0 );		-- try


BEGIN

--------------------------------------------------------	try!!!!!!!!!!
--process
	--begin
		--WAIT UNTIL ( clock'EVENT ) AND ( clock = '0' );
		--Instruction_sig <= Instruction_sig1;
	--end process;
--------------------------------------------------------		

	Instruction <= Instruction_sig;

						--ROM for Instruction Memory
inst_memory: altsyncram
	
	GENERIC MAP (
		operation_mode => "ROM",
		width_a => 32,
		widthad_a => width_A, 
		lpm_type => "altsyncram",
		outdata_reg_a => "UNREGISTERED",
		init_file => "C:\altera\lab5\mars\transposeProg.hex",
		intended_device_family => "Cyclone"
	)
	PORT MAP (
		clock0     => clock,
		address_a 	=> Mem_Addr(9 downto 10-width_A), 
		q_a 			=> Instruction_sig );
		
		
					-- Instructions always start on word address - not byte
		PC(1 DOWNTO 0) <= "00";
		
					-- copy output signals - allows read inside module
		PC_out 			<= PC;
		PC_plus_4_out 	<= PC_plus_4;
		
						-- send address to inst. memory address register
		Mem_Addr <= Next_PC & "00";
		
						-- Adder to increment PC by 4        
      	PC_plus_4( 9 DOWNTO 2 )  <= PC( 9 DOWNTO 2 ) + 1;
       	PC_plus_4( 1 DOWNTO 0 )  <= "00";
		
		
						-- Mux to select Branch Address or PC + 4        
		Next_PC  <= X"00" WHEN Reset = '1' ELSE
					Add_result  WHEN ( ( Branch = '1' ) AND ((equal xor Instruction_ID(26)) = '1' )) ELSE --!!	equal xor Instruction(26) = COND
					jump_adress(7 DOWNTO 0) WHEN (jump = '1') ELSE
					PC(9 DOWNTO 2) WHEN stall = '1' ELSE
					PC_plus_4( 9 DOWNTO 2 );

						-- PC REG --
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   PC( 9 DOWNTO 2) <= "00000000" ; 
			ELSE			
				   PC( 9 DOWNTO 2 ) <= next_PC;
					
				--END IF;
			END IF;
				
	END PROCESS;
	
END behavior;


