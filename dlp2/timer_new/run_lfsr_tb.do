# Iniciando a simulacao
vsim work.timer

# Adicionando os sinais de clock e reset
add wave -position insertpoint  \
sim:/timer/clk \
sim:/timer/reset

# Adicionando os sinais com "radix" unsigned
add wave -position insertpoint -radix unsigned \
sim:/timer/sec \
sim:/timer/r_reg \
sim:/timer/LFSR_reg

# Criando clock para detectar o valor do LFSR_reg depois de 50M contagens
force -freeze sim:/timer/clk 1 0, 0 {50 ps} -r 100ps 

#Force reset
force -freeze sim:/timer/reset 1 0 
run 40ns
force -freeze sim:/timer/reset 0 0 
run 40ns

# 100ps * 50.000.000 = 5000us
run 5001us
