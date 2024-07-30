# do fsm_run_msim_rtl_vhdl.do
# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
# vlib rtl_work
# vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 2020.1 Lib Mapping Utility 2020.02 Feb 28 2020
# vmap work rtl_work 
# Modifying /opt/altera/intelFPGA/20.1/modelsim_ae/linuxaloem/../modelsim.ini
# 
# vcom -93 -work work {/home/aluno/workbook-eng-telecom/dlp2/fsm/fsm.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 2020.1 Compiler 2020.02 Feb 28 2020
# Start time: 11:05:02 on Jul 30,2024
# vcom -reportprogress 300 -93 -work work /home/aluno/workbook-eng-telecom/dlp2/fsm/fsm.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Compiling entity fsm
# -- Compiling architecture fsm_arch of fsm
# End time: 11:05:02 on Jul 30,2024, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
# 
# stdin: <EOF>
vsim work.fsm
# vsim work.fsm 
# Start time: 11:05:05 on Jul 30,2024
# //  ModelSim - Intel FPGA Edition 2020.1 Feb 28 2020 Linux 6.1.0-23-amd64
# //
# //  Copyright 1991-2020 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  ModelSim - Intel FPGA Edition and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.fsm(fsm_arch)
add wave -position insertpoint  \
sim:/fsm/reset
add wave -position insertpoint  \
sim:/fsm/reset \
sim:/fsm/clk \
sim:/fsm/enter \
sim:/fsm/operacao \
sim:/fsm/enable_1 \
sim:/fsm/selecao \
sim:/fsm/enable_2 \
sim:/fsm/current_state \
sim:/fsm/next_state
force -freeze sim:/fsm/reset 1 0
run 10
force -freeze sim:/fsm/reset 0 0
force -freeze sim:/fsm/clk 1 0, 0 {50 ps} -r 100
run 50
force -freeze sim:/fsm/enter 10 100
# ** UI-Msg: (vsim-4026) Value "10" does not represent a literal of the enumeration type.
# ** UI-Msg: (vsim-4011) Invalid force value: 10 100.
# 
force -freeze sim:/fsm/enter 10 
# ** UI-Msg: (vsim-4026) Value "10" does not represent a literal of the enumeration type.
# ** UI-Msg: (vsim-4011) Invalid force value: 10.
# 
force -freeze sim:/fsm/enter 1 100
force -freeze sim:/fsm/enter 0 120
run 100
run 20
run 500
force -freeze sim:/fsm/operacao 00 120
run 500
force -freeze sim:/fsm/enter 1 100
force -freeze sim:/fsm/operacao 00 120
run 500
force -freeze sim:/fsm/reset 1 10
run 100
force -freeze sim:/fsm/reset 0 10
run 100
run 100
run 100
run 100
run 100
run 100
run 100
run 100
run 1000
force -freeze sim:/fsm/enter 0 100
run 1000
force -freeze sim:/fsm/reset 1 10
force -freeze sim:/fsm/enter 0 100
run 1000
force -freeze sim:/fsm/enter 0 100
force -freeze sim:/fsm/reset 0 10
run 1000
force -freeze sim:/fsm/enter 1 100
run 100
force -freeze sim:/fsm/enter 0 100
run 100
run 1000


