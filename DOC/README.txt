This is a MIPS pipline Forwarding competant CPU design, which operates as a fully functional MIPS processor.
 being fed a memory component with data and a MIPS Assembly program, and syncs fetching the program, decoding, executing and reading/ writing to memory if needed.
 
the design consists of 7 blocks:

Instruction FETCH block:
The fetch instruction block is responsible for the fetch instruction phase of each operation. It performs it and passes on the relevant signals to the next stage of the pipeline, 
the Decode stage through the IF/ID registers


Instruction Decode Block:
The Instruction Decode block is responsible for the decode phase of each operation. 
performs it and passes on the relevant signals to the next stage of the pipeline,
 the execute stage through the ID/EX registers

Execute Block:
The Execute block is responsible for the execute phase of each operation. 
It performs it and passes on the relevant signals to the next stage of the pipeline, 
the memory stage, through the EX/MEM registers

Memory Stage Block:
The DMem Unit is responsible for the memory access (read/write) phase of each operation. 
performs the read/write and passes on the relevant signals to the next stage of the pipeline, the write back stage,
which, in our design, happens back in the Instruction Decode block.

Control Unit:
The Execute block is responsible for the execute phase of each operation. It performs it and passes on the relevant 
signals to the next stage of the pipeline, the memory stage, through the EX/MEM registers
some of the data is forwarded and some is stalled by "buffer" registers for later use

to use: \
1. write a MIPS assembly code, validate and test it
2. compile it and dump memory and instruction to .hex
3. reassign the path of the memory and code in "fetch" and "DMEM"
4. enjoy! 