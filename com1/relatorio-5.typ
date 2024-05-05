#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Conversão AD",
  subtitle: "Sistemas de Comunicações I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "1 de Maior de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")

= Introdução

Este relatório apresenta os resultados e análises obtidos durante a atividade de
simulação de um processo de conversão Analógico-Digital (AD), transmissão e
recepção binária de um sinal. A atividade foi realizada com o objetivo de
compreender e aplicar os conceitos fundamentais de amostragem, quantização,
codificação, ruído Aditivo Branco Gaussiano (AWGN), transmissão e recepção
binária.

#pagebreak()

= Fundamentação teórica

Para podermos desenvolver a atividade proposta de transmissão e recepção binária
precisamos entender os conceitos como a amostragem, quantização, codificação e
ruído _AWGN_ e transmissão e recepção binária.

A amostragem é o processo de capturar o valor de um sinal em instantes de tempo
discretos. A amostragem é realizada com uma frequência de amostragem suficiente
para que o sinal original possa ser recuperado. A frequência de amostragem é
dada por

$
  f_s = 1/T_s
$

onde $T_s$ é o período de amostragem. Deve-se respeitar o teorema de Nyquist
para evitar a perda de informação. O teorema de Nyquist afirma que a frequência
de amostragem deve ser pelo menos duas vezes a frequência máxima do sinal
amostrado.

$
  f_s > 2f_(max)
$

A quantização é o processo de discretização dos valores de amplitude do sinal,
ou seja, podemos pensar a quantização como um processo de arredondamento dos
valores de amplitude do sinal.

Com o sinal já amostrado e quantizado, é necessário codificar o sinal para que
ele possa ser transmitido. A codificação é o processo de mapear os valores de
amplitude do sinal em símbolos que podem ser transmitidos. Podemos escolher
diferentes tipos de codificação, como a _NRZ (Non Return to Zero)_, _RZ (Return to Zero)_, _Manchester_,
entre outras. Cada tipo de codificação possui suas vantagens e desvantagens e é
escolhido de acordo com a aplicação.

O ruído _AWGN_ é um modelo de ruído que é comumente utilizado para simular o
ruído em sistemas de comunicações, ele representa um ruído branco com uma
distribuição gaussiana gerado pelas características térmicas dos componentes
eletrônicos. O ruído _AWGN_ é aditivo, ou seja, ele é somado ao sinal
transmitido.

A transmissão e recepção binária é o processo de transmitir e receber um sinal
binário. O sinal binário é composto por dois símbolos, 0 e 1. O sinal binário é
transmitido e recebido por um canal de comunicação que pode introduzir ruído no
sinal. O objetivo da transmissão e recepção binária é recuperar o sinal original
transmitido.

#pagebreak()

= Análise dos resultados

Inicialmente foi gerado um sinal senoidal com frequência de 44,1 kHz e amplitude
de 1 V. O sinal foi quantizado em 5 bits. A figura abaixo mostra o sinal
original e o sinal quantizado.

#figure(
  image("./assets/r5-quantizacao.png"),
  caption: [Sinal original e quantizado],
)

Com os valores de amplitude do sinal quantizados, o próximo passo foi buscar
cada valor de amplitude e mapear para um símbolo binário. Para poder transmitir
o sinal binário, foi utilizado o código _NRZ_ e para isso é necessário aumentar
o período de bit para que o sinal possa ser transmitido. A figura abaixo mostra
o sinal binário gerado.

#figure(
  image("./assets/r5-binario.png"),
  caption: [Representação binaria e com aumento de amostragem],
)

Com o sinal _NRZ_ gerado, é possível transmiti-lo. A seguir vemos o sinal _NRZ_ e
o sinal recebido após a transmissão, com o ruído _AWGN_ adicionado.

#figure(
  image("./assets/r5-nrz.png"),
  caption: [Representação binaria e com aumento de amostragem],
)

Para a etapa de recepção devemos realizar o procedimento inverso da transmissão.
Onde primeiro devemos remover o ruído _AWGN_ do sinal recebido e depois
decodificar o sinal para recuperar os símbolos binários, interpretando-os como
valores de amplitude do sinal original.

#pagebreak()

= Conclusões

A atividade de simulação de um processo de conversão Analógico-Digital (AD),
transmissão e recepção binária de um sinal foi realizada com sucesso. Durante a
atividade foi possível compreender e aplicar os conceitos fundamentais de
amostragem, quantização, codificação, ruído Aditivo Branco