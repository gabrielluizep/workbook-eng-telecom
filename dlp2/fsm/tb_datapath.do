# Compilando arquivos e abrindo simulação
vlib rtl_work

vmap work rtl_work

vcom -93 -work work {/home/aluno/workbook-eng-telecom/dlp2/fsm/bin2bcd.vhd}
vcom -reportprogress 300 -93 -work work /home/aluno/workbook-eng-telecom/dlp2/fsm/bin2bcd.vhd 

vcom -93 -work work {/home/aluno/workbook-eng-telecom/dlp2/fsm/bcd2ssd.vhd}
vcom -reportprogress 300 -93 -work work /home/aluno/workbook-eng-telecom/dlp2/fsm/bcd2ssd.vhd 

vcom -93 -work work {/home/aluno/workbook-eng-telecom/dlp2/fsm/datapath.vhd}
vcom -reportprogress 300 -93 -work work /home/aluno/workbook-eng-telecom/dlp2/fsm/datapath.vhd 

vcom -93 -work work {/home/aluno/workbook-eng-telecom/dlp2/fsm/registrador.vhd}
vcom -reportprogress 300 -93 -work work /home/aluno/workbook-eng-telecom/dlp2/fsm/registrador.vhd 

vsim work.datapath

# Configurando visualização dos sinais
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider In
add wave -noupdate /datapath/clk
add wave -noupdate /datapath/reset
add wave -noupdate /datapath/enter
add wave -noupdate /datapath/enable_1
add wave -noupdate /datapath/enable_2
add wave -noupdate /datapath/selecao
add wave -noupdate /datapath/operandos
add wave -noupdate -divider Out
add wave -noupdate /datapath/bin
add wave -noupdate /datapath/res
add wave -noupdate /datapath/res_bcd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 99
configure wave -valuecolwidth 114
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {231 ps}

# Definindo defaults
force -freeze sim:/datapath/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/datapath/reset 1 0, 0 200
force -freeze sim:/datapath/operandos 00000000 0
force -freeze sim:/datapath/enter 0 0
force -freeze sim:/datapath/enable_1 0 0
force -freeze sim:/datapath/enable_2 0 0
force -freeze sim:/datapath/selecao 00 0
run 300

# Testando a + 1
force -freeze sim:/datapath/selecao         10   0
force -freeze sim:/datapath/enter            1   0
force -freeze sim:/datapath/enable_1         1   0
force -freeze sim:/datapath/operandos 00000001   0

force -freeze sim:/datapath/enter            0 200
force -freeze sim:/datapath/enable_1         0 200
force -freeze sim:/datapath/enable_2         1 200

force -freeze sim:/datapath/enable_2         0 400

run 10000

# Testando a - 1
force -freeze sim:/datapath/selecao         11   0
force -freeze sim:/datapath/enter            1   0
force -freeze sim:/datapath/enable_1         1   0
force -freeze sim:/datapath/operandos 11111111   0

force -freeze sim:/datapath/enter            0 200
force -freeze sim:/datapath/enable_1         0 200
force -freeze sim:/datapath/enable_2         1 200

force -freeze sim:/datapath/enable_2         0 400 

run 10000

# Testando a + b
force -freeze sim:/datapath/selecao         00   0
force -freeze sim:/datapath/enter            1   0
force -freeze sim:/datapath/enable_1         1   0
force -freeze sim:/datapath/operandos 11110000   0

force -freeze sim:/datapath/enter            0 200
force -freeze sim:/datapath/enable_1         0 200
force -freeze sim:/datapath/operandos 00001111 200

force -freeze sim:/datapath/enter            1 400 
force -freeze sim:/datapath/enable_2         1 400

force -freeze sim:/datapath/enter            0 600 
force -freeze sim:/datapath/enable_2         0 600

run 10000

# Testando a - b
force -freeze sim:/datapath/selecao         01   0
force -freeze sim:/datapath/enter            1   0
force -freeze sim:/datapath/enable_1         1   0
force -freeze sim:/datapath/operandos 11111111   0

force -freeze sim:/datapath/enter            0 200
force -freeze sim:/datapath/enable_1         0 200
force -freeze sim:/datapath/operandos 00001111 200

force -freeze sim:/datapath/enter            1 400 
force -freeze sim:/datapath/enable_2         1 400

force -freeze sim:/datapath/enter            0 600 
force -freeze sim:/datapath/enable_2         0 600

run 10000