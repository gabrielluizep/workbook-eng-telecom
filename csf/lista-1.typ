#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode

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

#enum.item(1)[
Em uma área rural, duas estações rádio base (ERB1 e ERB2) cobrem um segmento reto de uma rodovia. Um terminal móvel se desloca sobre a rodovia, no segmento que liga a ERB1 à ERB2, com velocidade uniforme de $90$ km/h, enquanto mantém uma chamada servida pela ERB1. A direção de movimento é tal que o móvel se afasta de ERB1 enquanto se aproxima de ERB2. As duas ERBs estão distantes $2$ km. Quando o móvel está a $500$m da ERB1, a intensidade de sinal é de $-100$ dBm. O nível mínimo de sinal necessário para manter a chamada é $-120$ dBm. Perguntas:
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
]

#enum.item(2)[
Em um sistema de telefonia móvel a relação sinal-ruído (SNR) mínima para recepção com boa qualidade é de $10$ dB. Foi medido que a potência de ruído térmico no telefone móvel é de $-120$ dBm. Considere ainda os seguintes parâmetros: (a) ganhos das antenas transmissora e receptora: 3 dBi; (b) frequência de operação: 800 MHz; (c) altura da antena da estação base: 20m; (d) altura da antena da estação móvel: 1,5 m; (e) potência de alimentação na antena da base: 1 W. Calcule o alcance de um sinal de rádio realizado nestas condições utilizando: 
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

]
#enum.item(5)[
Sejam dados: $P_a=15$ W, $G_t=12$ dBi, $G_r=3$ dBi. Seja a potência de ruído térmico no receptor $-120$ dBm. Qual o máximo raio de célula para o qual uma relação sinal-ruído (SNR) de $20$ dB pode ser garantida em $95%$ do perímetro da borda da célula? Assuma $n=4$, $sigma=8$ dB, $f=900$ MHz. Calcule uma perda de percurso de referência média em $d_0=1$ km utilizando o modelo de perda de percurso _COST231-Hata_ sabendo-se que a altura da antena da ERB é de $20$ m e a altura da antena do terminal móvel é de $1,8$ m. O ambiente em questão é de área suburbana de uma cidade.

  Calculando a perda $L_(0,"urbano")$ a partir da distância de referência $d_0$ para o modelo COST231-HATA:

  $
    a(h_r) &= (1.1 log(f)-0.7)h_r - (1.56 log(f)-0.8) "dB" \
    C_M &= cases(0"dB" quad &"para cidades de tamanho médio"\ &"e áreas suburbanas", 3"dB" quad &"para centros metropolitanos") \
    L_(0,"urbano") &= 46.3+33.9 log(f) - 13.82 log(h_t) \ &- a(h_r) + (44.9 - 6.55 log(h_t)) log(d_0) + C_M
  $

  Substituindo os valores obtemos:

  $
    a(h_r) &= (1.1 log(900)-0.7)1.8 - (1.56 log(900)-0.8) "dB" \
           &= 0.7808 "dB" \
       C_M &= 0 "dB" \
  L_(0,"urbano") &= 46.3+33.9 log(900) - 13.82 log(20) 
         \ &- 0.7808 +  (44.9 - 6.55 log(20)) log(1) + 0 \
           &= 46.3+33.9 log(900) - 13.82 log(20)- 0.7808 \
           &= 127.69 "dB"
  $

  Sabendo que trata-se de uma área suburbana devemos utilziar a fórmula de correção:

  $
    L_0 &= L_(0,"urbano") - 2[log(f/28)]^2 - 5.4 \
        &= 127.69 - 2[log(900/28)]^2 - 5.4 \
        &= 117.75 "dB"
  $

  Com a perda no percurso podemos calcular a potência recebia da distância de referência:

  $
    P_t &= 15 "W" = 41.76 "dBm" \
    P_r (d_0) &= 41.76 + 12 + 3 - 117.75 \
              &= -60.99 "dBm"
  $

  Calculando a sensibilidade do receptor:

  $
    gamma &= "SNR" + N  = -120 - (20) = -100 \
  $

  Para então poder calcular a potência média para 95% do perímetro:

  $
    Pr[P_r (d) > -100] &= 0.95 \
    Q((-100 - P_r (d)) / 8) &= 0.95 \
    (-100 - P_r (d)) / 8 &= Q^(-1)(0.95) \
    (-100 - P_r (d)) / 8 &= -1.6449 \
    -P_r (d) &= -1.6449 dot.op 8 + 100 \
    P_r (d) &= -86.841 "dBm"
  $

  Então descobrimos o raio máximo da célula:

  $
    P_r (d_max) &= P_r (d_0) - 10 n log(d_max/d_0)\
        -86.841 &= -60.99 - 10 dot.op 4 log(d_max/1) \
        log(d_max) &= (-86.841 + 60.99) / (-40) \
                   &= 0.6463 \
            d_max  &= 10^0.6463 \
                   &= 4.4287 "km"
  $
]

#enum.item(8)[
Uma operadora de telefonia celular pretende cobrir uma grande cidade com área de $2500 "km"^2$ usando ERBs com $P_a=20$ W e $G_t=3$ dBi. Os terminais móveis têm $G_r=0$ dBi. Determinar o número de ERBs omnidirecionais necessárias para cobrir a cidade quando é esperado que 90% da periferia das células experimente cobertura de sinal a $-90$ dBm. Assuma $sigma=8$ dB e f=900 MHz. O modelo de COST231-Hata é válido neste ambiente. Você pode calcular uma potência média de referência em $d_0=1$ km usando os seguintes parâmetros: $h_t= 20$ m, $h_r=1.8$ m.

  O modelo COST231-HATA é dado por

   $
    a(h_r) &= (1.1 log(f)-0.7)h_r - (1.56 log(f)-0.8) "dB" \
    C_M &= cases(0"dB" quad &"para cidades de tamanho médio"\ &"e áreas suburbanas", 3"dB" quad &"para centros metropolitanos") \
    L_("urbano") &= 46.3+33.9 log(f) - 13.82 log(h_t) \ &- a(h_r) + (44.9 - 6.55 log(h_t)) log(d_0) + C_M
  $

  Aplicando à situação:

   $
    a(h_r) &= (1.1 log(900)-0.7)1.8 - (1.56 log(900)-0.8) "dB" \
           &= 0.7808 "dB" \
    C_M &= 3 "dB" \
    L_("urbano") &= 46.3 + 33.9 log(900) - 13.82 log(20) \ 
                 &- 0.7808 + (44.9 - 6.55 log(20)) log(1) + 3 \
                 &= 130.69 "dB"
  $

  Então descobrimos a potência recebida a distância de referência

  $
    P_t &= 20 "W" = 43.01 "dBm" \
    P_r (d_0) &= P_t + G_t + G_r - L_("urbano") \
        &= 43.01 + 3 + 0 - 130.69 \
        &= -84.68 "dBm"
  $

  Sabendo que eu preciso ter uma 90% de probabilidade de ter uma potência recebida de -90 dBm:

  $
    Pr[P_r (d) > -90] &= 0.9 \
    Q((-90 - P_r (d)) / 8) &= 0.9 \
    (-90 - P_r (d)) / 8 &= Q^(-1)(0.9) \
    (-90 - P_r (d)) / 8 &= -1.2816 \
    - P_r (d) &= -1.2816 * 8 + 90 \
    P_r (d) &= -79.747 "dBm"
  $

  Então descobrimos o raio máximo de cobertura:

  $
    P_r (d) &= P_r (d_0) - 10 n log(d/d_0) \
    -79.747 &= -87.68 - 10 dot.op 3.5 log(d/1) \
    log(d) &= (79.747 - 84.68)/35   \
           &= -0.1409 \
         d &=  0.7229 "km"
  $

  Com a distância podemos descobrir a área de cobertura de cada ERB:

  $
    A_"cobertura" &= pi d^2 \
      &= pi dot.op 0.7229^2 \
      &= 1.6417 "km"^2
  $

  Então é possível obter a quantidade de ERBs necessárias para cobrir a cidade

  $
   N_"ERB" = ceil(A_"cidade"/A_"cobertura") = ceil(2500/1.6417) = 1523 
  $

]

#enum.item(10)[
O provimento de cobertura celular em áreas rurais e remotas é um desafio para países como o Brasil, de grande extensão territorial. Considere uma situação em que um assinante de serviço de comunicação móvel encontra-se a $10$ km da ERB. Faça uma análise dos enlaces de descida e de subida considerando os seguintes parâmetros: potências EIRP: $37$ dBm na ERB; $27$ dBm no TM; despreze demais ganhos e perdas no transmissor e no receptor; a potência do ruído térmico vale $P_n=-120$ dBm; perda de percurso pode ser modelada como $L(d)=120+30log(d)$, sendo d a distância ERB-TM em [km]; a razão sinal ruído mínima para estabelecer o enlace é $5$ dB. Analise o equilíbrio de desempenho entre os enlaces de subida e de descida. A operadora pode instalar, quando necessário, um repetidor (relay) que regenera o sinal da ERB ou do TM, transmitindo-o novamente em posição mais favorável. Suponha que o relay opera com mesma potência EIRP do TM. Nessas condições avalie a necessidade de instalar um relay para atuar em um dos enlaces. Além disso, determine uma distância ou faixa de distâncias para a instalação do relay de forma a beneficiar a comunicação rural em questão.

  Calculando a potência limiar de potência no receptor:

  $
    gamma = "SNR" + N = 5 - 120 = 115 "dBm"
  $

  Calculando a perda na distância de 10 km:

  $
    L(d) &=120+30log(d) \
    L(10)&=120+30log(10) \
    &=150 "dB"
  $
 
  Verificando os limites para ERB e TM:

  $
    P_t &= 37 - L(10) = -113 "dBm" quad> -115 "dBm" therefore "OK" \
    P_r &= 27 - L(10) = -123 "dBm" quad< -115 "dBm" therefore "Precisa de relay"
  $

  Calculando a perda máxima:

  $
    gamma &= P_r - L_max \
    L_max &= P_r - gamma \
          &= 27 - (-115) \
          &= 142 "dB"
  $

  Descobrindo a distância máxima:

  $
    L(d_max) &=120+30log(d_max) \
    log(d_max) &= (L(d_max) - 120)/30 \
               &= (142 - 120) / 30 \
               &= 0.73\
        d_max  &= 10^0.73 \
               &= 5.37
  $
] 

#enum.item(13)[
Um sistema móvel celular é montado em uma pequena cidade com o intuito de prover serviço de acesso à internet por banda larga móvel. Vislumbra-se o uso em terminais estacionários como computadores portáteis e do tipo tablet. Uma única célula foi instalada visando cobrir toda a área do município. O sistema provê degraus de taxa no enlace de descida de acordo com um esquema de modulação e codificação adaptativa. Uma aproximação razoável da taxa bruta de download desse sistema é dada pela função $R("SNR")="SNR"/5$ [Mbps], sendo $"SNR">0$ [dB] a razão sinal ruído. A transmissão é interrompida se $"SNR"<=0$. A taxa máxima do sistema satura em $10$ Mbps. A operadora do serviço precisa dimensionar o raio de célula para fins de informação oficial à agência reguladora. Esta por sua vez requer que a taxa mínima oferecida para que se considere o serviço como de banda larga seja de $600$ kbps. Esta vazão precisa ser observada em pelo menos 98% do perímetro definido como sendo a borda da célula. Considerando que o ambiente de propagação é caracterizado por uma perda de percurso que segue o modelo simplificado com $n=3.5$ e o desvio padrão do desvanecimento de larga escala na região é assumido em $sigma = 8$ dB, dimensione o raio da célula a ser informado. Outras informações do projeto: potência do amplificador da antena transmissora: $20$ W; ganho da antena transmissora: $10$ dBi; ganho da antena receptora e demais perdas e ganhos de transmissão e recepção: $0$ dB; potência de referência medida a uma distância de $100$ m da antena transmissora: $Pr(100 "m") = - 45 "dBm"$; potência do ruído térmico no receptor: $-110$ dBm.

  Qual SNR me dá a taxa de $600$ kbps:
  
  $
    "SNR"/5 &= 0.6 "Mbps" \
    "SNR" &= 0.6 dot.op 5 "Mbps" \
     &= 3 "dB"
  $

  Potência recebida mínima

  $
    P_(r,"min") &= -110 +3 \
    P_(r,"min") &= -107
  $


  A probabilidade da potencia recebida ser maior do que 98% é 

  $
    Pr[P_r (d) > -107] &= 0.98 \
    Q((-107-P_r (d))/(8)) &= 0.98 \
    (-107-P_r (d))/(8) &= Q^(-1)(0.98) \ 
    (-107-P_r (d))/(8) &= -2.07 \
    P_r (d) &= -90.57
  $

  Descobrindo a distância máxima

  $
    P_r (d) &= P_r (d_0) - 10 n log(d/100) \
    log(d/100) &= (P_r (d_0) - P_r (d)) / (10 n)  \
               &= (-45 - (-90.57)) / (10 dot.op 3.5) \
               &= 1.302 \
             d &= 10^1.302 dot.op 100 \
               &= 2004.5  "m"   
  $
]

#enum.item(17)[
Você foi designado para projetar um sistema de transmissão sem fio de 4º geração. Trata-se de um sistema voltado exclusivamente para transmissão de dados sem fio. A taxa de transmissão em uma ERB no enlace de descida deste sistema é função da razão sinal-ruído (SNR, em dB) e pode ser aproximada pela seguinte expressão: 

$
  R("SNR") = cases(
    R("SNR")=50    quad     &"SNR">50 "dB",
    R("SNR")="SNR" quad     &0<="SNR"<=50 "dB",
    R("SNR")=0     quad     &"SNR"<0 "dB",
  )
$

em que $R$ é a taxa de transmissão em Megabits por segundo. Nesta primeira etapa do projeto uma única ERB será instalada no centro de uma cidade pequena e objetiva cobrir uma área circular de $10$ km de raio. A Prefeitura da cidade está contratando o serviço e quer saber de antemão de você:

+ qual a taxa média observada na periferia da cidade (borda da célula);

+ qual a taxa média observada em toda a área coberta.

Dados para o projeto: perda de referência em $d_0=1$ km é $120$ dB; potência de ruído térmico $P_n = -120$ dBm; modelo de propagação simplificado com $n=3.5$; potência EIRP de transmissão da ERB $P_t=20$ W. Despreze outros ganhos, perdas e interferências.

  Calculando a perda no caminho para a periferia da célula:

  $
    "PL"(d) &= "PL"(d_0) + 10 n log(d/d_0) \
            &= 120 + 10 dot.op 3.5 log(10/1) \
            &= 155 "dB" \
  $

  Encontrando a potência recebida no terminal:

  $
    P_t &= 20 "W" = 43.01 "dBm" \
    P_r &= P_t - "PL" \
        &= 43.01 - 155 \
        &= -111.99 "dBm"
  $

  Encontrando SNR:

  $
    "SNR" &= P_r - P_n \
          &= -111.9 - (-120) \
          &= 7.9
  $

  Como o SNR calculado está dentro dos limites de $0 <= "SNR" <= 50$ podemos inferir que a taxa se comporta como $R("SNR") = "SNR"$ Mbps portanto a taxa vista na borda da célula é de $8$ Mbps.
  
  Utilizando a linguagem de programação python podemos calcular para muitos valores de distancia entre 0 e 10 quilômetros e gerar uma curva com o comportamento da taxa em relação a distância da estação. 

  #sourcecode[
    ```python
    import numpy as np
    import matplotlib.pyplot as plt

    P_t = 43.01
    PL_d_0 = 120
    d_0 = 1
    n = 3.5
    P_n = -120
    ds = np.arange(0.1, 11, 0.1)
    snrs = np.zeros(len(ds))
    for i, d in enumerate(ds):
        PL = PL_d_0 + 10 * n * np.log10(d / d_0)
        P_r = P_t - PL
        snrs[i] = P_r - P_n

    snrs[snrs > 50] = 50
    snrs[snrs < 0] = 0

    plt.figure()
    plt.plot(ds, snrs)
    plt.ylabel("Taxa [Mbps]")
    plt.xlabel("Distância da ERB [km]")
    plt.show()
    ```
  ]
  
  #figure(
    image("./assets/lista-1-17.png"),
    caption: [Relação entre distância da ERB e taxa],
    supplement: "Figura",
  ) 
]