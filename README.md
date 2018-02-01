# Arm-Processor
### Credit to: L.Wang, Dinggao Pan
This is a 64-bit Arm CPU with pipelining developed in Verilog. 
The instruction set of the CPU is listed below:
  - ADDI Rd, Rn, Imm12: Reg[Rd] = Reg[Rn] + ZeroExtend(Imm12).

  - ADDS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] + Reg[Rm]. Set flags.

  - B Imm26: PC = PC + SignExtend(Imm26 << 2).

  - B.LT Imm19: If (flags.negative != flags.overflow) PC = PC + SignExtend(Imm19<<2).

  - BL Imm26: X30 = PC + 4 (instruction after this one), PC = PC + SignExtend(Imm26<<2).

  - BR Rd: PC = Reg[Rd].

  - CBZ Rt, Imm19: If (Reg[Rt] == 0) PC = PC + SignExtend(Imm19<<2).

  - LDUR Rt, [Rn, #Imm9]: Reg[Rt] = Mem[Reg[Rn] + SignExtend(Imm9)].

  - STUR Rt, [Rn, #Imm9]: Mem[Reg[Rn] + SignExtend(Imm9)] = Reg[Rt].

  - SUBS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] - Reg[Rm]. Set flags.
