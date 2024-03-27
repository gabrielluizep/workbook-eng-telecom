#import "@preview/physica:0.8.0": *
#import "@preview/cetz:0.1.2": *

#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Prova 5",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "4 de Novembro de 2023",
  doc,
)

#let eqnumbering = "(1)"

#show math.equation:it => {
  if it.has("label") {
    math.equation(block: true, numbering: eqnumbering, it)
  } else {
    it
  }
}

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

Um vetor gaussiano $va(X) = mat(X_1, X_2, X_3, X_4)^TT$ tem média nula e matriz
de covariância

#box(
  )[
  #align(
    horizon,
  )[
    #grid(
      columns: (1fr, 1fr, 1fr),
      [$ va(X) = vec(X_1, X_2, X_3, X_4) $<x>],
      [$ va(mu)_va(x) = vec(0, 0, 0, 0) $<vetor-media-x>],
      [$ C_va(X) = mat(1, 1, 0, 0;1, 2, 0, 0;0, 0, 3, 3;0, 0, 3, 4) $<matriz-covariancia-x>],
    )
  ]
]

Determine:

#[
  #set enum(numbering: "(a)")
  + $Pr[2<= X_1 <= 3]$;
  + $Pr[2<= X_1 <= 3 | X_2 = 2]$;
  + $Pr[2<= X_1 <= 3 | X_2 = 2 and X_3 = 3 ]$;
  + $Pr[X_2 + X_4 > 4]$.
]

#pagebreak()

= Analise do enunciado

A partir do enunciado sabemos que $va(X)$ é um vetor gaussiano, por definição
isso implica que cada componente $X_i$ é uma variável aleatória gaussiana, ou
seja para podermos responder quais são as probabilidades pedidas precisamos
saber qual é a média e variância de cada componente.

Para obter tais informações podemos utilizar as demais informações dadas pela
questão, nos é informado que o vetor média $va(mu)_va(X)$ é nulo, ou seja todas
as componentes são 0, pela definição da média de um vetor podemos associar a
média de cada componente com a média do vetor, ou seja $mu_X_i = 0$.

$
va(mu)_va(X) = E [vec(X_1, X_2, X_3, X_4)] = vec(E[X_1], E[X_2], E[X_3], E[X_4]) = vec(0, 0, 0, 0)
$

Ou seja, $E[X_1] = E[X_2] = E[X_3] = E[X_4] = 0$.

Com base na matriz covariância $C_va(X)$ dada pelo enunciado podemos extrair a
variância de cada uma das distribuições componentes do vetor $va(X)$ e também as
relações entre as distribuições:

$
C_va(X) = mat(
  &"var"[X_1], &"cov"[X_1, X_2], &"cov"[X_1, X_3], &"cov"[X_1, X_4];&"cov"[X_2, X_1], &"var"[X_2], &"cov"[X_2, X_3], &"cov"[X_2, X_4];&"cov"[X_3, X_1], &"cov"[X_3, X_2], &"var"[X_3], &"cov"[X_3, X_4];&"cov"[X_4, X_1], &"cov"[X_4, X_2], &"cov"[X_4, X_3], &"var"[X_4]
) = mat(1, 1, 0, 0;1, 2, 0, 0;0, 0, 3, 3;0, 0, 3, 4)
$

A partir da análise acima podemos concluir que:

#grid(
  columns: (1fr, 1fr),
  row-gutter: 1em,
  [$ X_1 tilde N(0,sqrt(1)) $],
  [$ X_2 tilde N(0,sqrt(2)) $],
  [$ X_3 tilde N(0,sqrt(3)) $],
  [$ X_4 tilde N(0,sqrt(4)) $],
)

Sendo a distribuição gaussiana representada pela notação:

#box()[
  #align(horizon)[
    #grid(columns: (1fr, 1fr), [$ X tilde N(mu, sigma) $], [$ &mu = "média"\
      &sigma = "desvio padrão" $])
  ]
]

Também podemos concluir que existe uma relação de independência as distribuições $X_1$ e $X_2$ com
relação as distribuições $X_3$ e $X_4$, dado que se tratando de variáveis
aleatórias gaussianas, descorrelação implica independência e vice-versa.

#pagebreak()

= Calculando $Pr[2 <= X_1 <= 3]$

Para calcularmos a probabilidade de $X_1$ estar contido dentro do intervalo $2 <= X_1 <= 3$ devemos
utilizar a função de distribuição acumulada da distribuição gaussiana, que é
definida como:

#box(
  )[
  #align(
    horizon,
  )[
    #grid(
      columns: (1fr, 1fr),
      [$ Phi((x-mu)/sigma) = Pr[X <= x] $],
      [$ Phi((x-mu)/sigma) = integral_(-oo)^oo 1/(sigma sqrt(2pi)) exp(-1/2 ((x-mu)/sigma)^2) dif x $],
    )
  ]
]

A função descrita acima gera o seguinte gráfico para as gaussianas que estamos
trabalhando:
#figure(
  image("./assets/phi.svg"),
  caption: "Função de distribuição acumulada da gaussiana padrão",
  supplement: "Fig.",
)

Para $X_1 tilde N(0,1)$ temos:

$
Pr[2 <= X_1 <= 3] &= Phi((3-0)/1) - Phi((2-0)/1)\
&= Phi(3) - Phi(2)\
&= 0.99865 - 0.97725\
&= 0.0214\
&= 2.14%
$

Portanto a probabilidade de $X_1$ estar entre 2 e 3 é de 2.14%.

#pagebreak()

= Calculando $Pr[2 <= X_1 <= 3 | X_2 = 2]$

Analisando a matriz covariância @matriz-covariancia-x dada pelo enunciado
observamos que existe uma dependência entre as variáveis $X_1$ e $X_2$, ou seja,
para podermos calcular a probabilidade condicional pedida devemos utilizar a
distribuição gaussiana multivariada, que é definida como:

$ f_va(X) (va(x)) = 1/sqrt((2pi)^n det(C)) exp(-1/2 (va(x) - va(mu))^TT C^(-1) (va(x)-va(mu))) $

Para aplicarmos na fórmula podemos criar um vetor $va(x)$ apenas com as
variáveis $X_1$ e trazer as informações de média e covariância relacionadas:

#box()[
  #align(horizon)[
    #grid(
      columns: (1fr, 1fr, 1fr),
      row-gutter: 2em,
      [$ va(X) = vec(X_1, X_2) $],
      [$ va(mu) = vec(0, 0) $],
      [$ C = mat(1, 1;1, 2) $],
      [$ det(C) =(1 dot.op 2)-(1 dot.op 1) = 1 $],
      [$ C^(-1) = mat(2, -1;-1, 1) $],
    )
  ]
]

Para calcularmos a probabilidade condicional pedida utilizamos a seguinte
equação:

$
f_X_1 (x_1 | x_2 = 2) = (f_(X_1, X_2) (X_1, 2))/(f_X_2 (2))
$

$
f_(X_1, X_2) (X_1, 3) &=
1/sqrt((2pi)^2 dot.op [(1 dot.op 2)-(1 dot.op 1)]) exp(
  -1/2 (mat(X_1, 2) - mat(0, 0)) mat(2, -1;-1, 1) (vec(X_1, 2) - vec(0, 0))
)\

&= 1/sqrt((2pi)^2 dot.op 1) exp(-1/2 mat(X_1, 2) mat(2, -1;-1, 1) vec(X_1, 2))\

&= 1/sqrt((2pi)^2) exp(-1/2 (2X_1^2 - 4X_1 + 4))\

&= 1/sqrt((2pi)^2) exp(-X_1^2 + 2X_1 - 2)
$

$
f_X_2 (2) &= 1/sqrt(2pi sigma^2) exp(-1/2 ((2-mu)/sigma)^2)\
&= 1/sqrt(2 dot.op pi dot.op 2) exp(-1/2 ((2-0)/sqrt(2))^2)\
&= 1/sqrt(2 dot.op pi dot.op 2) exp(-1/2 (2/sqrt(2))^2)\
&= 1/sqrt(2 dot.op pi dot.op 2) exp(-1/2 dot.op 4/2)\
&= 1/sqrt(2 dot.op pi dot.op 2) exp(-1)\
$

$
f_X_1 (x_1 | x_2 = 2) &= (1/sqrt((2pi)^2) exp(-X_1^2 + 2X_1 - 2))/(1/(2sqrt(pi)) exp(-1))\
&= 1/sqrt((2pi)^2) dot.op sqrt(2 dot.op pi dot.op 2)/1 exp(-X_1^2 + 2X_1 - 2 + 1)\
&= sqrt((cancel(2pi) dot.op 2)/(cancel(2pi) dot.op 2pi))exp(-X_1^2 + 2X_1 - 1)\
&= 1/sqrt(2pi dot.op 1/2) exp(-1(X_1^2 - 2X_1 + 1))\
&= 1/sqrt(2pi dot.op 1/2) exp(-(X_1 - 1)^2)\
&= 1/sqrt(2pi dot.op 1/2) exp(-(X_1 - 1)^2/(2 dot.op 1/2 ))\

&=>f_X_1 (x_1 | x_2 = 2) tilde N(1, 1/2)
$

Observamos que a distribuição condicional $f_X_1 (x_1 | x_2 = 2)$ é uma
gaussiana com $mu = 1$ e $sigma = sqrt(1/2)$, com essa informação podemos
calcular a distribuição acumulada para essa gaussiana:

$
Phi((3-1)/sqrt(1/2)) - Phi((2-1)/sqrt(1/2)) &= Phi(2.8284) - Phi(1.4142)\
&= 0.9976 - 0.9214\
&= 0.0762\
$

Ou seja a probabilidade de $X_1$ estar entre 2 e 3 dado que $X_2 = 2$ é de
7.62%.

#pagebreak()

= Calculando $Pr[2 <= X_1 <= 3 | X_2 = 2 and X_3 = 3]$

Analisando a matriz covariância @matriz-covariancia-x dada pelo enunciado
observamos que existe uma dependência entre as variáveis $X_1$ e $X_2$ porém não
existe dependência entre as variáveis $X_1$ e $X_3$, podemos considerar apenas $X_2$ para
o calculo da probabilidade:

$
Pr[2 <= X_1 <= 3 | X_2 = 2 and X_3 = 3] &= Pr[2 <= X_1 <= 3 | X_2 = 2]\
$

Verificamos que a probabilidade condicional pedida é igual a probabilidade
condicional calculada anteriormente, ou seja a a probabilidade $X_1$ estar entre
2 e 3 dado que $X_2 = 2$ e $X_3 = 3$ é de 7.62%.

= Calculando $Pr[X_2 + X_4 > 4]$

Criamos um novo vetor aleatório $va(Y) = mat(X_2, X_4)^TT$ para podermos
trabalhar com as transformações lineares afins.

#box()[
  #align(center)[
    #grid(
      columns: (1fr, 1fr, 1fr),
      row-gutter: 2em,
      [$ va(Y) = vec(X_2, X_4) $],
      [$ va(mu)_va(Y) = vec(0, 0) $],
      [$ C_va(Y) = mat(2, 0;0, 4) $],
    )
  ]
]

Sendo uma transformação linear afim de, precisamos do da matriz de coeficientes $A$,
que representa a constante que está multiplicando cada componente da equação
linear ($1 dot.op X_2 + 1 dot.op X_4$), e o vetor de constantes $va(b)$, que
representa a constante que está somando a equação linear que no caso é um vetor
nulo.

Portanto:

#box()[
  #align(center)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 2em,
      [$A = mat(1, 1)$],
      [$va(b) = vec(0, 0)$],
    )
  ]
]

Então utilizamos as seguintes formulas para calcular a média e a variância da
distribuição de $va(Y)$:

#box()[
  #align(center)[
    #grid(columns: (1fr, 1fr), row-gutter: 2em, [$
      mu_Y &= A dot.op mu_va(Y)\
      &= mat(1, 1) dot.op vec(0, 0)\
      &= 0
      $], [$
      sigma^2 &= A C_va(Y) A^TT \
      &= mat(1, 1) mat(2, 0;0, 4) vec(1, 1)\
      &= 6
      $])
  ]
]

Portanto $va(Y) tilde N(0, sqrt(6))$, para calcularmos a probabilidade pedida
utilizamos a função cumulativa:

$
1 - Phi((4-0)/sqrt(6)) &= 1 - Phi(1.633)\
&= 1 - 0.94876\
&= 0.0512\
$

Ou seja, a probabilidade de $X_2 + X_4$ ser maior que 4 é de 5.12%.