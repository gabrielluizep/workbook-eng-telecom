#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Lista 1",
  subtitle: "Comunicações Sem Fio",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "14 de Outubro de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")
#set enum(numbering: "1.a)")

= Questões

+ Em uma área rural, duas estações rádio base (ERB1 e ERB2) cobrem um segmento reto de uma rodovia. Um terminal móvel se desloca sobre a rodovia, no segmento que liga a ERB1 à ERB2, com velocidade uniforme de $90$ km/h, enquanto mantém uma chamada servida pela ERB1. A direção de movimento é tal que o móvel se afasta de ERB1 enquanto se aproxima de ERB2. As duas ERBs estão distantes $2$ km. Quando o móvel está a $500$m da ERB1, a intensidade de sinal é de $-100$ dBm. O nível mínimo de sinal necessário para manter a chamada é $-120$ dBm. Perguntas:
  + em qual distância máxima d sobre o segmento da rodovia deve ocorrer um _handoff_ da chamada de ERB1 para ERB2 (considere a ERB1 posicionada em $d=0$).

    Conhecendo o valor mínimo de sinal necessário para manter a chamada e possuindo uma leitura de referência podemos calcular a distância máxima ($d_max$) que o móvel pode se afastar da ERB1 antes de perder a chamada. Para isso, podemos utilizar a fórmula de perda de percurso:

    $
      P_r = P_0 - 10n log(d/d_0)
    $

    Onde $P_r$ é o valor recebido no receptor, neste caso o valor mínimo do sinal necessário para manter a chamada, $P_0$ é o valor de referência, $n$ é o expoente de perda de percurso, $d$ é a distância entre o transmissor e o receptor e $d_0$ é a distância de referência. Substituindo os valores conhecidos, temos:

    $
      P_(r",min") &= P_0 - 10n log(d_max/d_0) \
      -120 &= -100 - 10 dot.op 4 log(d_max/500) \
      d_max &approx 1581.14 "[m]"
    $

    Com isso descobrimos que a distância máxima que o móvel pode se afastar da ERB1 antes de perder a chamada é de aproximadamente $1581.14$ metros.

  + considerando que o sistema celular leva 5 segundos para processar todas as informações e efetuar o _handoff_, sugira o valor mínimo de um limiar de iniciação do processo de _handoff_ (em dBm) para evitar a queda da chamada. Considere que neste ambiente de propagação o expoente de perda de percurso vale $n=4$, podendo-se utilizar um modelo simplificado de perda de percurso.

    Sabendo a velocidade do carro e o tempo que o sistema leva para realizar o _handoff_, conseguimos calcular a distância que o móvel percorre durante o tempo de _handoff_, subtraíndo essa distância de _handoff_ ($d_"HO"$) da distância máxima ($d_"max"$) obtemos a distância em que o móvel deve iniciar o processo e com isso descobrimos o limiar para realizar o _handoff_ ($gamma_"HO"$). Para

    $
      d_"HO" &= v dot.op t; quad v = 90 "km/h" = 25 "m/s"; quad t = 5 "s" \
       &=  125 "m" \
    $

    $
    gamma_"HO" 
    &= P_0 - 10n log((d_"max" - d_"HO")/d_0)\
    &approx -118,57 "dBm"
    $

    Com isso descobrimos que o limiar para realizar o _handoff_ é de aproximadamente $-118,57$ dBm.

+ Em um sistema de telefonia móvel a relação sinal-ruído (SNR) mínima para recepção com boa qualidade é de $10$ dB. Foi medido que a potência de ruído térmico no telefone móvel é de $-120$ dBm. Considere ainda os seguintes parâmetros: (a) ganhos das antenas transmissora e receptora: 3 dBi; (b) frequência de operação: 800 MHz; (c) altura da antena da estação base: 20m; (d) altura da antena da estação móvel: 1,5 m; (e) potência de alimentação na antena da base: 1 W. Calcule o alcance de um sinal de rádio realizado nestas condições utilizando: 
  + o modelo de propagação do espaço-livre 

    $
      P_"r, dBm" = P_"t, dBm" + G_"t, dBi" + G_"r, dBi" + 20 log(lambda / (4pi d)) 
    $

    Isolando a distância $d$ temos:

    $
    20log(d) &= P_"t, dBm" + G_"t, dBi" + G_"r, dBi" + 20 log(lambda / (4pi)) - P_"r, dBm"
    $

    Substituindo os valores conhecidos, temos:

    $
      lambda &= c/f = 0.375 m \
      P_"r, dBm" &= "SNR" + P_"n, dBm" = -110 "dBm" \ \
      20log(d) &= 30 + 3 + 3 + 20 log(0.375 / (4pi)) - (-110) \
      20log(d) &= 115.49 \
             d &= 10^(115.49"/"20) \
             d &approx 595 "[km]"
    $

  + o modelo de propagação de 2 raios

    Segundo o modelo de propagação de 2 raios, a perda de percurso é dada por:

    $
      "PL"_"dB" = 40 log(d) - (G_t + G_r + 20 log(h_t) + 20 log(h_r))
    $

    Isolando a distância $d$ temos:

    $
    40 log(d) &= "PL"_"dB" + G_t + G_r + 20 log(h_t) + 20 log(h_r)
    $

    Substituindo os valores conhecidos, temos:

    $
    "PL"_"dB" &= P_t - P_r  = 140 "dBm" \
    40 log(d) &= -140 + 3 + 3 + 20 log(20) + 20 log(1.5) \
    40 log(d) &= 175.54 \
             d &= 10^(175.54"/"40) \
             d &approx 24.462 "[km]"
    $

  + o modelo COST231-Hata para cidade grande.

    A antena transmissora não se adequa aos requisitos para o modelo COST231-Hata, pois a altura da antena da estação base é de 20m, enquanto o modelo exige que a altura da antena da estação base seja de 30m a 200m.

    $
      a(h_r) &= 3.2 (log(11.75 dot.op h_r))^2 - 4.97 \
      L_(50"(urbano), dB") &= 69.55 + 26.16 log(f) - 13.82 log(h_t)\ &- a(h_r) + (44.9 - 6.55 log(h_t)) log(d) \
    $

    Isolando a distância $d$ temos:

    $
     log(d) &= (69.55 + 26.16 log(f)- 13.82 log(h_t) - a(h_r) - L_(50"(urbano), dB")) /(44.9 - 6.55 log(h_t)) \
    $

    Substituindo os valores conhecidos, temos:

    $
      a(h_r) &approx 0 \
      L_(50"(urbano), dB") &= P_t + G_t + G_r - P_r = 146 "dBm" \
      log(d) &= (146 - 69.55 - 26.16 log(800) + 13.82 log(20)) / (44.9 - 6.55 log(20)) \
      log(d) &approx 0.51 \
           d &approx 10^0.51 \
           d &approx 3.24 "[km]"
    $ 

+ Sejam dados: $P_a=15$ W, $G_t=12$ dBi, $G_r=3$ dBi. Seja a potência de ruído térmico no receptor $-120$ dBm. Qual o máximo raio de célula para o qual uma relação sinal-ruído (SNR) de $20$ dB pode ser garantida em $95%$ do perímetro da borda da célula? Assuma $n=4$, $sigma=8$ dB, $f=900$ MHz. Calcule uma perda de percurso de referência média em $d_0=1$ km utilizando o modelo de perda de percurso _COST231-Hata_ sabendo-se que a altura da antena da ERB é de $20$ m e a altura da antena do terminal móvel é de $1,8$ m. O ambiente em questão é de área suburbana de uma cidade.
