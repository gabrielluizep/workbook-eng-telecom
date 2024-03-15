#import "@preview/ifsc-sj-articled:0.1.0": article

#show: doc => article(
  title: "Prova 1",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "13 de Setembro de 2023",
  doc,
)


= Questão 1

Determine se os sinais abaixo são periódicos e em caso positivo, determine o período fundamental.

#line()

== $x[n] = cos((2 pi n)/3)$

$
cos((2 pi n)/3) 
&= cos((2 pi (n + N))/3) \
&= cos((2 pi n)/3 + (2 pi N)/3) \
$

Utilizando a identidade trigonométrica

$
cos(A + B) = cos(A) cos(B) - sin(A) sin(B)
$

Temos que

$
cos((2 pi n)/3) 
&= cos((2 pi n)/3) cos((2 pi N)/3) - sin((2 pi n)/3) sin((2 pi N)/3) \
$

Para que essa equação seja verdadeira, temos que

$
cos((2 pi N)/3) = 1 quad "e" quad sin((2 pi N)/3) = 0
$

O que implica que

$
(2 pi N)/3 &= 2 pi k quad "para" k in ZZ \
N &= (2 pi)/(2 pi) 3 k \ \
therefore N &= 3 k
$

O que implica que o sinal é periódico com período fundamental $N = 3$.

#pagebreak()

== $x[n] = sin((2n)/3 + pi/4)$

Podemos reescrever o argumento da função seno como uma única fração
$
sin((2n)/3 + pi/4) = sin((8n+3pi)/12)
$

Desta maneira podemos validar a periodicidade do sinal

$
sin((8n+3pi)/12)
&= sin((8(n+N)+3pi)/12) \
&= sin((8n+8N+3pi)/12) \
&= sin((8n+3pi)/12 + (8N)/12) \
$

Utilizando a identidade trigonométrica

$
sin(A + B) = sin(A) cos(B) + sin(B) cos(A)
$

Temos que

$
sin((8n+3pi)/12)
&= sin((8n+3pi)/12) cos((8N)/12) + sin((8N)/12) cos((8n+3pi)/12) \
$

Para que essa equação seja verdadeira, temos que

$
sin((8N)/12) = 0 quad "e" quad cos((8N)/12) = 1
$

O que implica que

$
(8N)/12 &= 2 pi k quad "para" k in ZZ \
N &= (2 pi k 12)/8 \
N &= (24 pi k)/8 \
therefore N &= (3 pi k)
$

Como não exiteste um valor inteiro que $k$ possa assumir para que $N$ seja um número inteiro, o sinal não é periódico.

#pagebreak()

== $x[n] = e^(j (2 pi n)/3)$

Utilizando a identidade de Euler

$
e^(j theta) = cos(theta) + j sin(theta)
$

Portanto temos que

$
e^(j (2 pi n)/3) = cos((2 pi n)/3) + j sin((2 pi n)/3)
$

Podemos então verificar a periodicidade do sinal

$
cos((2 pi n)/3) + j sin((2 pi n)/3)
&= cos((2 pi (n+N))/3) + j sin((2 pi (n+N))/3) \
&= cos((2 pi n)/3 + (2 pi N)/3) + j sin((2 pi n)/3 + (2 pi N)/3) \
$

Utilizando as identidades trigonométricas

$
cos(A + B) = cos(A) cos(B) - sin(A) sin(B) \
sin(A + B) = sin(A) cos(B) + sin(B) cos(A)
$

Temos que

$
cos((2 pi n)/3) + j sin((2 pi n)/3)
&= [cos((2 pi n)/3) cos((2 pi N)/3) - sin((2 pi n)/3) sin((2 pi N)/3)]\ 
&+ j (sin((2 pi n)/3) cos((2 pi N)/3) + sin((2 pi N)/3) cos((2 pi n)/3)) \
$

Para que essa equação seja verdadeira, temos que

$
cos((2 pi N)/3) = 1 quad "e" quad sin
((2 pi N)/3) = 0
$

O que implica que

$
(2 pi N)/3 &= 2 pi k quad "para" k in ZZ \
N &= (2 pi)/(2 pi) 3 k \ \
therefore N &= 3 k
$

O que implica que o sinal é periódico com período fundamental $N = 3$.

#pagebreak()

= Questão 2

Dada a sequência

$
x[n] = (2-n){u[n] - u[n-4]}
$

Faça o gráfico de $y[n] = x[-2n-4]$, sendo $u[n]$ a função degrau unitário (Heaviside).

#line()

Analisando a sequência $x[n]$, identificamos que ela é composta por duas funções, uma sendo uma reta decrescente que cruza o eixo das abscissas no ponto $n = 2$ e outra sendo um janelamento onde possui valor 1 entre $n = 0$ e $n = 3$, e 0 para os demais valores de $n$. Considerando que $x[n]$ é uma multiplicação entre essas duas funções, identificamos que ela possui valor $(2n-1)$ para $0 < n < 3$ e 0 para os demais valores. 

$
x[n] = cases(2n-1 ", " 0 < n < 3, 0 ", caso contrário" )
$

Dado que $y[n] = x[-2n-4]$, podemos fazer o deslocamento do sinal $x[n]$ para a direita