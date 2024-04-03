#import "@preview/physica:0.9.3": *

#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Caderno da Matéria",
  subtitle: "Meios de Transmissão Guiados",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "",
  doc,
)

$
e^(j theta) &= cos(theta) + j sin(theta) \

r e^(j theta) &= r cos(theta) + j r sin(theta) = r angle theta \ \
$

$
Re{e^(j theta)} = cos(theta)  quad& quad  Im{e^(j theta)} = sin(theta) \
Re{r e^(j theta)} = r cos(theta)  quad& quad  Im{r e^(j theta)} = r sin(theta) \
$


$
A(z,t) &= A_0 cos(omega t - beta z) \
A(z,t) &= Re{A(z,t) e^(j (omega t-beta z))} \
A(z,t) &= Re{A_0 e^(j omega t) e^(-j beta z)} \
A_s &= A_0 e^(-j beta z) \
$

- Instantâneo $-->$ Fasorial:

  Tira $e^(j omega t)$ e $Re{dot.op}$

- Fasorial $-->$ Instantâneo:

  Colocar $e^(j omega t)$ e $Re{dot.op}$
  
*Exercícios*

#set enum(
  full: true,
  numbering: (..nums) => {
    let format = ("1.", "a )").at(nums.pos().len() - 1)
    numbering(format, nums.pos().at(-1))
  }
)

+ Transforme as seguintes funções instantâneas em fasoriais:


  + $A(t) = 16 cos(pi 10^6 t - pi/3)$

    $
    A_s &= 16 cos(pi 10^6 t - pi/3)\
    A_s &= Re{16 e^(-j pi/3)}\
    A_s &= 16 e^(-j pi/3)\
    $

  + $A(x,t) = A_0 sin(4 pi 10^8t+2x)$

    $
    A_s &= A_0 sin(4 pi 10^8t+2x)\
    A_s &= Re{A_0 e^(j 4 pi 10^8t + j 2x)}\
    A_s &= A_0 e^(j 2x)\
    $

+ Tranforme as seguintes funções fasoriais em instantâneas:

  + $A_s = 10 e^(j pi/4)$

    $
    A_s &= 10 e^(j pi/4)\
    A_s (t) &= Re{10 e^(j pi/4) e^(j omega t)}\
    A_s (t) &= 10 cos(omega t + pi/4)\
    $

  + $A_s = 5j e^(j 3pi/4)$

    $
    A_s &= 5j e^(j 3pi/4)\
    A_s (t) &= Re{5j e^(j 3pi/4) e^(j omega t)}\
    A_s (t) &= Re{5j e^(j(3pi/4 + omega t))}\
    A_s (t) &= Re{5j (cos(3pi/4 + omega t) + j sin(3pi/4 + omega t))}\
    A_s (t) &= -5 sin(omega t + 3pi/4)\
    $
    
= Parâmetros primários da L.T. (Linha de Transmissão)

// TODO: Adicionar imagem

- $R'$ = Resistência por unidade de comprimento
- $L'$ = Indutância por unidade de comprimento
- $G'$ = Condutância por unidade de comprimento
- $C'$ = Capacitância por unidade de comprimento
- $mu_0 = 4 pi 10^(-7)$ = Permeabilidade magnética do vácuo
- $mu_r$ = Permeabilidade magnética relativa do meio
- $epsilon_0 = 8.854 dot.op 10^(-12)$ = Permissividade elétrica do vácuo
- $epsilon_r$ = Permissividade elétrica relativa do meio

== Cabo Coaxial

// TODO: Adicionar imagem

- $sigma_c$ = Condutividade do condutor
- $sigma_d$ = Condutividade do dielétrico
- $a$ = Raio do interno
- $b$ = Raio do externo

=== Resistência por unidade de comprimento $[Omega"/"m]$

$
R' = 1/(2 pi) (1/a + 1/b) sqrt((pi f mu)/sigma_c) \
$

=== Indutância por unidade de comprimento $[H"/"m]$

$
L' = mu/(2 pi) ln(b/a) \
$

=== Capacitância por unidade de comprimento $[F"/"m]$

$
C' = (2 pi epsilon)/(ln(b/a)) \
$

=== Condutância por unidade de comprimento $[S"/"m]$

$
G' = (2 pi sigma_d)/ln(b/a) \
$

*Exercícios*

+ Calcule os parâmetros primários da linha de transmissão para um cabo coaxial com as seguintes características:

  $
  f &= 1 "GHz" \
  a &= 0.45 "mm" \
  b &= 1.47 "mm" \
  sigma_d &= 0 \
  sigma_c &= 5.8 dot.op 10^7 S"/"m \
  epsilon_r &= 2.26 \
  mu_r &= 1 \
  $

  Resistência por unidade de comprimento:

  $
  R' 
  &= 1/(2 pi) (1/a + 1/b) sqrt((pi f mu)/sigma_c) \
  &= 1/(2 pi) (1/(0.45 dot.op 10^(-3)) + 1/(1.47 dot.op 10^(-3))) sqrt((pi 10^9 4 pi 10^(-7))/(5.8 dot.op 10^7)) \
  &= 1/(2 pi) 1/10^(-3) (1/0.45 + 1/1.47) sqrt((4 pi^2 10^9  10^(-7))/(5.8 dot.op 10^7)) \
  &= 1/(2 pi) 10^3 (1/0.45 + 1/1.47) sqrt((4 pi^2 10^(-5))/(5.8))\
  &= 1/(2 pi) 10^3 (1/0.45 + 1/1.47) 2pi 10^(-2) sqrt(10^(-1)/5.8) \
  &= 10 (1/0.45 + 1/1.47) sqrt(1/58) \
  &= 3.81 [Omega"/"m] \
  $

  Indutância por unidade de comprimento:

  $
  L'
  &= mu/(2 pi) ln(b/a) \
  &= 4 pi 10^(-7)/(2 pi) ln(1.47/0.45) \
  &= 2 pi 10^(-7) ln(1.47/0.45) \
  &= 2 pi 10^(-7) ln(3.27) \
  &= 2 pi 10^(-7) 1.18 \
  &= 2.36 dot.op 10^(-7) [H"/"m] \
  $

  Capacitância por unidade de comprimento:

  $
  C'
  &= (2 pi epsilon)/(ln(b/a)) \
  &= (2 pi (2.26 dot.op 8.854 dot.op 10^(-12)))/(ln(1.47/0.45)) \ 
  &= (2 pi (2.26 dot.op 8.854 dot.op 10^(-12)))/(1.18) \
  &= 106.54 dot.op 10^(-12) [F"/"m] \
  $

  Condutância por unidade de comprimento:

  $
  G'
  &= (2 pi sigma_d)/ln(b/a) \
  &= (2 pi 0)/ln(1.47/0.45) \
  &= 0 [S"/"m] \
  $

+ Calcule os parâmetros primários da linha de transmissão para um cabo coaxial com as seguintes características:

  $
  a = 0.47 "mm" \
  b = 1.435 "mm" \
  f = 800 "MHz" \
  sigma_c = 5.8 dot.op 10^7 S"/"m \
  mu_r = 1 \
  epsilon_r = 2.26 \
  sigma_d = 10^(-16) S"/"m \
  $


= Equações telegráficas

// TODO: Adicionar imagem

== Lei de Kirchhoff para a linha de transmissão

$
V(z,t) - v(z+Delta z,t) = R' Delta z i(z,t) + L' Delta z pdv(i(z,t),t) \
(V(z,t) - V(z+Delta z,t))/(Delta z) = R' i(z,t) + L' pdv(i(z,t),t) \


$ 