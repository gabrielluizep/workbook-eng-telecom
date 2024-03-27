#import "@preview/physica:0.8.0": *

#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Prova 7",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "23 de Novembro de 2023",
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

Considere dois processos de Poisson, $X_1 (t)$ e $X_2 (t)$, independentes, de
taxas $lambda_1 = 2.5$ e $lambda_2 = 2$ eventos por segundo, respectivamente.
Seja $X(t) = X_1 (t) + X_2 (t)$. As questões abaixo são todas referente ao
processo estocástico $X(t)$.

#[
  #set enum(numbering: "(a)")

  + Determine e esboce a função média do processo estocástico.
  + Determine a probabilidade de ocorrer pelo menos quinze eventos entre 10 e 13
    segundos, dado que ocorreu exatamente um evento entre 6 e 9 segundos.
  + Determine a probabilidade de que o tempo decorrido entre o segundo evento e o
    terceiro evento seja maior que 0.1 segundos.
  + Determine a matriz covariâmcia do vetor aleatório $mat(X(3), X(4))^TT$
]

#pagebreak()

= Resolução

== Calculando a função média

$
lambda_X &= lambda_1 + lambda_2 = 2.5 + 2 = 4.5\

mu_X (t) &= lambda_X t [t >= 0]\

therefore mu_X (t) &= 4.5 t [t >= 0]
$

#figure(
  image("./assets/mu_x.png"),
  caption: [Função média de $X(t)$],
  supplement: "Fig.",
)

== Calculando a probabilidade condicional

$
Pr[X_(10, 13) >= 15 | X_(6, 9) = 1] &= Pr[X_(10, 13) >= 15]\
$

$
X_(10, 13) tilde "Poisson"(lambda_X dot.op (13 - 10)) &= "Poisson"(4.5 dot.op 3)\
&= "Poisson"(13.5)\
$

$
p_X (x) &= e^(-mu) dot.op mu^x / x! \
&therefore\
Pr[X_(10, 13) >= 15]&= 1- e^(-13.5) dot.op sum_(x=0)^14 (13.5^x / x!)\
&= 1- 0.623271\
&= 0.376729\
&= 37.7%\
$

== Determinando a probabilidade do intervalo entre o segundo e o terceiro evento ser maior que 0.1 segundos

$
P(T>t) &= e^(-lambda t)\
P(T>0.1) &= e^(-4.5 dot.op 0.1)\
&= e^(-0.45)\
&= 0.638\
&= 63.8%\
$

== Determinando a matriz covariância de $mat(X(3), X(4))^TT$

$
C_X(t_1, t_2) = lambda_X min{t_1, t_2} quad [t_1, t_2 > 0]\
$

$
C_va(X) &= mat("cov"(X(3),X(3)) "cov"(X(3),X(4));"cov"(X(4),X(3)) "cov"(X(4),X(4)))\

"cov"(X(3),X(3)) &= 4.5 min{3, 3} = 4.5 dot.op 3 = 13.5\
"cov"(X(3),X(4)) &= 4.5 min{3, 4} = 4.5 dot.op 3 = 13.5\
"cov"(X(4),X(3)) &= 4.5 min{4, 3} = 4.5 dot.op 3 = 13.5\
"cov"(X(4),X(4)) &= 4.5 min{4, 4} = 4.5 dot.op 4 = 18\

therefore C_va(X) &= mat(13.5, 13.5;13.5, 18)\
$