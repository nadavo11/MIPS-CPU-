onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TB /mips_tb/ALU_result_out
add wave -noupdate -group TB /mips_tb/Branch_out
add wave -noupdate -group TB /mips_tb/Instruction_out
add wave -noupdate -group TB /mips_tb/Memwrite_out
add wave -noupdate -group TB /mips_tb/PC
add wave -noupdate -group TB /mips_tb/Regwrite_out
add wave -noupdate -group TB /mips_tb/Zero_out
add wave -noupdate -group TB /mips_tb/clock
add wave -noupdate -group TB /mips_tb/read_data_1_out
add wave -noupdate -group TB /mips_tb/read_data_2_out
add wave -noupdate -group TB /mips_tb/reset
add wave -noupdate -group TB /mips_tb/write_data_out
add wave -noupdate -group FORWARD -radix hexadecimal /mips_tb/U_0/Instruction_IF_ID
add wave -noupdate -group FORWARD -radix decimal /mips_tb/U_0/ALU_result_EX_MEM
add wave -noupdate -group FORWARD /mips_tb/U_0/MEMtoreg_EX_MEM
add wave -noupdate -group FORWARD /mips_tb/U_0/RegWrite_EX_MEM
add wave -noupdate -group FORWARD -radix decimal /mips_tb/U_0/write_data_final_mux
add wave -noupdate -group FORWARD /mips_tb/U_0/MEMtoreg_MEM_WB
add wave -noupdate -group FORWARD -radix decimal /mips_tb/U_0/Reg_rs_ID_EX
add wave -noupdate -group FORWARD -radix decimal /mips_tb/U_0/Reg_rt_ID_EX
add wave -noupdate -group FORWARD /mips_tb/U_0/forwardA
add wave -noupdate -group FORWARD /mips_tb/U_0/forwardB
add wave -noupdate -group FORWARD -radix decimal /mips_tb/U_0/Reg_rs_IF_ID
add wave -noupdate -group FORWARD /mips_tb/U_0/write_register_address_EX
add wave -noupdate -group FORWARD /mips_tb/U_0/write_register_address_EX_MEM
add wave -noupdate -group FORWARD /mips_tb/U_0/write_register_address_MEM_WB
add wave -noupdate -group FORWARD -radix decimal /mips_tb/U_0/Reg_rt_IF_ID
add wave -noupdate -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/Instruction
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/PC_plus_4_out
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/Add_result
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/Zero
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/PC_out
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/reset
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/stall
add wave -noupdate -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/jump_adress
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/clock
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/jump
add wave -noupdate -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/PC
add wave -noupdate -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/PC_plus_4
add wave -noupdate -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/next_PC
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/equal
add wave -noupdate -group Fetch /mips_tb/U_0/IFE/Branch
add wave -noupdate -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/Mem_Addr
add wave -noupdate -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/Instruction_sig
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/read_data_1
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/read_data_2
add wave -noupdate -group ID -radix hexadecimal /mips_tb/U_0/ID/Instruction
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/read_data
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/ALU_result
add wave -noupdate -group ID /mips_tb/U_0/ID/RegWrite
add wave -noupdate -group ID /mips_tb/U_0/ID/MemtoReg
add wave -noupdate -group ID -radix hexadecimal /mips_tb/U_0/ID/Sign_extend
add wave -noupdate -group ID /mips_tb/U_0/ID/clock
add wave -noupdate -group ID /mips_tb/U_0/ID/reset
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/write_register_address
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/write_data_out
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/jump_adress
add wave -noupdate -group ID -radix hexadecimal /mips_tb/U_0/ID/Instruction_out
add wave -noupdate -group ID /mips_tb/U_0/ID/equal
add wave -noupdate -group ID -radix hexadecimal /mips_tb/U_0/ID/Add_Result
add wave -noupdate -group ID -radix hexadecimal /mips_tb/U_0/ID/PC_plus_4
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/write_data
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/read_register_1_address
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/read_register_2_address
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/write_register_address_1
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/write_register_address_0
add wave -noupdate -group ID -radix hexadecimal /mips_tb/U_0/ID/Instruction_immediate_value
add wave -noupdate -group ID -radix hexadecimal /mips_tb/U_0/ID/Branch_Add
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/read_data_1_sig
add wave -noupdate -group ID -radix decimal /mips_tb/U_0/ID/read_data_2_sig
add wave -noupdate -group ID -radix hexadecimal -childformat {{/mips_tb/U_0/ID/register_array(0) -radix decimal} {/mips_tb/U_0/ID/register_array(1) -radix decimal} {/mips_tb/U_0/ID/register_array(2) -radix decimal} {/mips_tb/U_0/ID/register_array(3) -radix decimal} {/mips_tb/U_0/ID/register_array(4) -radix decimal} {/mips_tb/U_0/ID/register_array(5) -radix decimal} {/mips_tb/U_0/ID/register_array(6) -radix decimal} {/mips_tb/U_0/ID/register_array(7) -radix decimal} {/mips_tb/U_0/ID/register_array(8) -radix decimal} {/mips_tb/U_0/ID/register_array(9) -radix decimal} {/mips_tb/U_0/ID/register_array(10) -radix decimal} {/mips_tb/U_0/ID/register_array(11) -radix decimal} {/mips_tb/U_0/ID/register_array(12) -radix decimal} {/mips_tb/U_0/ID/register_array(13) -radix decimal} {/mips_tb/U_0/ID/register_array(14) -radix decimal} {/mips_tb/U_0/ID/register_array(15) -radix decimal} {/mips_tb/U_0/ID/register_array(16) -radix decimal} {/mips_tb/U_0/ID/register_array(17) -radix decimal} {/mips_tb/U_0/ID/register_array(18) -radix decimal} {/mips_tb/U_0/ID/register_array(19) -radix decimal} {/mips_tb/U_0/ID/register_array(20) -radix decimal} {/mips_tb/U_0/ID/register_array(21) -radix decimal} {/mips_tb/U_0/ID/register_array(22) -radix decimal} {/mips_tb/U_0/ID/register_array(23) -radix decimal} {/mips_tb/U_0/ID/register_array(24) -radix decimal} {/mips_tb/U_0/ID/register_array(25) -radix decimal} {/mips_tb/U_0/ID/register_array(26) -radix decimal} {/mips_tb/U_0/ID/register_array(27) -radix decimal} {/mips_tb/U_0/ID/register_array(28) -radix decimal} {/mips_tb/U_0/ID/register_array(29) -radix decimal} {/mips_tb/U_0/ID/register_array(30) -radix decimal} {/mips_tb/U_0/ID/register_array(31) -radix decimal}} -expand -subitemconfig {/mips_tb/U_0/ID/register_array(0) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(1) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(2) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(3) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(4) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(5) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(6) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(7) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(8) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(9) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(10) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(11) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(12) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(13) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(14) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(15) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(16) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(17) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(18) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(19) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(20) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(21) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(22) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(23) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(24) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(25) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(26) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(27) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(28) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(29) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(30) {-height 15 -radix decimal} /mips_tb/U_0/ID/register_array(31) {-height 15 -radix decimal}} /mips_tb/U_0/ID/register_array
add wave -noupdate -group CTL /mips_tb/U_0/CTL/Opcode
add wave -noupdate -group CTL /mips_tb/U_0/CTL/jump
add wave -noupdate -group CTL /mips_tb/U_0/CTL/RegDst
add wave -noupdate -group CTL /mips_tb/U_0/CTL/ALUSrc
add wave -noupdate -group CTL /mips_tb/U_0/CTL/MemtoReg
add wave -noupdate -group CTL /mips_tb/U_0/CTL/RegWrite
add wave -noupdate -group CTL /mips_tb/U_0/CTL/MemRead
add wave -noupdate -group CTL /mips_tb/U_0/CTL/MemWrite
add wave -noupdate -group CTL /mips_tb/U_0/CTL/Branch
add wave -noupdate -group CTL /mips_tb/U_0/CTL/ALUop
add wave -noupdate -group CTL /mips_tb/U_0/CTL/clock
add wave -noupdate -group CTL /mips_tb/U_0/CTL/reset
add wave -noupdate -group CTL /mips_tb/U_0/CTL/R_format
add wave -noupdate -group CTL /mips_tb/U_0/CTL/Lw
add wave -noupdate -group CTL /mips_tb/U_0/CTL/Sw
add wave -noupdate -group CTL /mips_tb/U_0/CTL/Beq
add wave -noupdate -group CTL /mips_tb/U_0/CTL/addi
add wave -noupdate -group CTL /mips_tb/U_0/CTL/bne
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/Read_data_1
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/Read_data_2
add wave -noupdate -group EX -radix hexadecimal /mips_tb/U_0/EXE/Sign_extend
add wave -noupdate -group EX -radix hexadecimal /mips_tb/U_0/EXE/Function_opcode
add wave -noupdate -group EX /mips_tb/U_0/EXE/ALUOp
add wave -noupdate -group EX /mips_tb/U_0/EXE/ALUSrc
add wave -noupdate -group EX /mips_tb/U_0/EXE/Zero
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/ALU_Result
add wave -noupdate -group EX -radix hexadecimal /mips_tb/U_0/EXE/PC_plus_4
add wave -noupdate -group EX /mips_tb/U_0/EXE/clock
add wave -noupdate -group EX /mips_tb/U_0/EXE/reset
add wave -noupdate -group EX /mips_tb/U_0/EXE/RegDst
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/write_register_address
add wave -noupdate -group EX -radix hexadecimal /mips_tb/U_0/EXE/Instruction_20_11
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/Ainput
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/Binput
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/ALU_output_mux
add wave -noupdate -group EX /mips_tb/U_0/EXE/ALU_ctl
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/write_register_address_1
add wave -noupdate -group EX -radix decimal /mips_tb/U_0/EXE/write_register_address_0
add wave -noupdate -group MEM -radix decimal /mips_tb/U_0/MEM/read_data
add wave -noupdate -group MEM -radix hexadecimal /mips_tb/U_0/MEM/address
add wave -noupdate -group MEM -radix decimal /mips_tb/U_0/MEM/write_data
add wave -noupdate -group MEM /mips_tb/U_0/MEM/MemRead
add wave -noupdate -group MEM /mips_tb/U_0/MEM/Memwrite
add wave -noupdate -group MEM /mips_tb/U_0/MEM/clock
add wave -noupdate -group MEM /mips_tb/U_0/MEM/reset
add wave -noupdate -group MEM /mips_tb/U_0/MEM/write_clock
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/Regwrite_ID_EX
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/equal
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/write_register_address_EX
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/write_register_address_EX_MEM
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/RegWrite_EX_MEM
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/write_register_address_MEM_WB
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/RegWrite_MEM_WB
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/Reg_rs_IF_ID
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/Reg_rt_IF_ID
add wave -noupdate -group {FORWARD BEQ} -radix decimal /mips_tb/U_0/read_data_1_cor_ID
add wave -noupdate -group {FORWARD BEQ} -radix decimal /mips_tb/U_0/read_data_2_cor_ID
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/forwardA_to_ID
add wave -noupdate -group {FORWARD BEQ} /mips_tb/U_0/forwardB_to_ID
add wave -noupdate -group MIPS /mips_tb/U_0/reset
add wave -noupdate -group MIPS /mips_tb/U_0/clock
add wave -noupdate -group MIPS /mips_tb/U_0/PC
add wave -noupdate -group MIPS /mips_tb/U_0/ALU_result_out
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_1_out
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_2_out
add wave -noupdate -group MIPS /mips_tb/U_0/write_data_out
add wave -noupdate -group MIPS /mips_tb/U_0/Instruction_out
add wave -noupdate -group MIPS /mips_tb/U_0/Branch_out
add wave -noupdate -group MIPS /mips_tb/U_0/Zero_out
add wave -noupdate -group MIPS /mips_tb/U_0/Memwrite_out
add wave -noupdate -group MIPS /mips_tb/U_0/Regwrite_out
add wave -noupdate -group MIPS /mips_tb/U_0/PC_plus_4_Fetch
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_1_ID
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_2_ID
add wave -noupdate -group MIPS /mips_tb/U_0/Sign_Extend_ID
add wave -noupdate -group MIPS /mips_tb/U_0/Add_result
add wave -noupdate -group MIPS /mips_tb/U_0/ALU_result
add wave -noupdate -group MIPS /mips_tb/U_0/read_data
add wave -noupdate -group MIPS /mips_tb/U_0/ALUSrc_ID
add wave -noupdate -group MIPS /mips_tb/U_0/Branch
add wave -noupdate -group MIPS /mips_tb/U_0/RegDst_CTL
add wave -noupdate -group MIPS /mips_tb/U_0/Regwrite
add wave -noupdate -group MIPS /mips_tb/U_0/Zero
add wave -noupdate -group MIPS /mips_tb/U_0/MemWrite_CTL
add wave -noupdate -group MIPS /mips_tb/U_0/MemtoReg_CTL
add wave -noupdate -group MIPS /mips_tb/U_0/MemRead_CTL
add wave -noupdate -group MIPS /mips_tb/U_0/ALUop_ID
add wave -noupdate -group MIPS /mips_tb/U_0/Instruction_Fetch
add wave -noupdate -group MIPS -itemcolor Cyan /mips_tb/U_0/IF_Dwrite
add wave -noupdate -group MIPS -itemcolor Cyan /mips_tb/U_0/stall
add wave -noupdate -group MIPS -itemcolor Red -radix decimal /mips_tb/U_0/STCNT
add wave -noupdate -group MIPS -itemcolor Red -radix decimal /mips_tb/U_0/FHCNT
add wave -noupdate -group MIPS -itemcolor Red /mips_tb/U_0/STtrigger
add wave -noupdate -group MIPS -itemcolor Red -radix decimal /mips_tb/U_0/CLCKCNT
add wave -noupdate -group MIPS -itemcolor Red /mips_tb/U_0/BPADD
add wave -noupdate -group MIPS /mips_tb/U_0/jump
add wave -noupdate -group MIPS /mips_tb/U_0/Instruction_IF_ID
add wave -noupdate -group MIPS /mips_tb/U_0/PC_plus_4_IF_ID
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_1_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_2_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/Sign_Extend_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/ALUSrc_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/ALUop_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/Regwrite_CTL
add wave -noupdate -group MIPS /mips_tb/U_0/Regwrite_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/equal
add wave -noupdate -group MIPS /mips_tb/U_0/Instruction_ID
add wave -noupdate -group MIPS /mips_tb/U_0/Instruction_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/RegDst_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/MemRead_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/MemWrite_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/write_register_address_EX
add wave -noupdate -group MIPS /mips_tb/U_0/write_register_address_EX_MEM
add wave -noupdate -group MIPS /mips_tb/U_0/ALU_result_EX_MEM
add wave -noupdate -group MIPS /mips_tb/U_0/RegWrite_EX_MEM
add wave -noupdate -group MIPS /mips_tb/U_0/MemRead_EX_MEM
add wave -noupdate -group MIPS /mips_tb/U_0/MemWrite_EX_MEM
add wave -noupdate -group MIPS /mips_tb/U_0/write_register_address_MEM_WB
add wave -noupdate -group MIPS /mips_tb/U_0/ALU_result_MEM_WB
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_MEM_WB
add wave -noupdate -group MIPS /mips_tb/U_0/RegWrite_MEM_WB
add wave -noupdate -group MIPS /mips_tb/U_0/MEMtoreg_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/MEMtoreg_EX_MEM
add wave -noupdate -group MIPS /mips_tb/U_0/MEMtoreg_MEM_WB
add wave -noupdate -group MIPS /mips_tb/U_0/jump_adress
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_2_EX_MEM
add wave -noupdate -group MIPS /mips_tb/U_0/Reg_rs_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/Reg_rt_ID_EX
add wave -noupdate -group MIPS /mips_tb/U_0/write_data_final_mux
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_1
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_2
add wave -noupdate -group MIPS /mips_tb/U_0/forwardA
add wave -noupdate -group MIPS /mips_tb/U_0/forwardB
add wave -noupdate -group MIPS /mips_tb/U_0/Reg_rs_IF_ID
add wave -noupdate -group MIPS /mips_tb/U_0/Reg_rt_IF_ID
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_1_cor_ID
add wave -noupdate -group MIPS /mips_tb/U_0/read_data_2_cor_ID
add wave -noupdate -group MIPS /mips_tb/U_0/NOT_USED
add wave -noupdate -group MIPS /mips_tb/U_0/forwardA_to_ID
add wave -noupdate -group MIPS /mips_tb/U_0/forwardB_to_ID
add wave -noupdate -group MIPS /mips_tb/U_0/Quartus
add wave -noupdate -group MIPS -radix hexadecimal /mips_tb/U_0/PC_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28052260 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 290
configure wave -valuecolwidth 98
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {27279411 ps} {28314760 ps}
