#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#set par(spacing: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: [Atividades Assíncronas
  
  Equações de Continuidade e Bernoulli],
  subtitle: "Fenômenos de Transporte",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "03 de Dezembro de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")
#set enum(numbering: "a)")
#set math.mat(delim: "[")
#set table(stroke: rgb("f1f1f1"))

#let cm2 = $"cm"^2$
#let m2 = $"m"^2$
#let kgpm3 = $"kg/m"^3$
#let m3ps = $"m"^3"/s"$
#let kgps = $"kg/s"$
#let mps = $"m/s"$
#let lps = $"L/s"$

= Questão 7

Em uma tubulação convergente, sabendo que a área na seção (1) é $30 cm2$ e na seção (2) é $15 cm2$e que a velocidade do fluido triplica após a pasagem, determine qual será a massa específica na saída sabendo que o fluido de trabalho é o ar (compressível) e inicialmente ele está com uma massa específica igual a $1,2 kgpm3$

Identificando as variáveis dadas pelo enunciado

$ 
  A_1 &= 30 cm2 = 30 dot.op 10^(-4) m2 \
  A_2 &= 15 cm2 = 15 dot.op 10^(-4) m2 \
  v_2 &= 3 v_1 \
  rho_1 &= 1,2 kgpm3
$

Aplicando o princípio de conservação de massa para encontrar $rho_2$

$
  m^dot_1 &= m^dot_2 \
  rho_1 dot.op v_1 dot.op A_1 &= rho_2 dot.op v_2 dot.op A_2 \
  rho_1 dot.op v_1 dot.op A_1 &= rho_2 dot.op 3 dot.op v_1 dot.op A_2 \
  rho_2 &= (rho_1 dot.op v_1 dot.op A_1) / (3 dot.op v_1 dot.op A_2) \
  rho_2 &= (rho_1 dot.op A_2) / (3 dot.op A_2) \
  rho_2 &= (1,2 dot.op 30 dot.op 10^(-4)) / (3 dot.op 15 dot.op 10^(-4)) \
  &#rect()[$rho_2 = 0,8$] checkmark
$

= Questão 8

Em um tanque misturador são adicionados 20 litros/s de água ($rho_"água"=1.000kgpm3$) e 10 litros/s de um óleo ($rho_"óleo"=900 kgpm3$). O resultado da mistura escoa por um duto de saída com área igual a $30 cm2$. Determine a massa específica e a velocidade da mistura no duto de saída. Considere os dois fluidos incompressíveis

Identificando as variáveis dadas pelo enunciado

$
  V^dot_"água" &= 20 "L/s" = 20 m3ps\
  rho_"água"   &= 1000kgpm3 \
  V^dot_"óleo" &= 10 "L/s" = 10 m3ps\
  rho_"óleo"   &= 900kgpm3 \
  A &= 30 cm2 = 30 dot.op 10^(-4) m2
$

Encontrando a velocidade na seção através da conservação do volume

$
  V^dot_"eq" &= V_"água" + V_"óleo"\
             &= 0,02 + 0,01 \
             &= 0,03
$

$
  V^dot_"eq" &= v_"eq" dot.op A \
  v_"eq" &= V^dot_"eq" / A \
  v_"eq" &= (0,03) / (30 dot.op 10^(-4)) \
  &#rect()[$v_"eq" = 10 mps$] checkmark
$

Calculando as vazões mássicas para os fluidos

$
  m^dot_"água" &= rho_"água" dot.op V^dot_"água"\
               &= 1000 dot.op 0,02\
               &= 20 kgps\

  m^dot_"óleo" &= rho_"óleo" dot.op V^dot_"óleo"\
              &= 900 dot.op 0,01\
              &= 9 kgps\
$

Encontrando a massa específica da mistura

$
  rho_"eq" &= (m^dot_"água" + m^dot_"óleo") / V^dot_"eq"\
           &= (20 + 9) / 0,03\
  &#rect()[$rho_"eq"= 966,67 kgpm3$] checkmark
$

= Questão 9

A Estação de Tratamento de Água da Lagoa do Peri faz parte do Sistema de Abastecimento de Água Costa Leste da CASAN, que atende aos distritos da Barra da Lagoa, Lagoa da Conceição, Campeche, Morro das Pedras, Armação e Ribeirão da Ilha. A estação está localizada dentro do Parque Municipal da Lagoa do Peri. A captação da água é feita através de uma barragem de elevação de nível com um canal adutor fechado até a Estação de Recalque de Água Bruta com vazão média de captação de $200 lps$. Sabendo que a altura da barragem é 20 m, determine o diâmetro da tubulação do canal adutor.

Identificando as variáveis dadas pelo enunciado

$
  V^dot &= 200 lps = 0,2 m3ps \
  z_1 &= 20 m
$

Aplicando a equação de Bernoulli simplificada para encontrar a velocidade

$
  v &= sqrt(2 dot g dot (z_1 - z_2))\
    &= sqrt(2 dot 9.8 dot (20 - 0)) \
    &= 19.8 mps
$

Descobrindo a seção de saída com base na vazão volumétrica

$
  V^dot &= v dot A\
  A &= V^dot / v \
    &= 0.2 / 19.8 \
    &= 0,0101 m2
$

Encontrando o diâmetro

$
  A &= pi (d/2)^2 \
  d &= 2 dot sqrt(A/pi) \
    &= 2 dot sqrt(0.0101/pi) \
  &#rect[$d = 0.113 m$] checkmark
$
