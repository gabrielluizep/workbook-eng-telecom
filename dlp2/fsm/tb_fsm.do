vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/aluno/workbook-eng-telecom/dlp2/fsm/fsm.vhd}

vsim work.fsm

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

force -freeze sim:/fsm/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/fsm/operacao 00 0
force -freeze sim:/fsm/reset 1 0, 0 500
force -freeze sim:/fsm/enter 0 0
run 1000
force -freeze sim:/fsm/enter 1 0
run 500
force -freeze sim:/fsm/enter 0 0
run 500
force -freeze sim:/fsm/enter 1 0 
run 500
force -freeze sim:/fsm/enter 0 0 
run 500

force -freeze sim:/fsm/operacao 1 0
force -freeze sim:/fsm/reset 1 0, 0 500
force -freeze sim:/fsm/enter 0 0
run 1000
force -freeze sim:/fsm/enter 1 0
run 500
force -freeze sim:/fsm/enter 0 0
run 1500