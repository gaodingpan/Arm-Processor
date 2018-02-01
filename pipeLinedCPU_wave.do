onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipeLinedCPU_testbench/dut/clk
add wave -noupdate /pipeLinedCPU_testbench/dut/rst
add wave -noupdate /pipeLinedCPU_testbench/dut/startF
add wave -noupdate -radix decimal /pipeLinedCPU_testbench/instructionCounter
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/ifCBZ1
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/ifCBZ2
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/ifB
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/myPC/Blt
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/blt
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/myCtl/LTCtl
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/myPC/B
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/myPC/Br
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/br
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/CBZ
add wave -noupdate -expand -group CBZ /pipeLinedCPU_testbench/dut/rtRZero
add wave -noupdate -expand -group ltc /pipeLinedCPU_testbench/dut/negative
add wave -noupdate -expand -group ltc /pipeLinedCPU_testbench/dut/zero
add wave -noupdate -expand -group ltc /pipeLinedCPU_testbench/dut/overflow
add wave -noupdate -expand -group ltc /pipeLinedCPU_testbench/dut/carry_out
add wave -noupdate -group Instructions /pipeLinedCPU_testbench/dut/myIMem/instruction
add wave -noupdate -group Instructions /pipeLinedCPU_testbench/dut/myCtl/DecInst
add wave -noupdate -group Instructions /pipeLinedCPU_testbench/dut/myCtl/ALUInst
add wave -noupdate -group Instructions /pipeLinedCPU_testbench/dut/myCtl/DMemInst
add wave -noupdate -group Instructions /pipeLinedCPU_testbench/dut/myCtl/RegWrtInst
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/instruction
add wave -noupdate -expand -group {Program Counter} -radix decimal /pipeLinedCPU_testbench/dut/myIMem/address
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/BR
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/takeB
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/cond
add wave -noupdate -expand -group {Program Counter} -radix decimal /pipeLinedCPU_testbench/dut/instructionAddrtemp
add wave -noupdate -expand -group {Program Counter} -radix decimal /pipeLinedCPU_testbench/dut/myPC/instructionAddr
add wave -noupdate -expand -group {Program Counter} -radix decimal /pipeLinedCPU_testbench/dut/myPC/PCadd4
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/Brancher
add wave -noupdate -expand -group {Program Counter} -radix decimal /pipeLinedCPU_testbench/dut/myPC/branchTo
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/branchTotemp
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/nextProgram
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/SEImm19
add wave -noupdate -expand -group {Program Counter} /pipeLinedCPU_testbench/dut/myPC/SEImm26
add wave -noupdate -expand -group {Program Counter} -radix decimal /pipeLinedCPU_testbench/dut/myPC/addr
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/myReg/RegWrite
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/myReg/ReadRegister1
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/myReg/ReadRegister2
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/myReg/WriteRegister
add wave -noupdate -expand -group Register -radix decimal /pipeLinedCPU_testbench/dut/myReg/WriteData
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/myReg/ReadData1
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/myReg/ReadData2
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/myReg/regCtl
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[31]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[30]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[29]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[18]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[17]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[16]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[15]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[14]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[13]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[12]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[11]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[10]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[9]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[8]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[7]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[6]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[5]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[4]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[3]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[2]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[1]}
add wave -noupdate -expand -group Register -radix decimal {/pipeLinedCPU_testbench/dut/myReg/data[0]}
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/regOrMem
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/memDataRead
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/aluResult1
add wave -noupdate -expand -group Register /pipeLinedCPU_testbench/dut/RegOutA
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/ZEImm12
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/SEImm9
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/ALUInA
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/ALUInB
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/RegOutB
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/ifADDI
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/operandB
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/BOperant
add wave -noupdate -expand -group ALU -radix decimal /pipeLinedCPU_testbench/dut/myAlu/result
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/negative
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/zero
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/overflow
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/carry_out
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/carries
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/cntrl
add wave -noupdate -expand -group ALU /pipeLinedCPU_testbench/dut/myAlu/addOrSubs
add wave -noupdate -group DataMem /pipeLinedCPU_testbench/dut/myDMem/address
add wave -noupdate -group DataMem /pipeLinedCPU_testbench/dut/myDMem/write_enable
add wave -noupdate -group DataMem /pipeLinedCPU_testbench/dut/myDMem/read_enable
add wave -noupdate -group DataMem /pipeLinedCPU_testbench/dut/myDMem/write_data
add wave -noupdate -group DataMem /pipeLinedCPU_testbench/dut/myDMem/read_data
add wave -noupdate -group DataMem {/pipeLinedCPU_testbench/dut/myDMem/mem[24]}
add wave -noupdate -group DataMem {/pipeLinedCPU_testbench/dut/myDMem/mem[16]}
add wave -noupdate -group DataMem {/pipeLinedCPU_testbench/dut/myDMem/mem[8]}
add wave -noupdate -group DataMem {/pipeLinedCPU_testbench/dut/myDMem/mem[0]}
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/NTemp
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/negative
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/ZTemp
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/zero
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/OTemp
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/overflow
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/CTemp
add wave -noupdate -expand -group Controls -group Flags /pipeLinedCPU_testbench/dut/myCtl/carry_out
add wave -noupdate -expand -group Controls -group IFetch /pipeLinedCPU_testbench/dut/myCtl/BR
add wave -noupdate -expand -group Controls -group IFetch /pipeLinedCPU_testbench/dut/myCtl/takeB
add wave -noupdate -expand -group Controls -group IFetch /pipeLinedCPU_testbench/dut/myCtl/cond
add wave -noupdate -expand -group Controls -group Decode /pipeLinedCPU_testbench/dut/myCtl/ADDI
add wave -noupdate -expand -group Controls -group Decode /pipeLinedCPU_testbench/dut/myCtl/LDUR
add wave -noupdate -expand -group Controls -group Decode /pipeLinedCPU_testbench/dut/myCtl/RdorRm
add wave -noupdate -expand -group Controls /pipeLinedCPU_testbench/dut/myCtl/aluCtl
add wave -noupdate -expand -group Controls -group MemCtl /pipeLinedCPU_testbench/dut/myCtl/memWrite
add wave -noupdate -expand -group Controls -group MemCtl /pipeLinedCPU_testbench/dut/myCtl/memRead
add wave -noupdate -expand -group Controls -group WriteBack /pipeLinedCPU_testbench/dut/myCtl/BL
add wave -noupdate -expand -group Controls -group WriteBack /pipeLinedCPU_testbench/dut/myCtl/RegWrite
add wave -noupdate -expand -group Controls -group WriteBack /pipeLinedCPU_testbench/dut/myCtl/ALUOrMem
add wave -noupdate -expand -group Controls -expand -group forwarding -radix decimal /pipeLinedCPU_testbench/dut/dataWrite
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/Addr2
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/ifRm
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/RegA
add wave -noupdate -expand -group Controls -expand -group forwarding -radix decimal /pipeLinedCPU_testbench/dut/RegB
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/aluRn
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/aluRm
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/memRn
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/memRm
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/aluFRn
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/aluFRm
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/memFRn
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/memFRm
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/firstSelA
add wave -noupdate -expand -group Controls -expand -group forwarding /pipeLinedCPU_testbench/dut/firstSelB
add wave -noupdate /pipeLinedCPU_testbench/dut/blX30
add wave -noupdate /pipeLinedCPU_testbench/dut/blAlu
add wave -noupdate -expand -group ifX31 /pipeLinedCPU_testbench/dut/aluRd
add wave -noupdate -expand -group ifX31 /pipeLinedCPU_testbench/dut/memRd
add wave -noupdate -expand -group ifX31 /pipeLinedCPU_testbench/dut/alurd
add wave -noupdate -expand -group ifX31 /pipeLinedCPU_testbench/dut/memrd
add wave -noupdate /pipeLinedCPU_testbench/dut/RegAF
add wave -noupdate /pipeLinedCPU_testbench/dut/aluFA
add wave -noupdate /pipeLinedCPU_testbench/dut/aluFB
add wave -noupdate /pipeLinedCPU_testbench/dut/RegBF
add wave -noupdate /pipeLinedCPU_testbench/dut/memFA
add wave -noupdate /pipeLinedCPU_testbench/dut/memFB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {87040 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 313
configure wave -valuecolwidth 400
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
WaveRestoreZoom {35139 ps} {141217 ps}
