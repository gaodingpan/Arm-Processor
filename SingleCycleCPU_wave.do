onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /singleCycleCPU_testbench/clk
add wave -noupdate /singleCycleCPU_testbench/rst
add wave -noupdate /singleCycleCPU_testbench/instructionCounter
add wave -noupdate -expand -group Instruction -expand -group muxImm /singleCycleCPU_testbench/dut/myPC/Brancher
add wave -noupdate -expand -group Instruction -expand -group muxImm -radix decimal /singleCycleCPU_testbench/dut/myPC/SEImm19
add wave -noupdate -expand -group Instruction -expand -group muxImm -radix decimal /singleCycleCPU_testbench/dut/myPC/SEImm26
add wave -noupdate -expand -group Instruction -radix unsigned /singleCycleCPU_testbench/dut/instructionAddr
add wave -noupdate -expand -group Instruction -radix decimal -childformat {{{/singleCycleCPU_testbench/dut/myPC/branchTo[63]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[62]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[61]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[60]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[59]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[58]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[57]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[56]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[55]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[54]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[53]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[52]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[51]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[50]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[49]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[48]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[47]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[46]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[45]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[44]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[43]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[42]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[41]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[40]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[39]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[38]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[37]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[36]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[35]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[34]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[33]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[32]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[31]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[30]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[29]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[28]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[27]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[26]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[25]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[24]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[23]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[22]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[21]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[20]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[19]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[18]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[17]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[16]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[15]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[14]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[13]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[12]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[11]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[10]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[9]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[8]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[7]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[6]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[5]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[4]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[3]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[2]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[1]} -radix decimal} {{/singleCycleCPU_testbench/dut/myPC/branchTo[0]} -radix decimal}} -subitemconfig {{/singleCycleCPU_testbench/dut/myPC/branchTo[63]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[62]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[61]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[60]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[59]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[58]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[57]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[56]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[55]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[54]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[53]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[52]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[51]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[50]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[49]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[48]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[47]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[46]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[45]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[44]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[43]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[42]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[41]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[40]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[39]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[38]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[37]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[36]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[35]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[34]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[33]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[32]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[31]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[30]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[29]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[28]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[27]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[26]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[25]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[24]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[23]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[22]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[21]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[20]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[19]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[18]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[17]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[16]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[15]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[14]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[13]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[12]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[11]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[10]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[9]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[8]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[7]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[6]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[5]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[4]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[3]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[2]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[1]} {-height 15 -radix decimal} {/singleCycleCPU_testbench/dut/myPC/branchTo[0]} {-height 15 -radix decimal}} /singleCycleCPU_testbench/dut/myPC/branchTo
add wave -noupdate -expand -group Instruction -radix decimal /singleCycleCPU_testbench/dut/myPC/addr
add wave -noupdate -expand -group Instruction /singleCycleCPU_testbench/dut/instruction
add wave -noupdate -expand -group Instruction /singleCycleCPU_testbench/dut/LTCtl
add wave -noupdate -expand -group Instruction /singleCycleCPU_testbench/dut/myPC/cond
add wave -noupdate -expand -group Instruction /singleCycleCPU_testbench/dut/myPC/takeB
add wave -noupdate -expand -group DataMem /singleCycleCPU_testbench/dut/myDMem/address
add wave -noupdate -expand -group DataMem /singleCycleCPU_testbench/dut/myDMem/aligned_address
add wave -noupdate -expand -group DataMem -expand -group MemData -radix decimal {/singleCycleCPU_testbench/dut/myDMem/mem[16]}
add wave -noupdate -expand -group DataMem -expand -group MemData -radix decimal {/singleCycleCPU_testbench/dut/myDMem/mem[8]}
add wave -noupdate -expand -group DataMem -expand -group MemData -radix decimal {/singleCycleCPU_testbench/dut/myDMem/mem[0]}
add wave -noupdate -expand -group DataMem /singleCycleCPU_testbench/dut/myDMem/read_data
add wave -noupdate -expand -group DataMem /singleCycleCPU_testbench/dut/myDMem/read_enable
add wave -noupdate -expand -group DataMem /singleCycleCPU_testbench/dut/myDMem/write_data
add wave -noupdate -expand -group DataMem /singleCycleCPU_testbench/dut/myDMem/write_enable
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/aluCtl
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/data1
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/operandB
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/aluResult
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/negative
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/NTemp
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/zero
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/ZTemp
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/overflow
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/OTemp
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/carry_out
add wave -noupdate -expand -group ALU /singleCycleCPU_testbench/dut/CTemp
add wave -noupdate -expand -group RegFile /singleCycleCPU_testbench/dut/RegWrite
add wave -noupdate -expand -group RegFile /singleCycleCPU_testbench/dut/data1
add wave -noupdate -expand -group RegFile /singleCycleCPU_testbench/dut/data2
add wave -noupdate -expand -group RegFile /singleCycleCPU_testbench/dut/dataWrite
add wave -noupdate -expand -group RegFile /singleCycleCPU_testbench/dut/Addr2
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[31]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[9]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[8]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[7]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[6]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[5]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[4]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[3]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[2]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[1]}
add wave -noupdate -expand -group RegFile -expand -group Data -radix decimal {/singleCycleCPU_testbench/dut/myReg/data[0]}
add wave -noupdate -group Control /singleCycleCPU_testbench/dut/ADDI
add wave -noupdate -group Control /singleCycleCPU_testbench/dut/BL
add wave -noupdate -group Control /singleCycleCPU_testbench/dut/BR
add wave -noupdate -group Control /singleCycleCPU_testbench/dut/LDUR
add wave -noupdate -group Control /singleCycleCPU_testbench/dut/cond
add wave -noupdate -group Control /singleCycleCPU_testbench/dut/takeB
add wave -noupdate -group Control /singleCycleCPU_testbench/dut/LTCtl
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1481519 ps} 0}
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
WaveRestoreZoom {770059 ps} {1591050 ps}
