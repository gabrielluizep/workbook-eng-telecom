#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "4-PAM",
  subtitle: "Sistemas de Comunicações I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "31 de Maio de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")

= Questão 1

+ Gerar uma sequência de bits aleatórios.
+ Mapear a sequência de bits para símbolos utilizando uma sinalização _4-PAM_.
+ Aplicar o filtro cosseno levantado com um fator de roll-off especificado ($r$) e
  uma taxa de amostragem adequada.
+ Plotar a forma de onda resultante no domínio do tempo.
+ Calcular e plotar a densidade espectral de potência do sinal filtrado.

Após apresentar os gráficos solicitados, responda as seguintes perguntas:

#figure(image("./assets/4-pam.png"), caption: [Sinal original e quantizado])

#set enum(numbering: "a)")
+ Qual o efeito do fator de roll-off na forma de onda do sinal e na densidade
  espectral de potência?

  O fator de roll-off afeta a largura de banda do sinal filtrado. Um fator de
  roll-off maior resulta em uma maior largura de banda, permitindo uma transição
  mais suave entre os símbolos, o que reduz a interferência intersimbólica (ISI).
  No domínio do tempo, isso se traduz em uma forma de onda com transições mais
  suaves e menos interferência entre símbolos adjacentes. Na densidade espectral
  de potência, um maior fator de roll-off faz com que o espectro se espalhe mais,
  ocupando uma maior largura de banda.

+ Como a taxa de amostragem afeta a qualidade da formatação do sinal?

  A taxa de amostragem determina a resolução com a qual o sinal é representado no
  domínio do tempo. Uma taxa de amostragem alta proporciona uma representação mais
  precisa das transições do sinal, reduzindo a distorção e a perda de informação.
  Por outro lado, uma taxa de amostragem baixa pode levar a uma representação
  inadequada do sinal, resultando em aliasing e perda de fidelidade. Portanto,
  para garantir uma boa qualidade na formatação do sinal, a taxa de amostragem
  deve ser suficientemente alta para capturar as características essenciais do
  sinal modulado.

= Questão 2

+ Explique o princípio de operação de um filtro casado e sua importância na
  detecção de sinais.

  Um filtro casado é projetado para maximizar a relação sinal-ruído (SNR) na saída
  de um receptor, o que é crucial para a detecção de sinais em sistemas de
  comunicação. O princípio de operação do filtro casado baseia-se na convolução do
  sinal recebido com uma versão invertida e conjugada do próprio sinal
  transmitido. Este processo é matematicamente equivalente à correlação cruzada
  entre o sinal recebido e o sinal de referência.

  A importância do filtro casado na detecção de sinais é destacada pelos seguintes
  pontos:

  - Maximização da SNR: O filtro casado é ideal para detectar sinais no meio do
    ruído, pois ele maximiza a SNR na saída, aumentando a probabilidade de detecção
    correta do sinal.
  - Resiliência ao ruído: Ao maximizar a SNR, o filtro casado melhora a resiliência
    do sistema ao ruído, permitindo a detecção precisa do sinal mesmo em condições
    de baixa relação sinal-ruído.
  - Simplicidade de Implementação: A implementação do filtro casado é relativamente
    simples, pois envolve operações de convolução e pode ser realizada de maneira
    eficiente com algoritmos de processamento de sinais.

+ Quais são as vantagens e desvantagens de aumentar o número de níveis M em M-PAM?

  Vantagens:

  - Maior Eficiência Espectral: Aumentar o número de níveis $M$ em M-PAM (Modulação
    por Amplitude de Pulso) permite transmitir mais bits por símbolo, o que aumenta
    a eficiência espectral do sistema de comunicação.
  - Redução da Largura de Banda: Com mais bits transmitidos por, a taxa de
    transmissão de símbolos pode ser reduzida para uma dada taxa de bits,
    potencialmente reduzindo a largura de banda necessária.

  Desvantagens:

  - Maior Sensibilidade ao Ruído: Com mais níveis $M$, a distância mínima entre os
    níveis de amplitude diminui, tornando o sistema mais sensível ao ruído e à
    interferência. Isso pode aumentar a taxa de erro de bit (BER). Complexidade de
    Implementação: Sistemas com mais níveis $M$ exigem componentes de hardware mais
    precisos e complexos para gerar e detectar os níveis de amplitude corretos.
  - Requisitos de Potência: Para manter a mesma taxa de erro de bit, é necessário um
    aumento na potência de transmissão conforme $M$ aumenta, o que pode não ser
    desejável em todas as situações.

+ Explique o princípio de operação de um filtro casado e sua importância na
  detecção de sinais.

  A importância do filtro casado na detecção de sinais é destacada pelos seguintes
  pontos:

  - Maximização da SNR: O filtro casado é ideal para detectar sinais no meio do
    ruído, pois ele maximiza a SNR na saída, aumentando a probabilidade de detecção
    correta do sinal.
  - Resiliência ao ruído: Ao maximizar a SNR, o filtro casado melhora a resiliência
    do sistema ao ruído, permitindo a detecção precisa do sinal mesmo em condições
    de baixa relação sinal-ruído.
  - Simplicidade de Implementação: A implementação do filtro casado é relativamente
    simples, pois envolve operações de convolução e pode ser realizada de maneira
    eficiente com algoritmos de processamento de sinais.

+ Defina o Pulso Ideal de Nyquist e descreva suas propriedades principais.

  O Pulso Ideal de Nyquist é um pulso de forma especial utilizado em sistemas de
  comunicação para evitar a interferência intersimbólica (ISI). Este pulso é
  projetado para garantir que a amostra no instante desejado corresponda
  exatamente ao símbolo transmitido, enquanto todas as outras amostras (em outros
  instantes) são zero.

  Propriedades principais do Pulso Ideal de Nyquist:

  - Critério de Nyquist: O pulso satisfaz o critério de Nyquist, o que significa que
    suas amostras em múltiplos inteiros do intervalo de símbolo $T$ são zero, exceto
    na amostra central.
  - Forma de $sinc$: O Pulso Ideal de Nyquist é frequentemente representado pela
    função $sinc$, $sinc(t/T)$, onde $T$ é o período do símbolo. A função sinc é
    definida como $sinc(t)=sin(pi t)"/"(pi t)$.

  - Evita ISI: Devido à sua forma, o Pulso Ideal de Nyquist evita a interferência
    intersimbólica, garantindo que a amostra de cada símbolo não seja afetada pelos
    símbolos adjacentes. Largura de Banda: Embora o pulso sinc tenha uma largura de
    banda infinita em teoria, na prática, ele é truncado para limitar a largura de
    banda e facilitar a implementação.

+ Explique o que é a Inter-Symbol Interference (ISI) e como ela afeta a
  performance de um sistema de comunicação digital.

  A Interferência Inter-Simbólica (ISI) ocorre quando os símbolos adjacentes
  interferem entre si devido a sobreposições no tempo. Isso acontece geralmente
  por causa de filtros inadequados, dispersão no canal ou efeito de múltiplos
  caminhos.

  Efeitos da ISI na performance de um sistema de comunicação digital:

  - Aumento da Taxa de Erro de Bit (BER): A ISI pode fazer com que os símbolos
    recebidos sejam interpretados erroneamente, aumentando a taxa de erro de bit.
  - Redução da Qualidade do Sinal: A presença de ISI degrada a qualidade do sinal,
    dificultando a detecção correta dos símbolos transmitidos.
  - Complexidade de Recepção: Sistemas afetados por ISI exigem métodos de
    equalização mais complexos no receptor para mitigar os efeitos da interferência
    e recuperar o sinal original.
  - Capacidade de Canal: A ISI pode reduzir a capacidade efetiva do canal, pois a
    interferência entre símbolos limita a taxa máxima de transmissão de dados sem
    erros.

  A mitigação da ISI é essencial para garantir a alta performance e a
  confiabilidade dos sistemas de comunicação digital. Isso é frequentemente
  alcançado por meio de filtros de modelagem adequados (como o filtro cosseno
  levantado) e técnicas avançadas de equalização.

= Questão 3

Resolva os seguintes exercícios do livro do Sklar:

- 2.2; 2.17 e 2.18;
- 3.10 e 3.14;

#set enum(numbering: "1.a)")
+ (SKLAR 2.2) We want to transmit 800 characters/s, where each character is
  represented by its 7-bit ASCII codeword, followed by an eighth bit for error
  detection, per character, as in Problem 2.1. A multilevel PAM waveform with M =
  16 levels is used.
  + What is the effective transmitted bit rate?

    $
      R = 800 "characters/s" dot.op (7 + 1) "bits/character" = 6400 "bits/s"
    $

  + What is the symbol rate?

    $
      R_s = R/(4 "bits/symbol") = 1600 "symbols/s"
    $

+ (SKLAR 2.17) Calculate the difference in required signal power between two PCM
  waveforms, NRZ and RZ, assuming that each signaling scheme has the same
  requirements for data-rate and bit-error probability. Also assume equally likely
  signaling, and that the difference between the high-voltage and low-voltage
  levels is the same for both the NRZ and RZ schemes. If there is a power
  advantage in using one of the signaling schemes, what, if any, is the
  disadvantage in using it?

  Calculando a potência média de um sinal NRZ obtemos um valor de $A^2"/"4$ e para um sinal RZ obtemos $A^2"/"2$. Portanto, percebemos que utilizando a codificação NRZ necessita de metade da potência do sinal RZ.

+ (SKLAR 2.18) In the year 1962, AT&T first offered digital telephone transmission
  referred to as T1 service. With this service, each T1 frame is partitioned into
  24 channels or time slots. Each time slot contains 8 bits (one speech sample),
  and there is one additional bit per frame for alignment. The frame is sampled at the Nyquist rate of samples/s, and the bandwidth used for transmitting the composite signal is 386 kHz. Find the bandwidth efficiency (bits/s/Hz) for this signaling scheme.

  $
    R  &= 24 "amostras/frame" \ 
    &dot.op 8 "bits/amostra" \ &
    dot.op 8000 "frames/s" \ 
    &+ 1 "bit/frame (alinhamento" \ 
    &= 1.544 "Mbits/s"  
  $

  $
  R/W = (1.544 "Mbits/s")/(386 "kHz") = 4 "bits/s/Hz"
  $ 

+ (SKLAR 3.10) Binary data at 9600 bits/s are transmitted using 8-ary PAM
  modulation with a system using a raised cosine roll-off filter characteristic.
  The system has a frequency response out to 2.4 kHz.
  + What is the symbol rate?

    $
    R_s = (9600 "bits/s")/(3 "bits/symbol") = 3200 "symbols/s"
    $

  + What is the roll-off factor of the filter characteristic?

  $
  W_0= R_s/2 = 1600 "Hz"
  $

  $
  r = (W-W_0)/W_0 = (2400-1600)/1600 = 0.5
  $



+ (SKLAR 3.14) Consider that NRZ binary pulses are transmitted along a cable that
  attenuates the signal power by 3 dB (from transmitter to receiver). The pulses
  are coherently detected at the receiver, and the data rate is 56 kbit/s. Assume
  Gaussian noise with $N_0 = 10^(-6)$ Watt/Hz. What is the minimum amount of power
  needed at the transmitter in order to maintain a bit-error probability of PB =
  10-3?

  $
  P_B = Q(sqrt(2E_b/N_0)) = Q(sqrt(2E_b/2N_0))
  $

  $
  Q(x) = Q(sqrt((2A^2(1/56000))/(10^-6))) = 10^(-3)
  $

  Utilizando a tabela encontramos $x=3.1$. Portanto, isolando o argumento da função $Q$:

  $
  sqrt((2A^2(1/56000))/(10^-6)) &= 3.1\
  A^2 &= 0.268
  $

  Portanto se não houvesse sinal atenuado a potência mínima seria de $260 "mW"$