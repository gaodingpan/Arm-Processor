# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./Codes/adder_64.sv"
vlog "./Codes/datamem.sv"
vlog "./Codes/alu.sv"
vlog "./Codes/fulladder.sv"
vlog "./Codes/instructmem.sv"
vlog "./Codes/math.sv"
vlog "./Codes/pipeLinedCPU.sv"
vlog "./Codes/control.sv"
vlog "./Codes/programCounter.sv"
vlog "./Codes/regfile.sv"
vlog "./Codes/singleReg.sv"
vlog "./Codes/fiveTo32Dec.sv"
vlog "./Codes/two2FourDec.sv"
vlog "./Codes/three2EightDec.sv"
vlog "./Codes/mux32_1.sv"
vlog "./Codes/mux8_1.sv"
vlog "./Codes/mux4_1.sv"
vlog "./Codes/mux2_1.sv"
vlog "./Codes/DFF.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work pipeLinedCPU_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do pipeLinedCPU_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
