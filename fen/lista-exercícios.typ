#set enum(numbering: "1a)")
= Formulário

Condução

$
  R = L/(k A)  
$


$
  Q = (-k A)/L (T_2 - T_1) = (T_2 - T_1)/R
$


= Exercícios

== Introdução

+ Conceitue taxa de transferência de calor.
+ O que é condução do calor?
+ O que é convecção do calor?
+ O que é radiação do calor?
+ Qual o mecanismo dominante de transmissão de calor nos sólidos?
+ Qual o mecanismo dominante de transmissão de calor nos fluidos?
+ Existe mecanismo de transmissão de calor que ocorra no vácuo? Se afirmativo, qual seria ele? 


== Condução

+ Uma taxa de transferência de calor de $3 "kW"$ atravessa uma seção de um material de isolamento, com uma área transversal de $10 "m"^2$ e espessura de $2.5 "cm"$. Se a superfície mais quente está a uma temperatura de $415 "ºC"$ e a condutividade térmica do material isolante é de $0.2 "W/mK"$, qual é a temperatura da superfície mais fria?

  Identificando as variáveis dada pelo enunciado
  $
    Q &= 3 "kW" \
    A &= 10 "m"^2 \
    L &= 2.5 "cm" = 0.025 "m" \
    T_1 &= 415 "ºC" \
    k &= 0.2 "W/mK" \
  $

  Aplicando o teorema de Fourier

  $
    Q &= -k A (T_2 - T_1)/L \
    (Q L) / (-k A) &= T_2 - T_1 \
    T_2 &= (Q L) / (-k A) + T_1 \
        &= (3 "kW" dot.op 0.025 "m") / (-0.2 "W/mK" dot.op 10 "m"^2) + 415 "ºC" \
        &= 377.5 "ºC"
  $

  Logo descobrimos que a temperatura da superfície mais fria é de $377.5 "ºC"$.

+ As temperaturas interna e externa em um vidro de janela, de 5 mm de espessura, são $24 "ºC"$ e $38 "ºC"$ respectivamente. Qual a taxa de transferência de calor através de uma janela de $1 "m"$ por $3 "m"$? A condutividade térmica do vidro é de $1.4 "W/mK"$ 

  Identificando as variáveis dada pelo enunciado

  $
    L &= 5 "mm" = 0.005 "m" \
    T_1 &= 24 "ºC" \
    T_2 &= 38 "ºC" \
    A &= 1 "m" dot.op 3 "m" = 3 "m"^2 \
    k &= 1.4 "W/mK" \
  $

  Aplicando o teorema de Fourier

  $
    Q &= -k A (T_1 - T_2)/L \
      &= -1.4 "W/mK" dot.op 3 "m"^2 dot.op (24 "ºC" - 38 "ºC") / (0.005 "m") \
      &= 11.760 "W"
  $

+  Uma câmara frigorífica possui $8 "m"$ de comprimento por $4 "m"$ de largura e $3 "m"$ de altura. O fundo da câmara é apoiado sobre o solo e pode ser assumido como perfeitamente isolado. Qual é a espessura mínima de espuma de uretano ($k = 0.026 "W/mK"$) que deve ser aplicada às superfícies do topo e dos lados do compartimento para garantir um ganho de calor menor que $500 "W"$, quando as temperaturas interna e externa são respectivamente $-10 "ºC"$ e $35 "ºC"$? 

  Identificando as variáveis dada pelo enunciado

  $
    l &= 8 "m" \
    w &= 4 "m" \
    h &= 3 "m" \
    k &= 0.026 "W/mK" \
    Q &< 500 "W" \
    T_1 &= -10 "ºC" \
    T_2 &= 35 "ºC" \
  $

  A área total da câmara frigorífica é

  $
    A &= 2 w h + 2 l h + l w \
      &= 2 dot.op 4 "m" dot.op 3 "m" + 2 dot.op 8 "m" dot.op 3 "m" + 8 "m" dot.op 4 "m" \
      
      &= 104 "m"^2
  $

  Aplicando o teorema de Fourier

  $
    Q &= -k A (T_1 - T_2)/L \
    L &= -k A (T_1 - T_2)/Q \
      &= -0.026 "W/mK" dot.op 104 "m"^2 dot.op (-10 "ºC" - 35 "ºC") / 500 "W" \
      &= #rect(fill: rgb("ff0000"))[$0.24336 "m" = 24.336 "cm"$]
  $

+ Um vidro duplo de janela é constituído por duas placas de vidro de $7 "mm"$ de espessura, com um espaço selado cheio de ar entre elas, também com espessura de $7 "mm"$. Considere que o ar entre os vidros permanece parado. Considere que a janela tem $0.8 "m"$ de comprimento e $0.5 "m"$ de largura.

  + Monte o circuito elétrico equivalente e calcule a resistência térmica total da janela. A condutifcidade térmica do ar estagnado (parado) é de $0.02624 "W/mK"$ e a do vidro é de $0.8 "W/mK"$.

    Identificando as variáveis dada pelo enunciado

    $
      L_"vidro" &= 7 "mm" = 0.007 "m" \
      k_"vidro" &= 0.8 "W/mK" \
      L_"ar" &= 7 "mm" = 0.007 "m" \
      k_"ar" &= 0.02624 "W/mK" \
      l &= 0.8 "m" \
      w &= 0.5 "m" \
    $

    Calculando a área da janela

    $
      A &= l w \
        &= 0.8 "m" dot.op 0.5 "m" \
        &= 0.4 "m"^2      
    $

    Calculando as resistências térmicas equivalentes utilizando a fórmula $R = L"/"(k A)$, primeiro para o vidro

    $
      R_"vidro" &= L_"vidro"/(k_"vidro" A) \
                &= (0.007 "m")/(0.8 "W/mK" dot.op 0.4 "m"^2) \
                &= 0.021875 "K/W" \
    $

    e depois para o ar

    $
      R_"ar" &= L_"ar"/(k_"ar" A) \
             &= (0.007 "m")/(0.02624 "W/mK" dot.op 0.4 "m"^2) \
             &= 0.6669 "K/W" \
    $

    Analisando o problema identificamos que o problema trata de uma associação em série de resistências térmicas, com o seguinte diagrama

    $
      R_"total" &= R_"vidro" + R_"ar" + R_"vidro" \
                &= 0.021875 "K/W" + 0.6669 "K/W" + 0.021875 "K/W" \
                &= 0.7107 "K/W"
    $

  + Qual é a perda de calor através da janela para um $Delta T$ de $20 "ºC"$?

      A partir do teorema de Fourier temos que a taxa de transferência de calor é dada por

      $
        Q &= (T_2 - T_1)/R \
          &= (20 "ºC")/(0.7107 "K/W") \
          &= 28.1412 "W"
      $

+ Qual a epsessura necessária para uma parede de argamassa, que tem uma condutividade térmica de $0.75 "W/mK"$, se a taxa de transferência de calor deve ser $75%$ através de uma parade de material estrutural composto que tem uma condutividade térmica de $0.25 "W/mK"$ e uma epessura de $100 "mm"$? considere que ambas as paredes estão sujeitas à mesma diferênça de temperatura.

  Identificando as variáveis dada pelo enunciado

  $
    k_"argamassa" &= 0.75 "W/mK" \
    k_"estrutural" &= 0.25 "W/mK" \
    L_"estrutural" &= 100 "mm" = 0.1 "m" \
    T_2/T_1 &= 75% => T_2 = 0.75 T_1 \
    Delta T &= T_2 - T_1 = -0.25 T_1
  $
  
+
+
+

== Convecção

+ Uma barra de $2.5 "cm"$ de diâmetro e $15 "cm"$ de comprimento é mantida a $260 "ºC"$. A temperatura do ambiente é $16 "ºC"$ e o coeficiente de transferência de calorpor convecção é $15 "W/m"^2"ºC"$. Calcule o calor perdido pela barra (taca de transferência de calor).

  Identificando as variáveis dada pelo enunciado

  $
    D &= 2.5 "cm" = 0.025 "m" \
    L &= 15 "cm" = 0.15 "m" \
    T_s &= 260 "ºC" \
    T_oo &= 16 "ºC" \
    h &= 15 "W/m"^2"ºC" \
  $

  Segundo a lei de Newton do resfiamento temos que a taxa de transferência de calor é dada por

  $
    Q = h A (T_s - T_oo) 
  $

  Sabendo que a área da barra é

  $
    A &= pi D L \
      &= pi dot.op 0.025 "m" dot.op 0.15 "m" \
      &= 0.01178 "m"^2 \
  $

  Aplicando a fórmula da taxa de transferência de calor

  $
    Q &= h A (T_s - T_oo) \
      &= 15 "W/m"^2"ºC" dot.op 0.01178 "m"^2 dot.op (260 "ºC" - 16 "ºC") \
      &= 43.1148 "W"
  $

+ Uma placa metálica colocada na horizontal, e perfeitamente isolada na parte de trás absorve um fluxo de radiação solar de $700 "W/m"^2$. Se a temperatura ambiente é de $30 "ºC"$, e não havendo circuilação forçada do ar, calcule a temperatura da placa nas condições de equilíbrio (isto é, quando todo o calor que está sendo recebido é eliminado). Para obter o coeficiente de convecção, consulte a table H.

  Identificando as variáveis dada pelo enunciado

  $
    Q_"rad" &= 700 "W/m"^2 \
    T_oo &= 30 "ºC" \
    h &= 29 "W/m"^2"ºC" \
  $

  A taxa de transferência de calor por radiação é dada por

  $
    Q_"rad" &= h A (T_s - T_oo)\
    T_s &= Q_"rad"/(h A) + T_oo \
        &= (700 "W/m"^2)/(29 "W/m"^2"ºC" dot.op 1 "m"^2) + 30 "ºC" \
        &= 53.4483 "ºC"
  $

+
+
+
+
+

== Radiação

+ Um corpo cuja superfície externa tem área $0.5 "m"^2$, emissividade $0.8$ e temperatura $150 "ºC"$ é colocado em uma câmara evacuada, muito maior que o corpo. As paredes da câmara são mantidas a $25 "ºC"$.

  + Qual a taxa de emissão de radiação do corpo?

    Identificando as variáveis dada pelo enunciado

    $
      A &= 0.5 "m"^2 \ 
      epsilon_s &= 0.8 \
      T_s &= 150 "ºC" = 423.15 "K" \
      T_oo &= 25 "ºC" = 298 "K" \
      sigma &= 5.67 dot.op 10^(-8) "W/m"^2"K"^4 \
    $

    A taxa de emissão de radiação do corpo é dada por

    $
      E &= epsilon_s sigma A_s T_s^4 \
        &= 0.8 dot.op 5.67 dot.op 10^(-8) "W/m"^2"K"^4 dot.op 0.5 "m"^2 dot.op (423.15 "K")^4 \
        &= #rect(fill:red)[$727.1440 "W"$]
    $

  + Qual a taxa de troca líquida de radiação entre o corpo e as paredes da câmara?

    A troca líquida de calor por radiação é dada por

    $
      Q &= epsilon A_s sigma (T_s^4 - T_oo^4) \
        &= 0.8 dot.op 0.5 "m"^2 dot.op 5.67 dot.op 10^(-8) "W/m"^2"K"^4 dot.op [(423 "K")^4 - (298 "K")^4]\
        &= 547.2556 "W"
    $

+ Uma placa horizontal e opaca, totalmente isolada em sua parte traseira, recebe um fluxo de radiação de $2500 "W/m"^2$, dos quais $500 "W/m"^2$ são refletidos. Calcule a refletividade, a absortividade, transmissividade e a emissividade da placa.

  Identificando as variáveis dadas pelo enunciado

  $
    Q_"rad" &= 2500 "W/m"^2 \
    Q_"refletido" &= 500 "W/m"^2 \
  $

  A refletividade é dada por

  $
    rho &= Q_"refletido"/Q_"rad" \
        &= 500 "W/m"^2/2500 "W/m"^2 \
        &= 0.2
  $

  A  é dada por absortividade é dada por

  $
    alpha &= 1 - rho \
          &= 1 - 0.2 \
          &= 0.8
  $

  Como a placa está isolada na parte traseira, a transmissividade é nula

  $
    tau &= 0
  $

  Validando as propriedades

  $
    alpha + rho + tau &= 1 \
    0.8 + 0.2 + 0 &= 1 quad checkmark
  $
    
+
+
+
+
+

== Transferência de calor combinada
+
+
+
+


== Tabelas de propriedades