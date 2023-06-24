				-- Top Level Structural Model for MIPS Processor Core
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY MIPS IS

	generic( width_A: positive:= 8);

	PORT( reset, clock					: IN 	STD_LOGIC; 
		-- Output important signals to pins for easy display in Simulator
		PC								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		-------------------------------------------------------------------------
		STCNT_out    				: OUT 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		FHCNT_out   				: OUT 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		CLCKCNT_out					: OUT 	STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		STtrigger_out				: OUT	STD_LOGIC;
		BPADD 						: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 )	);
		
	END MIPS;

ARCHITECTURE structure OF MIPS IS

	COMPONENT Ifetch
		 generic( width_A: positive:=10 );

   	     PORT(	Instruction			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		PC_plus_4_out 		: OUT  	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        		Add_result 			: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        		Branch 				: IN 	STD_LOGIC;
        		Zero 				: IN 	STD_LOGIC;
        		PC_out 				: OUT 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        		clock,reset 		: IN 	STD_LOGIC;
				--------------------------------------------------------------
				Quartus				: IN    STD_LOGIC;
				Instruction_ID 		: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				stall				: IN	STD_LOGIC;
				jump_adress 		: IN 	STD_LOGIC_VECTOR(25 DOWNTO 0);
				jump			 	: IN 	STD_LOGIC; 
				equal				: IN	STD_LOGIC );
				
	END COMPONENT; 

	COMPONENT Idecode
 	     PORT(	read_data_1 		: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		read_data_2 		: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		Instruction 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		read_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		ALU_result 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		RegWrite, MemtoReg 	: IN 	STD_LOGIC;
				-- RegDst DELETED
        		Sign_extend 		: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		clock, reset		: IN 	STD_LOGIC;
				--------------------------------------------------------------
				write_register_address 	:IN STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				write_data_out 		: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0);				
				jump_adress 		: OUT 	STD_LOGIC_VECTOR(25 DOWNTO 0);
				Instruction_out 	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				equal				: OUT	STD_LOGIC;	
				Add_Result 			: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
				PC_plus_4			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 ) );
				
	END COMPONENT;

	COMPONENT control
	     PORT( 	Opcode 				: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
             	jump 				: OUT 	STD_LOGIC;						--!!!
             	RegDst 				: OUT 	STD_LOGIC;
             	ALUSrc 				: OUT 	STD_LOGIC;
             	MemtoReg 			: OUT 	STD_LOGIC;
             	RegWrite 			: OUT 	STD_LOGIC;
             	MemRead 			: OUT 	STD_LOGIC;
             	MemWrite 			: OUT 	STD_LOGIC;
             	Branch 				: OUT 	STD_LOGIC;
             	ALUop 				: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
             	clock, reset		: IN 	STD_LOGIC );
				
				
	END COMPONENT;

	COMPONENT  Execute
   	     PORT(	Read_data_1 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
                Read_data_2 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Sign_Extend 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Function_opcode		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
               	ALUOp 				: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
               	ALUSrc 				: IN 	STD_LOGIC;
               	Zero 				: OUT	STD_LOGIC;
               	ALU_Result 			: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	PC_plus_4 			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
               	clock, reset		: IN 	STD_LOGIC;
				-----------------------------------------
				RegDst 				: IN 	STD_LOGIC;
				write_register_address : OUT STD_LOGIC_VECTOR ( 4 DOWNTO 0 );
				Instruction_20_11   : IN  	STD_LOGIC_VECTOR( 9 DOWNTO 0 ) );
	END COMPONENT;


	COMPONENT dmemory
		 generic( width_A: integer:=8 );

	     PORT(	read_data 			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		address 			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        		write_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		MemRead, Memwrite 	: IN 	STD_LOGIC;
        		Clock,reset			: IN 	STD_LOGIC );
	END COMPONENT;
	
	COMPONENT Display
		 

   PORT(	
	
   ID_Instruction 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
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
				
	END COMPONENT; 

					-- declare signals used to connect VHDL components
	SIGNAL PC_plus_4_Fetch	: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL read_data_1_ID 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );	--!!
	SIGNAL read_data_2_ID 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );  --!!
	SIGNAL Sign_Extend_ID 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Add_result 		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_result 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL ALUSrc_ID		: STD_LOGIC;		--!!
	SIGNAL Branch 			: STD_LOGIC;
	SIGNAL RegDst_CTL		: STD_LOGIC;
	SIGNAL Regwrite 		: STD_LOGIC;
	SIGNAL Zero 			: STD_LOGIC;
	SIGNAL MemWrite_CTL		: STD_LOGIC;
	SIGNAL MemtoReg_CTL 	: STD_LOGIC;
	SIGNAL MemRead_CTL		: STD_LOGIC;
	SIGNAL ALUop_ID 		: STD_LOGIC_VECTOR(  1 DOWNTO 0 );	--!!
	SIGNAL Instruction_Fetch: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	--------------------------------------------------------------------!!
	
	-------- hazard detect unit --------
	SIGNAL IF_Dwrite	 	: STD_LOGIC  := '0';
	SIGNAL stall			: STD_LOGIC  := '0';
	-----------------------------------
	
	SIGNAL jump 			: STD_LOGIC;	--!!
				-- IF/ID --
	SIGNAL Instruction_IF_ID: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL PC_plus_4_IF_ID  : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				-- ID/EX --
	SIGNAL read_data_1_ID_EX: STD_LOGIC_VECTOR( 31 DOWNTO 0 );	--!!
	SIGNAL read_data_2_ID_EX: STD_LOGIC_VECTOR( 31 DOWNTO 0 );	--!!	
	SIGNAL Sign_Extend_ID_EX: STD_LOGIC_VECTOR( 31 DOWNTO 0 );	
	SIGNAL ALUSrc_ID_EX		: STD_LOGIC;
	SIGNAL ALUop_ID_EX		: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Regwrite_CTL 	: STD_LOGIC;
	SIGNAL Regwrite_ID_EX 	: STD_LOGIC;
	SIGNAL equal			: STD_LOGIC;
	SIGNAL Instruction_ID	: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Instruction_ID_EX: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL RegDst_ID_EX 	: STD_LOGIC;
    SIGNAL MemRead_ID_EX	: STD_LOGIC;
	SIGNAL MemWrite_ID_EX	: STD_LOGIC;	
				-- EX/MEM --
	SIGNAL write_register_address_EX : STD_LOGIC_VECTOR ( 4 DOWNTO 0 );
	SIGNAL write_register_address_EX_MEM : STD_LOGIC_VECTOR ( 4 DOWNTO 0 );
	SIGNAL ALU_result_EX_MEM: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL RegWrite_EX_MEM 	: STD_LOGIC;
    SIGNAL MemRead_EX_MEM	: STD_LOGIC;
	SIGNAL MemWrite_EX_MEM	: STD_LOGIC;	
				-- MEM/WB --
	SIGNAL write_register_address_MEM_WB : STD_LOGIC_VECTOR ( 4 DOWNTO 0 );
	SIGNAL ALU_result_MEM_WB : STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
	SIGNAL read_data_MEM_WB : STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
	------ CONTROL ------
	------    WB   ------
	SIGNAL RegWrite_MEM_WB 	: STD_LOGIC;
	SIGNAL MEMtoreg_ID_EX 	: STD_LOGIC;
	SIGNAL MEMtoreg_EX_MEM 	: STD_LOGIC;
	SIGNAL MEMtoreg_MEM_WB 	: STD_LOGIC;
	-----------------------------------
	SIGNAL jump_adress		:STD_LOGIC_VECTOR(25 DOWNTO 0);
	SIGNAL read_data_2_EX_MEM: STD_LOGIC_VECTOR( 31 DOWNTO 0 );	--!!
	SIGNAL Reg_rs_ID_EX		: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL Reg_rt_ID_EX		: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL write_data_final_mux: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal read_data_1		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal read_data_2		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal forwardA			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	signal forwardB			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Reg_rs_IF_ID		: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL Reg_rt_IF_ID		: STD_LOGIC_VECTOR(4 DOWNTO 0);				
	signal read_data_1_cor_ID	: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal read_data_2_cor_ID	: STD_LOGIC_VECTOR( 31 DOWNTO 0 );		
	signal NOT_USED			: STD_LOGIC;		
	signal forwardA_to_ID			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	signal forwardB_to_ID			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	------------------------------------------------------------------
	SIGNAL Quartus  		:STD_LOGIC := '0'; -- 0 for MODELSIM 1 for QUARTUS
	SIGNAL STtrigger		: STD_LOGIC := '0';
	SIGNAL CLCKCNT 			: STD_LOGIC_VECTOR( 15 DOWNTO 0 ) := X"0000";
	SIGNAL STCNT 			: STD_LOGIC_VECTOR( 7 DOWNTO 0 ) := X"00";	
	SIGNAL FHCNT 			: STD_LOGIC_VECTOR( 7 DOWNTO 0 ) := X"00";
	SIGNAL PC_sig 			: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	signal address_mem		: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	signal Instruction_EX_MEM: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal Instruction_MEM_WB: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	------------------------- DISPLAY --------------------------
	signal ID_Instruction: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal ID_read_data_1: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal ID_read_data_2: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal ID_write_data: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal ID_Regwrite: STD_LOGIC;
	signal ID_branch: STD_LOGIC;
	signal EX_Instruction: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal EX_ALU_result: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal EX_ALUAinput: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal EX_ALUBinput: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal EX_Zero: STD_LOGIC;
	signal MEM_Instruction: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal MEM_MEM_write: STD_LOGIC;
	signal MEM_write_data: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal MEM_read_data: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal MEM_address: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	signal WB_Instruction: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	signal WB_memtoreg: STD_LOGIC;
	
BEGIN

	
			-- SIGNALS FOR DISPLAY --
   PC				<= PC_sig;
	
   ID_Instruction 	<= Instruction_ID;
   ID_read_data_1   <= read_data_1_ID;
   ID_read_data_2   <= read_data_2_ID;
   ID_write_data	<= write_data_final_mux;
   ID_Regwrite		<= RegWrite_MEM_WB;
   ID_branch        <= Branch;
   
   EX_Instruction	<= Instruction_ID_EX;
   EX_ALU_result	<= ALU_result;
   EX_ALUAinput		<= Read_data_1;
   EX_ALUBinput	 	<= Read_data_2 WHEN ( ALUSrc_ID_EX = '0' ) 
					ELSE  Sign_extend_ID_EX( 31 DOWNTO 0 );
   EX_Zero			<= Zero;
   
   MEM_Instruction	<= Instruction_EX_MEM;
   MEM_MEM_write	<= MemWrite_EX_MEM;
   MEM_write_data	<= read_data_2_EX_MEM;
   MEM_read_data	<= read_data;
   MEM_address		<= ALU_Result (9 DOWNTO 2)& "00";
   
   WB_Instruction	<= Instruction_MEM_WB;
   WB_memtoreg      <= MemtoReg_MEM_WB;
   
   STtrigger_out    <= STtrigger;
   CLCKCNT_out 	    <= CLCKCNT;   
   STCNT_out    	<= STCNT; 
   FHCNT_out   		<= FHCNT;  
   
   
  DISP : Display
	PORT MAP (	ID_Instruction 	=> ID_Instruction,
   ID_read_data_1   => ID_read_data_1,
   ID_read_data_2   => ID_read_data_2,
   ID_write_data	=> ID_write_data,
   ID_Regwrite		=> ID_Regwrite,
   ID_branch        => ID_branch,
   
   EX_Instruction	=> EX_Instruction,
   EX_ALU_result	=> EX_ALU_result,
   EX_ALUAinput		=> EX_ALUAinput,
   EX_ALUBinput	 	=> EX_ALUBinput,
   EX_Zero			=> EX_Zero,
   
   MEM_Instruction	=> MEM_Instruction,
   MEM_MEM_write	=> MEM_MEM_write,
   MEM_write_data	=> MEM_write_data,
   MEM_read_data	=> MEM_read_data,
   MEM_address		=> MEM_address,
   
   WB_Instruction	=> WB_Instruction,
   WB_memtoreg      => WB_memtoreg
    );
				
				
					-- connect the 5 MIPS components   
  IFE : Ifetch
	generic map (width_A)
	PORT MAP (	Instruction 	=> Instruction_Fetch,
    	    	PC_plus_4_out 	=> PC_plus_4_Fetch,
				Add_result 		=> Add_result,
				Branch 			=> Branch,
				Zero 			=> Zero,
				PC_out 			=> PC_sig,        		
				clock 			=> clock,  
				reset 			=> reset, 
				--------------------------
				Quartus			=> Quartus,
				Instruction_ID	=> Instruction_IF_ID,
				stall			=> stall,
				jump_adress		=> jump_adress,
				jump			=> jump,
				equal			=> equal );

   ID : Idecode
   	PORT MAP (	read_data_1 	=> read_data_1_ID,
        		read_data_2 	=> read_data_2_ID,
        		Instruction 	=> Instruction_IF_ID,
        		read_data 		=> read_data_MEM_WB,		-- go to mux WRITE DATA!!!
				ALU_result 		=> ALU_result_MEM_WB,		-- go to mux WRITE DATA!!!
				RegWrite 		=> RegWrite_MEM_WB,
				MemtoReg 		=> MemtoReg_MEM_WB,
				-- RegDst DELETED
				Sign_extend 	=> Sign_extend_ID,
        		clock 			=> clock,  
				reset 			=> reset,
				--------------------------------------
				write_register_address => write_register_address_MEM_WB,
				write_data_out	=> write_data_final_mux,
				jump_adress		=> jump_adress,
				Instruction_out => Instruction_ID,
				equal			=> NOT_USED,
				Add_Result 		=> Add_result,
				PC_plus_4		=> PC_plus_4_IF_ID );


   CTL:   control
	PORT MAP ( 	Opcode 			=> Instruction_IF_ID( 31 DOWNTO 26 ),
				jump 			=> jump,
				RegDst 			=> RegDst_CTL,
				ALUSrc 			=> ALUSrc_ID,
				MemtoReg 		=> MemtoReg_CTL,
				RegWrite 		=> RegWrite_CTL,
				MemRead 		=> MemRead_CTL,
				MemWrite 		=> MemWrite_CTL,
				Branch 			=> Branch,
				ALUop 			=> ALUop_ID,
                clock 			=> clock,
				reset 			=> reset );

   EXE:  Execute
   	PORT MAP (	Read_data_1 	=> read_data_1,
             	Read_data_2 	=> read_data_2,
				Sign_extend 	=> Sign_extend_ID_EX,
                Function_opcode	=> Sign_extend_ID_EX( 5 DOWNTO 0 ),		--!!!
				ALUOp 			=> ALUop_ID_EX,			--!!
				ALUSrc			=> ALUSrc_ID_EX,		--!!
				Zero 			=> Zero,
                ALU_Result		=> ALU_Result,
				PC_plus_4		=> PC_plus_4_IF_ID,
                Clock			=> clock,
				Reset			=> reset,
				-----------------------------------------------------
				RegDst			=> RegDst_ID_EX,
				write_register_address => write_register_address_EX,
				Instruction_20_11 => Instruction_ID_EX(20 downto 11) );


		address_mem <= ALU_result_EX_MEM (9 DOWNTO 2) & "00";
   MEM:  dmemory
   	generic map (width_A)

	PORT MAP (	read_data 		=> read_data,
				address 		=> address_mem, -- jump memory address by 4
				write_data 		=> read_data_2_EX_MEM,
				MemRead 		=> MemRead_EX_MEM, 
				Memwrite 		=> MemWrite_EX_MEM, 
                clock 			=> clock,  
				reset 			=> reset );
		
--------------------- IF/ID REG -----------------------------		
PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			
			if (IF_Dwrite = '1') then	
				Instruction_IF_ID <= X"00000000";
				PC_plus_4_IF_ID   <= X"00" & B"00";
				
			else
				if (stall = '1') then
					Instruction_IF_ID <= Instruction_IF_ID; 
					PC_plus_4_IF_ID   <= PC_plus_4_IF_ID;
				else
					Instruction_IF_ID <= Instruction_Fetch; 
					PC_plus_4_IF_ID   <= PC_plus_4_Fetch;
				end if;
			end if;
			
	END PROCESS;
	
	--------------------- ID/EX REG -----------------------------		
PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			
				read_data_1_ID_EX <= read_data_1_ID; 
				read_data_2_ID_EX <= read_data_2_ID;
				Sign_extend_ID_EX <= Sign_extend_ID;
				Instruction_ID_EX <= Instruction_IF_ID;
				
				------ CONTROL ------
				IF (stall = '0') THEN			-- flush on 2 dependets
				------    EX   ------
				ALUSrc_ID_EX <= ALUSrc_ID; 
				ALUop_ID_EX  <= ALUop_ID;
				RegDst_ID_EX <= RegDst_CTL; 
				------    WB   ------
				RegWrite_ID_EX <= RegWrite_CTL;
				MemtoReg_ID_EX <= MemtoReg_CTL;
				------    M	   ------
				MemRead_ID_EX  <= MemRead_CTL; 
				MemWrite_ID_EX <= MemWrite_CTL;
				
				ELSE
				------    EX   ------
				ALUSrc_ID_EX <= '0'; 
				ALUop_ID_EX  <= B"00";
				RegDst_ID_EX <= '0'; 
				------    WB   ------
				RegWrite_ID_EX <= '0';
				MemtoReg_ID_EX <= '0';
				------    M	   ------
				MemRead_ID_EX  <= '0';
				MemWrite_ID_EX <= '0';
				
				END IF;
		END process;
		
--------------------- EX/MEM REG -----------------------------		
PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
				
				ALU_result_EX_MEM <= ALU_result;
				write_register_address_EX_MEM <= write_register_address_EX;
				read_data_2_EX_MEM <= read_data_2_ID_EX;
				Instruction_EX_MEM <= Instruction_ID_EX;
				
				
				------ CONTROL ------
				------    WB   ------
				RegWrite_EX_MEM <= RegWrite_ID_EX;
				MemtoReg_EX_MEM <= MemtoReg_ID_EX;
				------    M	   ------
				MemRead_EX_MEM  <= MemRead_ID_EX; 
				MemWrite_EX_MEM <= MemWrite_ID_EX;		
		END process;
		
--------------------- MEM\WB REG -----------------------------		
PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
				
				ALU_result_MEM_WB <= ALU_result_EX_MEM;
				read_data_MEM_WB  <= read_data;
				write_register_address_MEM_WB <= write_register_address_EX_MEM;
				Instruction_MEM_WB <= Instruction_EX_MEM;
				
				------ CONTROL ------
				------    WB   ------
				RegWrite_MEM_WB <= RegWrite_EX_MEM;
				MemtoReg_MEM_WB <= MemtoReg_EX_MEM;
		END process;
		 
		
		
				Reg_rs_ID_EX <= Instruction_ID_EX(25 downto 21);
				Reg_rt_ID_EX <= Instruction_ID_EX(20 downto 16);
				-- ====== FORWARDING UNIT ====== --	
				
	forwardA <= "10" when ( (RegWrite_EX_MEM = '1') and (write_register_address_EX_MEM /= "00000") and (write_register_address_EX_MEM = Reg_rs_ID_EX) ) else
				"01" when ( (RegWrite_MEM_WB = '1') and (write_register_address_MEM_WB /= "00000") and (write_register_address_MEM_WB = Reg_rs_ID_EX) ) else
				"00";
	
	forwardB <= "10" when ( (RegWrite_EX_MEM = '1') and (write_register_address_EX_MEM /= "00000") and (write_register_address_EX_MEM = Reg_rt_ID_EX) ) else
				"01" when ( (RegWrite_MEM_WB = '1') and (write_register_address_MEM_WB /= "00000") and (write_register_address_MEM_WB = Reg_rt_ID_EX) ) else
				"00";
				
									-- mux Ain --
				read_data_1 <= read_data_1_ID_EX when forwardA = "00" else
							   write_data_final_mux when forwardA = "01" else
							   ALU_result_EX_MEM when forwardA = "10";
							   
									-- mux Bin --
				read_data_2 <= read_data_2_ID_EX when forwardB = "00" else
							   write_data_final_mux when forwardB = "01" else
							   ALU_result_EX_MEM when forwardB = "10";
				--==============================================================
				
				Reg_rs_IF_ID <= Instruction_IF_ID(25 downto 21);
				Reg_rt_IF_ID <= Instruction_IF_ID(20 downto 16); --Rs of SW Instruction
				-- ===== LW HAZARD DETECTION ===== --
				
		stall <= '1' when ( ( (MemRead_ID_EX = '1') and ( (Reg_rt_ID_EX = Reg_rs_IF_ID) or (Reg_rt_ID_EX = Reg_rt_IF_ID) ) )
					     or (  (MemWrite_CTL = '1') and (MEMtoreg_EX_MEM = '1') and
							(write_register_address_EX_MEM = Reg_rt_IF_ID)   ) )
							
					else  '0';
				 
		IF_Dwrite <= '1' when ( (jump = '1') or ( ( Branch = '1' ) AND ((equal xor Instruction_IF_ID(26)) = '1' )) ) else
					 '0';
						
		
										-- RORWARD UNIT 2 ID EQAL --
		
		forwardA_to_ID <= "10" when ( (RegWrite_EX_MEM = '1') and (write_register_address_EX_MEM /= "00000") 
								and (write_register_address_EX_MEM = Reg_rs_IF_ID) ) else
						  "01" when ( (RegWrite_MEM_WB = '1') and (write_register_address_MEM_WB /= "00000") 
								and (write_register_address_MEM_WB = Reg_rs_IF_ID) ) else
						  "11" when ( (RegWrite_ID_EX = '1') and (write_register_address_EX /= "00000")
								and (write_register_address_EX = Reg_rs_IF_ID) ) else
						  "00";
					
		forwardB_to_ID <= "10" when ( (RegWrite_EX_MEM = '1') and (write_register_address_EX_MEM /= "00000") 
								and (write_register_address_EX_MEM = Reg_rt_IF_ID) ) else
						  "01" when ( (RegWrite_MEM_WB = '1') and (write_register_address_MEM_WB /= "00000") 
								and (write_register_address_MEM_WB = Reg_rt_IF_ID) ) else
						  "11" when ( (RegWrite_ID_EX = '1') and (write_register_address_EX /= "00000")
								and (write_register_address_EX = Reg_rt_IF_ID) ) else
						  "00";
					
								-- mux read_data_1_cor_ID --
		read_data_1_cor_ID <= read_data_1_ID when forwardA_to_ID = "00" else
							  write_data_final_mux when forwardA_to_ID = "01" else
							  ALU_result_EX_MEM when forwardA_to_ID = "10" else
							  ALU_Result when forwardA_to_ID = "11";
							  
								-- mux read_data_2_cor_ID --
		read_data_2_cor_ID <= read_data_2_ID when forwardB_to_ID = "00" else
							  write_data_final_mux when forwardB_to_ID = "01" else
							  ALU_result_EX_MEM when forwardB_to_ID = "10" else
							  ALU_Result when forwardB_to_ID = "11";
												
		
							-- check if data registers is equal			
		equal <= '1' when (read_data_1_cor_ID = read_data_2_cor_ID) else
				 '0';
	--===============================================================================================
	
		 ------------------------------- ST triggers -------------------------------------

	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF PC_sig = BPADD & "00" THEN
				   STtrigger <= '1'; 
			ELSE
					STtrigger <= '0';
			END IF;					
		END process;
		
				 		 
	 PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   CLCKCNT <= X"0000" ; 
			ELSE
					CLCKCNT <= CLCKCNT + 1;
			END IF;					
		END process;
						-----------------------------STCNT--------------------------------					
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   STCNT <= X"00" ; 
			ELSE  IF  (stall = '1') THEN
					STCNT <= STCNT + 1;
					
					END IF ;
				END IF;
				
		END process;
		------------------------------------------FHCNT----------------------------------
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   FHCNT <= X"00" ; 
			ELSE  IF  (IF_Dwrite = '1') THEN
					FHCNT <= FHCNT + 1;
					
					END IF ;
				END IF;
		END process;
			
				

END structure;

