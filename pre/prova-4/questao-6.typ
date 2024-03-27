#import "@preview/physica:0.8.0": *
#import "@preview/cetz:0.1.2": *

#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Prova 4",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "16 de Outubro de 2023",
  doc,
)

= Questão

Sejam $X_1, X_2, X_3 tilde.op "Unif"({-1,1})$ variáveis aleatórias sorteadas
independentemente.

#enum(
  numbering: "(a)",
)[
  Sejam

  $
  Y_1 &= X_1\
  Y_2 &= X_1 X_2\
  Y_3 &= X_1 X_2 X_3\
  $

  Determine o vetor média e a matriz covariância do vetor aleatório $va(Y) = vecrow(Y_1, Y_2, Y_3)^TT$
][
  Sejam

  $
  Z_1 = Y_1 + Y_2\
  Z_2 = Y_2 + Y_3\
  Z_3 = Y_3 + Y_1\
  $

  Determine o vetor média e a matriz covariância do vetor aleatório $va(Z) = vecrow(Z_1, Z_2, Z_3)^TT$.
  *Utilize a formulação matricial*
]

#pagebreak()

= Resolução

== Vetor média de $va(Y)$

O vetor média é definido por:

$
va(mu)_va(Y) = E[va(Y)]
$

lembrando que a média de um vetor aleatório $va(X)$ é definida por:

$
va(mu)_va(X) = vecrow(E[Y_1], E[Y_2], ..., E[Y_n])^TT
$

E lembrando que a média de uma variável aleatória $X$ é definida por:

$
E[X] = sum_(x in X) x P(X = x)
$

Para a distribuição $"Unif"({-1, 1})$ a probabilidade de que seja sorteado um
valor pertencente a cada ponto no conjunto ${-1, 1}$ é igual $1/2$ porque a
probabilidade total deve ser igual a 1 e temos dois itens possíveis de ser
sorteado.

Dito isso, podemos calcular a média de $va(Y)$:

$
va(mu)_va(Y) &= vecrow(E[Y_1], E[Y_2], E[Y_3])^TT \
va(mu)_va(Y) &= vecrow(E[X_1], E[X_1 X_2], E[X_1 X_2 X_3])^TT \
va(mu)_va(Y) &= vecrow(E[X_1], E[X_1] dot.op E[X_2], E[X_1] dot.op E[X_2] dot.op E[X_3])^TT
$

Calculando cada uma das médias:

$
E[X_1] = E[X_2] &= E[X_3] = sum_(x in X) x P(X = x) \
&= 1 dot.op P(X = 1) + (-1) dot.op P(X = -1) \
&= 1 dot.op 1/2 + (-1) dot.op 1/2 \
&= 0
$

Para $Y_2$ e $Y_3$ temos uma multiplicação de variáveis aleatórias, sabendo que $X_1$ e $X_2$ são
independentes, podemos calcular a média de $Y_2$ e $Y_3$ da seguinte forma:

#grid(columns: (1fr, 1fr), [
  $
  E[Y_2] &= E[X_1 X_2] \
  &= E[X_1] E[X_2] \
  &= 0
  $
], [
  $
  E[Y_3] &= E[X_1 X_2 X_3] \
  &= E[X_1] E[X_2] E[X_3]\
  &= 0
  $
])

Dessa forma, podemos calcular a média de $va(Y)$:

$
va(mu)_va(Y) &= vecrow(E[Y_1], E[Y_2], E[Y_3])^TT \
&= vecrow(0, 0, 0)^TT \
$

== Matriz covariância de $va(Y)$

A matriz covariância é definida por:

$
va(C)_va(Y) = mat(delim:"[",
                  "var"[Y_1], "cov"[Y_1, Y_2], "cov"[Y_1,Y_3];
                  "cov"[Y_2, Y_1], "var"[Y_2], "cov"[Y_2,Y_3];  
                  "cov"[Y_3, Y_1], "cov"[Y_3, Y_2], "var"[Y_3])
$

Sendo a covariância definida por:

$
"cov"[X, Y] = E[(X - mu_x)(Y - mu_Y))]
$

E sabendo que:

$
"cov"[X, Y] = "cov"[Y, X]
$

Podemos então calcular as covariâncias

$
"cov"[Y_1, Y_2] &= E[(Y_1 - E[Y_1])(Y_2 - E[Y_2])] \
&= E[Y_1 Y_2] \
&= E[X_1 X_1 X_2] \
&= E[X_1] E[X_1] E[X_2] \
&= 0
$

$
"cov"[Y_1, Y_3] &= E[(Y_1 - E[Y_1])(Y_3 - E[Y_3])] \
&= E[Y_1 Y_3] \
&= E[X_1 X_1 X_2 X_3] \
&= E[X_1] E[X_1] E[X_2] E[X_3] \
&= 0
$

$
"cov"[Y_2, Y_3] &= E[(Y_2 - E[Y_2])(Y_3 - E[Y_3])] \
&= E[Y_2 Y_3] \
&= E[X_1 X_1 X_2 X_2 X_3] \
&= E[X_1] E[X_1] E[X_2] E[X_2] E[X_3] \
&= 0
$

A variância definida por:

$
"var"[X] = E[(X - mu_X)^2]
$

Com isso podemos calcular as variâncias:

$
"var"[Y_1] &= E[(Y_1 - E[Y_1])^2] \
&= E[Y_1^2] \
&= E[X_1^2] \
&= sum_(x in X) x^2 P(X = x) \
&= 1^2 dot.op P(X = 1) + (-1)^2 dot.op P(X = -1) \
&= 1 dot.op 1/2 + 1 dot.op 1/2 \
&= 1
$

$
"var"[Y_2] &= E[(Y_2 - E[Y_2])^2] \
&= E[Y_2^2] \
&= E[X_1^2 X_2^2] \
&= E[X_1^2] E[X_2^2] \
&= sum_(x in X) x^2 P(X = x) \
&= 1^2 dot.op P(X = 1) + (-1)^2 dot.op P(X = -1) \
&= 1 dot.op 1/2 + 1 dot.op 1/2 \
&= 1
$

$
"var"[Y_3] &= E[(Y_3 - E[Y_3])^2] \
&= E[Y_3^2] \
&= E[X_1^2 X_2^2 X_3^2] \
&= E[X_1^2] E[X_2^2] E[X_3^2] \
&= sum_(x in X) x^2 P(X = x) \
&= 1^2 dot.op P(X = 1) + (-1)^2 dot.op P(X = -1) \
&= 1 dot.op 1/2 + 1 dot.op 1/2 \
&= 1
$

Portanto a matriz covariância de $va(Y)$ é:

$
va(C)_va(Y) = dmat(1, 1, 1, delim:"[", fill: 0)
$

#set math.mat(delim:"[")
#set math.vec(delim:"[")
== Vetor média de $va(Z)$

O vetor média é definido por:

$
va(mu)_va(Z) = A dot.op va(mu)_va(Y) + va(b)
$

Portanto:

$
va(mu)_va(Z) &= mat(1,1,0;0,1,1;1,0,1) dot.op vec(0,0,0) + vec(0,0,0)
&= vec(0,0,0)
$


== Matriz covariância de $va(Z)$

A matriz covariância é definida por:

$
C_va(Z) = A dot.op C_va(Y) dot.op A^TT
$

Portanto:

$
C_va(Z) = mat(1,1,0;0,1,1;1,0,1) dot.op dmat(1, 1, 1, delim:"[", fill: 0) dot.op mat(1,0,1;1,1,0;0,1,1) = dmat(2, 2, 2, delim:"[", fill: 1)
$