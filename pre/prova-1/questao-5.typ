#import "@preview/ifsc-sj-articled:0.1.0": article

#show: doc => article(
  title: "Prova 1",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "13 de Setembro de 2023",
  doc,
)

= Questão

Considere uma variável aleatória X definida através do seguinte experimento
probabilístico. Um dado honesto é lançado.

- Se o resultado for ímpar, então $X = 0$;
- Se o resultado for par, então $X$ é sorteada de acordo com a distribuição
  exponencial com parâmetro $lambda = 2$.

#set enum(numbering: "(a)")

+ Determine e esboce a PDF de $X$
+ Determine e esboce a CDF de $X$
+ Determine a média de $X$
+ Determine $Pr[-2 <= X <= 2]$

= Desenvolvimento

== PDF

Utilizando o teorema da probabilidade total, temos que:

$
f_X (x) &= f_X (x | U = 1 or U = 3 or U = 5)Pr[U = 1 or U = 3 or U = 5] \
&+ f_X (x | U = 2 or U = 4 or U = 6)Pr[U = 2 or U = 4 or U = 6]
$

A partir disto temos que a PDF de $X$ é dada por:

$
f_X (x) &= 1/2 delta(x) + 1/2 2e^(-2x) u(x) \
&= 1/2 delta(x) + e^(-2x) u(x)
$

=== Esboço da PDF de $X$.

#image("./assets/pdf.svg")

== CDF

Para obter a CDF de $X$ basta integrar a PDF de $X$ até o ponto $x$ desejado,
temos então que para valores menores que $0$:

$
F_X (x) = integral_(-infinity)^(0^-) 0 dif u = 0
$

Para quando $x = 0$:

$
F_X (x) = integral_(-infinity)^(0^-) 0 dif u +
integral_(0^-)^(0^+) 1/2 delta(u) dif u = 0 + 1/2 = 1/2
$

E para quando $0 < x < infinity$:

$
F_X (x) &= integral_(-infinity)^(x) f_X (x) \
&= integral_(-infinity)^(0^-) 0 dif u +
integral_(0^-)^(0^+) 1/2 delta(u) dif u +
integral_(0^+)^(x) e^(-2u) dif u \
&= 0 + 1/2 + [-1/2 e^(-2u)]_(u=0^+)^(u=x) \
&= 1/2 + [-1/2 (e^(-2x) - e^(-2 dot.op 0))] \
&= 1/2 + [-1/2 (e^(-2x) - 1)] \
&= 1/2 - 1/2 e^(-2x) + 1/2 \
&= 1 - 1/2 e^(-2x)
$

Considerando a analise dos casos podemos resumir a função CDF de $X$ como:

$
F_X (x) = cases(1 - 1/2 e^(-2x) &", " x >= 0, 0 &", caso contrário")
$

=== Esboço da CDF de $X$.
#image("./assets/cdf.svg")

== Média de $X$

A média de $X$ é dada por:

$
E[X] &= integral_(-infinity)^(infinity) x f_X (x) dif x \
&= integral_(-infinity)^(infinity) x (1/2 delta(x) + e^(-2x)u(x))dif x \
&= integral_(-infinity)^(infinity) 1/2 x delta(x) dif x + integral_(-infinity)^(infinity) x e^(-2x)u(x) dif x \
&= 1/2 integral_(0^-)^(0^+) x dif x + integral_(0)^(infinity) x e^(-2x) dif x \
&= 1/2 [x^2/2]_(x=0^-)^(x=0^+) + [1/4 (-2e^(-2x) x - e^(-2x))]_(x=0)^(x=infinity)\
&= 1/2 dot.op 0 + 1/4 [(-2e^(-2 dot.op infinity) x - e^(-2 dot.op infinity)) - (-2e^(-2 dot.op 0) x - e^(-2 dot.op 0) dot.op 0)] \
&= 0 + 1/4 [(0 - 0) - (0 - 1)] \
&= 1/4 [1] \
&= 1/4 \
$

== $Pr[-2<=X<=2]$

A probabilidade de $X$ estar entre $-2$ e $2$ é dada pela aplicação da CDF de $X$ em $2$ subtraída
da aplicação da CDF de $X$ em $-2$, temos então que:

$
Pr[-2<=X<=2] &= F_X (2) - F_X (-2) \
&= 1 - 1/2 e^(-2 dot.op 2) - 0 \
&= 1 - 1/2 e^(-4)
$

= Resultados

Ao final do desenvolvimento obtivemos a partir do software de computação
numérica Octave os seguintes resultados após desenvolvido o seguinte script:

#raw(read("./questao-5.m"), lang: "matlab", block: true)

O código acima gera o seguinte gráfico como resultado:

#image("./assets/simulacao.svg")

Os valores de média e probabilidade de $X$ estar entre $-2$ e $2$ são simulados
próximos ao valor teórico obtido no desenvolvimento.