#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "QAM",
  subtitle: "Sistemas de Comunicações I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "29 de Julho de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")

= Introdução

Este relatório detalha a aplicação da modulação 16-QAM na transmissão de sinais
binários, destacando suas vantagens e desafios. Por meio de uma simulação
avançada, realizamos uma análise da geração e transmissão de informações
aleatórias, considerando a configuração ideal de bits por símbolo para essa
modulação. Utilizando pulsos 4-PAM e a abordagem de transmissão I/Q,
investigamos detalhadamente o processo de transmissão e recepção de sinais, com
o objetivo de compreender seu desempenho e avaliar a eficiência na recuperação
das informações no receptor. Adicionalmente, são discutidos aspectos práticos e
teóricos que influenciam a qualidade do sinal e da comunicação, proporcionando
uma visão das potencialidades e limitações da modulação 16-QAM em diferentes
cenários de aplicação.

= Fundamentação teórica

== Modulação por Amplitude em Quadratura (QAM)
<modulação-por-amplitude-em-quadratura-qam>
A Modulação por Amplitude em Quadratura (QAM) é uma técnica de modulação digital
que combina duas ondas portadoras de mesma frequência, mas defasadas em 90 graus
(quadratura), para transmitir dados. Cada uma das portadoras é modulada em
amplitude de forma independente, e a soma das duas resulta no sinal modulado. O
sinal transmitido pode ser expresso como
$ s (t) = I (t) dot.op cos (2 pi f_c t) + Q (t) dot.op sin (2 pi f_c t) , $
onde $I (t)$ é a componente em fase, $Q (t)$ é a componente em quadratura, e $f_c$ é
a frequência da portadora. A combinação de $I (t)$
e $Q (t)$ em diferentes amplitudes permite a transmissão de múltiplos bits por
símbolo, aumentando a eficiência espectral do sistema.

== Modulação por Amplitude de Pulso (PAM)
<modulação-por-amplitude-de-pulso-pam>
A Modulação por Amplitude de Pulso (PAM) é uma técnica de modulação onde a
amplitude de cada pulso é proporcional à amplitude do sinal de modulação em um
determinado instante. A modulação PAM pode ser descrita matematicamente como $ s (t) = sum_n a_n dot.op p (t - n T) , $ onde
$a_n$ são as amplitudes dos pulsos, $p (t)$ é a forma do pulso, e $T$ é o
período de amostragem. A técnica PAM é a base para outras formas de modulação
digital, incluindo o QAM.

== Filtro Casado
<filtro-casado>
O Filtro Casado é um tipo de filtro projetado para maximizar a relação
sinal-ruído (SNR) na presença de ruído branco gaussiano. Ele é particularmente
útil na detecção de sinais digitais, onde é necessário recuperar sinais de pulso
transmitidos através de canais ruidosos. Para um sinal $s (t)$, o filtro casado $h (t)$ tem
a resposta impulsional dada por $ h (t) = s (T - t) , $ onde $T$ é a duração do
sinal de interesse. A saída do filtro casado no instante $T$ é maximizada, o que
facilita a detecção do pulso.

= Análise dos resultados

Para podermos dar inicio a simulação da modulação 16-QAM, primeiramente devemos
nos atentar aos parâmetros iniciais da simulação. Para isso, definimos a
quantidade de bits a serem transmitidos, a quantidade de bits por símbolo, a
quantidade de símbolos a serem transmitidos e a quantidade de amostras por
símbolo. Com esses parâmetros definidos, podemos prosseguir com a simulação.

Para esta simulação utilizamos 16 símbolos, o que nos permite transmitir 4 bits
por símbolo. A taxa de bits foi definida como 1024 bps, resultando em um tempo
de bit de 1 ms. A taxa de símbolos foi calculada como 256 bauds, com um tempo de
símbolo de aproximadamente 4 ms. A frequência de amostragem foi definida como
256 kHz, com um tempo de amostragem de 4 us. A frequência da portadora foi
estabelecida em 4 kHz. O número de bits a serem transmitidos foi definido como
4000, resultando em um tempo total de transmissão de 4 s.

Com o sistema de modulação 16-QAM configurado, realizamos a transmissão dos
símbolos gerados aleatoriamente, utilizando a modulação 16-QAM para codificar os
símbolos em sinais I e Q. A figura a seguir apresenta a constelação 16-QAM
gerada a partir dos símbolos transmitidos.

#align(center)[#box(height: 15em)[
    #figure(
      image("./assets/r6-16qam-constelacao.png"),
      caption: ["Constelação 16-QAM"],
    )
  ]
]

A constelação 16-QAM é composta por 16 pontos, representando os 16 símbolos
possíveis que podem ser transmitidos. Cada ponto da constelação representa um
símbolo, que é formado pela combinação de 4 bits. A distância entre os pontos da
constelação é proporcional à diferença entre os símbolos, o que facilita a
detecção e decodificação dos símbolos no receptor.

A partir dos sinais I e Q gerados, formatamos os sinais utilizando a técnica
4-PAM, que consiste em mapear os sinais I e Q em 4 níveis de amplitude. A figura
a seguir apresenta os sinais I e Q formatados utilizando a técnica 4-PAM.

#figure(
  image("./assets/r6-i-q.png"),
  caption: ["Sinais I e Q formatados utilizando 4-PAM"],
)

Para transmissão de um único sinal unimos os sinais I e Q, da seguinte forma:

$
  s(t) = I(t) dot.op cos(2 pi f_c t) - Q(t) dot.op sin(2 pi f_c t)
$

Com isso obtemos o sinal modulado, que é transmitido através do canal de
comunicação. No receptor, o sinal é demodulado e os sinais I e Q são recuperados
para a detecção dos símbolos transmitidos. A figura a seguir apresenta o sinal
16-QAM transmitido.

#figure(image("./assets/r6-tx.png"), caption: ["Sinal 16-QAM transmitido"])

Na recepção, o sinal é demodulado e os sinais I e Q são recuperados para a
detecção dos símbolos transmitidos. O processo de demodulação é realizado
utilizando um filtro casado, que é projetado para maximizar a relação
sinal-ruído (SNR) na presença de ruído branco gaussiano. A figura a seguir
apresenta o sinal 16-QAM recebido.

= Conclusões

A análise da modulação 16-QAM demonstrou ser uma técnica eficaz para a
transmissão de sinais binários, oferecendo uma melhoria significativa na
eficiência espectral em comparação com métodos mais simples. As simulações
evidenciaram que a combinação das componentes em fase e quadratura permite a
transmissão de múltiplos bits por símbolo, maximizando a utilização do espectro.
Apesar das vantagens, é essencial considerar as limitações e ajustar a
implementação da modulação 16-QAM conforme as condições específicas para
otimizar o desempenho em diversos cenários de aplicação.