#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Revisão de Sinais e Sistemas",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "18 de Março de 2024",
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
&+ j [sin((2 pi n)/3) cos((2 pi N)/3) + sin((2 pi N)/3) cos((2 pi n)/3)] \
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

Dado que $y[n] = x[-2n-4]$, podemos fazer o deslocamento do sinal $x[n]$ para a direita em 4 unidades, após isso espelhar o sinal em relação ao eixo das ordenadas e por fim comprimir o sinal pegando os valores a cada 2 unidades.

#figure(
  image("./assets/r1-etapas-transposicao-argumento.png"),
  caption: [Etapas para  transposição de argumento],
  supplement: "Figura"
);


#pagebreak()

= Questão 3 

Determine se o sistema

$
y[n] = n x[n+3] 
$

é causal, invariante no deslocamento e linear.

#line()

Relembrando as definições de causalidade, invariância no deslocamento e linearidade:

- Um sistema é causal se a saída $y[n]$ depende apenas de valores de $x[n]$ para $n <= n_0$.

- Um sistema é invariante no deslocamento dada uma entrada $x[n]$ e uma saída $y[n]$, se a saída $y[n-n_0]$ é a saída do sistema para a entrada $x[n-n_0]$.

- Um sistema é linear se satisfaz as propriedades de aditividade e homogeneidade.

== Causalidade

Para verificar a causalidade do sistema, podemos analisar a saída $y[n]$ para $n < 0$.

$
y[-1] = -1 x[2] \ 
$

Como verificamos acima, a saída $y[-1]$ depende do valor de $x[2]$, o que implica que #underline()[o sistema não é causal].

== Invariância no deslocamento

Para verificar a invariância no deslocamento, podemos aplicar a entrada $x[n-n_0]$ e verificar se a saída $y[n-n_0]$ é a saída do sistema para a entrada $x[n-n_0]$.

$
y[n] = n x[(n-n_0)+3] \ 
!= \
y[n-n_0] = (n-n_0)x[(n-n_0)+3] \
$

Como verificamos acima, ao aplicarmos um deslocamento na entrada $x[n]$, a saída não sofre uma alteração em sua amplitude como é esperado, o que implica que #underline()[o sistema não é invariante no deslocamento].

== Linearidade

Para que o sistema seja linear, devemos ter que:

$
y_1[n] &= n x_1[n+3] \
y_2[n] &= n x_2[n+3] \ \
y[n] &= y_1[n] + y_2[n] \
&= n x_1[n] + n x_2[n] \
&= n (x_1[n] + x_2[n]) \
$

Portanto verificamos que o #underline()[sistema é linear].

#pagebreak()

= Questão 4

Um sistema linear invariante ao deslocamento tem a seguinte resposta ao impulo

$
h[n] = u[n]
$

Encontre, usando a soma de convolução, a saída se a entrada for

$
x[n] = (1/3)^n u[n]
$

#line()

A soma de convolução é dada por

$
y[n] = sum_(k=-oo)^oo x[k] h[n-k]
$

Ou seja:

$
y[n] &= sum_(k=-oo)^oo (1/3)^k u[k] u[n-k] \
&= sum_(k=0)^oo (1/3)^k u[n-k] \
&= sum_(k=0)^n (1/3)^k \
$

Com esta soma geométrica finita podemos aplica a fórmula:

$
sum_(k=0)^n q^k = (1 - q^(n+1))/(1 - q)
$

Portanto temos que

$
y[n] &= (1 - (1/3)^(n+1))/(1 - 1/3)\
$

#pagebreak()

= Questão 5

Considere a sequência de tempo discreto

$
x[n] = cos((n pi)/2)
$ 

Encontre dois sinais diferentes de tempo contínuo que produzem essa sequência quando são amostrados com uma frequência de $f_s = 5000 "Hz"$.

#line()

$
x[n] &= x_c (n T_s) \
&= cos((n pi)/2 f_c T_s) \
&= cos((n pi)/2 f_c/f_s ) \
&= cos((n pi)/2 f_c/f_s + 2 k pi n) quad forall k in ZZ\
&= cos(2 pi (f_c/f_s + k) n)
$

Portanto temos que

$
2 pi (f_c /f_s + k) &= pi/2 \
f_c /f_s + k &= 1/4 \
f_c/f_s &= 1/4 - k \
$

Assim, temos que para qualquer valor inteiro de $k$, obtemos um sinal contínuo que ao ser amostrado com uma frequência de $f_s = 5000 "Hz"$, produz a sequência $x[n] = cos((n pi)/2)$.

#pagebreak()

= Questão 6

Um filtro digital, implementado em um circuito integrado DSP (_Digital Signal Processing_), é descrito pela equação de diferença linear com coeficientes constantes:

$
y[n] = x[n] - 3y[n-1] - 2y[n-2]
$

Para analisar o desempenho do filtro, mede-se a resposta a entrada $delta[n]$. Entretanto, antes da aplicação da entrada, os registradores internos de armazenamento não são zerados. Assim, a saída do filtro inclui o efeito das condições iniciais, que são $y[-1] = 1$ e $y[-2] = 1$.

Determine a resposta do filtro para $n >= 0$.

#line()

$
&y[n] = delta[n] - 3y[n-1] - 2y[n-2] \
&arrow.t.b.double cal(Z) \
&Y[z] = 1 - 3(z^(-1) Y[n]+1) - 2(z^(-2) Y[n] + z^(-1) + 1) \
&Y[z] = 1 - 3z^(-1) Y[n] - 3 - 2z^(-2) Y[n] - 2z^(-1) - 2 \
&Y[z] + 3z^(-1) Y[n] + 2z^(-2) Y[n]  = -2z^(-1) - 4 \
&Y[z] (1 + 3z^(-1) + 2z^(-2)) = -2z^(-1) - 4 \
&Y[z] = (-2z^(-1) - 4)/(1 + 3z^(-1) + 2z^(-2)) \
&Y[z] = (-4z^2 - 2z)/(z^2 + 3z + 2) \
&Y[z]/z = (-4z - 2)/(z^2 + 3z + 2) \

&= A/(z+2) + B/(z+1) \
&= -6/(z+2) + 2/(z+1) \
&arrow.t.b.double cal(Z)^(-1) \
&y[n] = -6(-2)^n u[n] + 2(-1)^n u[n] \
$

#pagebreak()

= Questão 7

Considere a seguinte transformada $cal(Z)$

$
X[z] = z/(z-0.1) + z/(z-0.2) + z/(z-0.3)
$

Calcule a transformada $cal(Z)$ inversa para as seguintes regiões de convergência:

#figure(
  image("./assets/r1-zonas-convergencia.png", width: 50%),
  caption: [Zonas de convergência],
  supplement: "Figura",
);


#line()

== Primeira zona de convergência $|z| <= 0,1$

$
x[n] = (0.1^n + 0.2^n + 0.3^n) u[-n-1]
$

== Segunda zona de convergência $|z| >= 0,3$

$
x[n] = (0.1^n + 0.2^n + 0.3^n) u[n]
$

== Terceira zona de convergência $0,1 < |z| < 0,2$

$
x[n] = (0,1)^n u[n] - (0,2^n + 0,3^n) u[-n-1]
$

== Quarta zona de convergência $0,2 < |z| < 0,3$

$
x[n] = (0,1^n + 0,2^n) u[n] - 0,3^n u[-n-1]
$
