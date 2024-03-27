#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Prova 6",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "4 de Novembro de 2023",
  doc,
)

#let eqnumbering = "(1)"

#set math.equation(block: true, numbering: none)
// #show math.equation:it => {
//   if it.has("label") {
//     math.equation(block: true, numbering: eqnumbering, it)
//   } else {
//     it
//   }
// }

#show ref: it => {
  let el = it.element
  if el != none and el.func() == math.equation {
    link(
      el.location(),
      numbering(eqnumbering, counter(math.equation).at(el.location()).at(0) + 1),
    )
  } else {
    it
  }
}

#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Questão

Considere o processo estocástico

$ X(t) = A "rect"(t-T), $

onde $A$ e $T$ são variáveis aleatórias independentes, ambas uniformemente
distribuídas sobre o conjunto finito ${-1/2, +1/2}$.

#[
  #set enum(numbering: "(a)")
  + Determine e esboce três possíveis realizações (funções-amostra) do proceso, à
    sua escolha.
  + Determine e esboce a função média de $X(t)$.
  + Determine a função autocovariância de $X(t)$.
]

#pagebreak()

= Determinando funções-amostra de $X(t)$

$A$ e $T$ podendo assumir dois valores ($-1/2$ e $+1/2$), temos quatro possíveis
realizações para $X(t)$:

#table(
  columns: (1fr, 1fr, 2fr),
  align: (horizon + center),
  [$A$],
  [$T$],
  [$X(t)$],
  [$ -1/2 $],
  [$ -1/2 $],
  [$ -1/2 "rect"(t+1/2) $],
  [$ -1/2 $],
  [$ +1/2 $],
  [$ -1/2 "rect"(t-1/2) $],
  [$ +1/2 $],
  [$ -1/2 $],
  [$ +1/2 "rect"(t+1/2) $],
  [$ +1/2 $],
  [$ +1/2 $],
  [$ +1/2 "rect"(t-1/2) $],
)

== Esboçando as funções-amostra

#figure(
  image("./assets/funções-amostra.png"),
  caption: [Funções-amostra de $X(t)$],
  supplement: "Fig.",
)

#pagebreak()

= Determinando a função média de $X(t)$

A função média de $X(t)$ é definida por:

$
mu_X (t) = E[X(t)] = sum_(x in X) x P[X(t) = x]
$

Aplicando o $X(t)$ dado pela questão obtemos:

$
mu_X (t) = E[A "rect"(t-T)]
$

Como $A$ e $T$ são variáveis aleatórias independentes, temos:

$
mu_X (t) &= E[A] E["rect"(t-T)]
$

#grid(columns: (1fr, 1fr), [$
  E[A] &= sum_(a in A) a P[A = a]\
  &= -1/2 P[A = -1/2] + 1/2 P[A = 1/2]\
  &= -1/2 (1/2) + 1/2 (1/2)\
  &= 0
  $], [$
  E["rect"(t-T)] &= sum_(t in T) "rect"(t-T) P[T = t]\
  &= "rect"(t+1/2) P[T = -1/2]\
  &space + "rect"(t-1/2) P[T = 1/2]\
  &= 1/2 "rect"(t+1/2) + 1/2 "rect"(t-1/2)\
  &= 1/2"rect"(t/2)
  $])

$
mu_X (t) &= 0 (1/2"rect"(t/2)) = 0
$

#pagebreak()

= Determinando a função autocovariância de $X(t)$

A função autocovariância de $X(t)$ é definida por:

$
C_X (t_1, t_2) = "cov"[X(t_1), X(t_2)] = E[(X(t_1) - mu_X (t_1)) (X(t_2) - mu_X (t_2))]
$

Aplicando o $X(t)$ dado pela questão obtemos:

$
C_X (t_1, t_2) &= E[(A "rect"(t_1-T) - 0) (A "rect"(t_2-T) - 0)]\
&= E[A "rect"(t_1-T) A "rect"(t_2-T)]\
&= E[A^2 "rect"(t_1-T) "rect"(t_2-T)]\
&= E[A^2] E["rect"(t_1-T) "rect"(t_2-T)]
$

$
E[A^2] &= sum_(a in A) a^2 P[A = a]\
&= (-1/2)^2 P[A = -1/2] + (1/2)^2 P[A = 1/2]\
&= 1/4 (1/2) + 1/4 (1/2)\
&= 1/4
$

$
E["rect"(t_1-T) "rect"(t_2-T)] &= sum_(t in T) "rect"(t_1-t) "rect"(t_2-t) P[T = t] \
&= "rect"(t_1+1/2) "rect"(t_2+1/2) P[T = -1/2]\
&space + "rect"(t_1-1/2) "rect"(t_2-1/2) P[T = 1/2]\
&= (1/2) "rect"(t_1+1/2) "rect"(t_2+1/2)\
&space + (1/2) "rect"(t_1-1/2) "rect"(t_2-1/2)
$