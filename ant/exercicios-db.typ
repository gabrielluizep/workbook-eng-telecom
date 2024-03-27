+ Em um sistema de comunicação sem fio a razão sinal-ruído (SNR) mínima necessária para recepção do sinal é de 5 dB. No receptor, a potência de ruído térmico é de –125 dBm. Além disso, o receptor possui uma antena com ganho de 3 dBi e uma perda de cabos e conectores de 2 dB. O transmissor possui uma potência de alimentação de 25 mW, uma antena com 12 dBi de ganho e perdas nos cabos e conectores de 3dB. Considerando que a frequência de operação desse sistema é de 915 MHz, qual a máxima atenuação do enlace.

Transformar mW em dBm


$
P_"dBm" = 10 log_10 (P_"mW" / (1 "mW"))
$

Portanto

$
P_"dBm" = 10 log_10 (25 / (1)) = 13 "dBm"
$

$
13 "dBm" --> #rect()[12 dBi] --> #rect()[-3 dB] --> #rect()[Atenuação Meio] --> #rect()[3 dBi] --> #rect()[-2 dB] --> P_"out"
$


$
P_"signal dBm" = 13 + 12 - 3 + 3 - 2 = 23 "dBm"
$

$
"Ruído" &= -125 "dBm" \
P_"SNR" &= P_"signal dBm"  - P_"noise dBm"\
&= (23 - "Atenuação") - (-125) = 5 "dB" \
&= "Atenuação" = 23 - 5 + 125 = 143 "dB"
$

+ Considere uma situação em que um assinante de serviço de comunicação móvel encontra-se a 10 km da ERB. Faça uma análise dos enlaces de descida e de subida considerando os seguintes parâmetros: potências EIRP: 37 dBm na ERB; 27 dBm no TM; despreze demais ganhos e perdas no transmissor e no receptor; a potência do ruído térmico vale $P_n=-120 "dBm"$; perda de percurso pode ser modelada como $L(d)=120+30log(d)$, sendo d a distância ERB-TM em [km]; a razão sinal ruído mínima para estabelecer o enlace é 5 dB. Analise o equilíbrio de desempenho entre os enlaces de subida e de descida.

37-150 = -113 dBm -> SNR = -113 - (-120) = 7 dB (Ok)

27-150 = -123 dBm -> SNR = -123 - (-120) = 3 dB (Não ok)

+ Em um link permanente de um cabeamento horizontal o valor do sinal na entrada é de 5 dBm e na saída é de –4,0 dBm. Considerando que o cabeamento apresenta 90 m, qual a atenuação por metro do cabo? (Despreze a atenuação dos conectores e das tomadas).

(5-(-4)) / 90 = 0.1 dB/m

+ 