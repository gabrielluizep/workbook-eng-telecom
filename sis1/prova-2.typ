#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Atividade avaliativa de Sistemas LIT",
  subtitle: "2º Avaliação de Sinais e Sistemas I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "28/10/2023",
  doc,
)

= Questão 1
Considere um SLIT (Sistema Linear Invariante no Tempo) discreto com resposta ao
impulso dada por $h[n] = a^n u[n]$:

#enum(
  numbering: "a)",
  [O sistema é causal?],
  [O sistema é estável segundo as condições BIBO (Bounded Input - Bounded Output)?],
)

== Resposta

Sim, o sistema é causal, pois $h[n] = 0$ para $n < 0$, issos se dá pela
influência da função degrau multiplicando todo o restante da função, pois
sabemos que:

$
u[n] := cases(0 quad n < 0, 1 quad "c. c.")
$

Por definção um sistema é estável se toda entrada limitada produz uma saída
limitada. Podemos utilizar a seguinte formula para determinar se um sistema é
estável:

$
sum_(k=-oo)^oo |h[k]| < oo
$

Devido a causalidade do sistema $h[n]$, demonstrada anteriormente, podemos
reescrever a equação acima como:

$
sum_(k=0)^oo |h[k]| < oo
$

Substituindo $h[n]$ na equação acima e desconsiderando o degrau unitário, pois
ele implica apenas na causalidade do sistema, obtemos:

$
sum_(k=0)^oo |a^k| < oo
$

Dada a propriedade da multiplicatividade do módulo, podemos fazer a análise do
módulo aplicado a função exponencial:

$
|a^k| = overbrace(|a dot.op a dot.op ... dot.op a|, "k") = overbrace(|a| dot.op |a| dot.op ... dot.op |a|, "k") = |a|^k
$

Portanto, obtemos:

$
sum_(k=0)^oo |a^k| = sum_(k=0)^oo |a|^k
$

Por se tratar de uma série geométrica, para que a série acima seja convergente, $|a| < 1$,
caso contrário a série divergiria. Considerando $|a| < 1$, o sistema seria
estável segundo as condições BIBO.

$
sum_(k=0)^oo |a|^k = 1/(1 - |a|) < oo\
$

= Questão 2
A entrada $x(t)$ e a resposta ao impulso $h(t)$ de um sistema contínuo, linear e
invariante no tempo são:

$
x(t) &= u(t)\
h(t) &= e^(-t) u(t)
$

#enum(
  numbering: "a)",
  [Determine a resposta de estado nulo do sistema. Nessa questão não é permitido o
    uso da tabela.],
  [O sistema é estável segundo as condições BIBO (Bounded Input - Bounded Output)?],
)

== Resposta

Para Obtermos a resposta de estado nulo do sistema, devemos realizar a
convolução entre a entrada e a resposta ao impulso do sistema:

$
y(t) = integral_(-oo)^oo x(tau) h(t - tau) dif tau
$

Substituindo $x(t)$ e $h(t)$ na equação acima, obtemos:

$
y(t) = integral_(-oo)^oo u(tau) e^(-t + tau) u(t - tau) dif tau
$

Podemos reescrever a equação acima como:

$
y(t) = integral_(0)^t e^(-t + tau) dif tau
$

Resolvendo a integral acima, obtemos o estado nulo do sistema:

$
y(t) &= integral_(0)^t e^(-t + tau) dif tau\
&= integral_(0)^t e^(-t) e^(tau) dif tau\
&= e^(-t) integral_(0)^t e^(tau) dif tau\
&= e^(-t) (e^(tau))|_(0)^t\
&= e^(-t) (e^(t) - e^(0))\
&= e^(-t) (e^(t) - 1)\
&= e^(-t + t) - e^(-t)\
&= 1 - e^(-t)

$

Para definir se o sistema é estável podemos utilizar a seguinte fórmula:

$
integral_(-oo)^oo |h(tau)| dif tau < oo\
$

Então:

$
integral_(0)^oo e^(-tau) dif tau
= -e^(-tau)|_(0)^oo
= -e^(-oo) + e^(0)
= -0 + 1
= 1
$

Portanto, o sistema é estável segundo as condições BIBO.

$
integral_(-oo)^oo e^(-t) dif t < oo\
$

= Questão 3
Um sistema discreto e invariante no tempo tem a resposta ao impulso $h[n]$ desenhada
na figura a seguir. Determine a resposta de estado nulo do sistema.

#image("./assets/p2q3.png", width: 80%)

Determine a saída $y[n]$ do sistema partindo do princípio que o sistema é linear
e invariante, e as entradas são?

#enum(
  numbering: "a)",
  [$x_1[n] = 3 delta[n] - 2 delta[n-1]$],
  [$x_2[n]$ está expresso na figura a seguir],
)

#image("./assets/p2q3-2.png", width: 80%)

== Resposta
Para definirmos a resposta em estado nulo do sistema calculamos a seguinte
convolução:

$
y[n] = h[n] convolve x[n]
$

Para poder aplicar a formula acima precisamos definir $h[n]$ a partir da imagem
apresentada, podemos fazer essa representação por uma soma de impulsos para onde
o valor de $h[n]$ é diferente de 0, portanto:

$
h[n] = 1 delta[n+1] + 3 delta[n] + 2 delta[n-1] - 1 delta[n-2] + 1 delta[n-3]
$

Sabendo que o resultado de uma função qualquer convolvida com o impulso é igual
a propria função e sabendo que a existencia de um deslocamento no impulso
reflete no deslocamento na função que está sendo convolvida:

$
delta[n - N_0] convolve f[n] = f[n-N_0]
$

Podemos resolver a convolução aplicando:

$
y_1[n] &= h[n] convolve x_1[n] \
&= (3 delta[n] - 2 delta[n-1]) convolve x_1[n]\
&= 3 delta[n] convolve x_1[n] - 2 delta[n-1] convolve x_1[n]\
&= 3 x_1[n] - 2 x_1[n-1]\
&= (3 delta[n+1] + 9 delta[n] + 6 delta[n-1] - 3 delta[n-2] + 3 delta[n-3]) -\
&quad (2 delta[n] + 6 delta[n-1] + 4 delta[n-2] - 2 delta[n-3] + 2 delta[n-4]) \
&= 3delta[n+1] + 7 delta[n] - 7delta[n-2] + 7delta[n-3]-2delta[n-4]
$

Para $x_2[n]$ precisamos definir a função a partir da figura, da mesma maneira
que fizemos com $h[n]$ utilizando a soma de impulsos:

$
x_2[n] = -1delta[n+2] +2delta[n] +2delta[n-3]
$

Aplicamos a mesma propriedade do impulso para resolver a convolução e obter a
resposta de estado nulo:

$
y_2[n] &= h[n] convolve x_2[n]\
&= (3 delta[n] - 2 delta[n-1]) convolve x_2[n]\
&= 3 delta[n] convolve x_1[n] - 2 delta[n-1] convolve x_2[n]\
&= 3 (-1delta[n+2] +2delta[n] +2delta[n-3]) - 2(-1delta[n+2] +2delta[n] +2delta[n-3])\
&= -3delta[n+2]+6delta[n]+ 6 delta[n-3]+\
&quad 2delta[n+2]-4delta[n]-4delta[n-3]\
&= -1delta[n+2]+2delta[n]+2delta[n-3]
$

= Questão 4
Para uma entrada degrau unitário, determine a resposta total dos seguintes
sistemas LIT (Lineares Invariantes no Tempo):

== Primeiro sistema

$
(dif^2 y(t))/(dif t^2) + 5(dif y(t))/(dif t) + 6y(t) = (dif x(t))/(dif t)\ y_0(0)
= 0 ;quad (dif y_0(0))/(dif t) = -2
$

=== Resposta

Para facil leitura e manipulação podemos reescrever o sistema utilizando a
notação do operador $D$:

$
D^2 y(t) + 5D y(t) + 6y(t) = D x(t)\
(D^2 + 5D + 6)y(t) = D x(t)
$

Para definir a resposta de entrada nula do sistema $y_0(t)$ observamos a função
do operador $D$, que multiplica a função $y(t)$ em questão, como uma função de
segundo grau onde as raizes são os modos caracterísiticos:

$
D^2 + 5D + 6\ arrow.b.double \
lambda^2 + 5 lambda + 6 = 0 \
(lambda+3) (lambda+2) = 0 \ therefore \
lambda_1 = -3 quad lambda_2 = -2
$

A partir dos modos característicos, observando que possuo $lambda_i$ distintos
monto a equação característica:

$
y_0(t) = c_1 e^(lambda_1 t) + c_2 e^(lambda_2 t) + ... + c_n e^(lambda_n t)
$

Substituindo com a informação obtida temos que:

$
y_0(t) = c_1 e^(-3 t) + c_2 e^(-2 t)
$

Para solucionar a equação resta descobrir os valores das constantes, para isso
utilizamos os valores de $y_0(0)=0$ e $D y_0(0)=-2$ dado no enunciado. Primeiro
calculamos a primeira derivada da função $y_0$ obtida:

$
D y_0(t) &= D(c_1 e^(-3 t) + c_2 e^(-2 t))\
&= D(c_1 e^(-3 t)) + D(c_2 e^(-2 t))\
&= -3 c_1 e^(-3 t) - 2 c_2 e^(-2 t)
$

Substituimos então para os valores que possuimos:

$
y_0(0) &= c_1 e^(0) + c_2 e^(0) = 0\
&= c_1 + c_2 = 0
$

$
D y_0(0) &= -3 c_1 e^(0) - 2 c_2 e^(0) = -2\
&= -3 c_1 - 2 c_2 = -2
$

Montando o sistema linear para descobrir o valor destas constantes obtemos:

$
&cases(c_1 + c_2 = 0, -3 c_1 - 2 c_2 = -2)\

&c_1 = c_2\
&-3c_1 -2 c_1 = -2\
&-5c_1 = -2
&c_1=c_2 = 2/5
$

Por fim definimos nossa resposta de entrada nula como:

$
y_0(t) = 2/5 e^(-3 t) + c_2 e^(-2 t)
$

== Segundo sistema

$
(dif^2 y(t))/(dif t^2) + 4(dif y(t))/(dif t) + 4y(t) = (dif x(t))/(dif t)\ y_0(0)
= 1 ;quad (dif y_0(0))/(dif t) = 2
$

=== Resposta

Para facil leitura e manipulação podemos reescrever o sistema utilizando a
notação do operador $D$:

$
D^2 y(t) + 4D y(t) + 4y(t) = D x(t)\
$

Para definir a resposta de entrada nula do sistema $y_0(t)$ observamos a função
do operador $D$, que multiplica a função $y(t)$ em questão, como uma função de
segundo grau onde as raizes são os modos caracterísiticos:

$
D^2 + 4D + 4\ arrow.b.double \
lambda^2 + 4 lambda + 4 = 0 \
(lambda+2)^2 = 0 \ therefore \
lambda = -2
$

A partir dos modos característicos, observando que possuo apenas um $lambda$ portanto
monto a equação característica:

$
y_0(t) = c e^(lambda t)
y_0(t) = c e^(-2 t)
$

Para solucionar a equação resta descobrir os valores das constantes, para isso
utilizamos os valores de $y_0(0)=1$ e $D y_0(0)=2$ dado no enunciado. Primeiro
calculamos a primeira derivada da função $y_0$ obtida:

$
D y_0(t) &= D(c e^(-2 t))\
&= D(c e^(-2 t))\
&= -2 c e^(-2 t)
$

Substituimos então para os valores que possuimos:

$
y_0(0) &= c e^(0) = 1\
&arrow.r.double c = 1
$

$
D y_0(0) &= -2 c e^(-2 t) = 2\
&= -2c = -2\
&arrow.r.double c = 1
$

Como há apenas uma constante e a substituição pelo valor informado no enunciado
já demonstrou a constante podemos montar diretamente a resposta de entrada nula:

$
y_0(t) = e^(-2t)
$

== Terceiro sistema

$
(dif^2 y(t))/(dif t^2) + 4(dif y(t))/(dif t) + 40y(t) = (dif x(t))/(dif t)\ y_0(0)
= 2 ;quad (dif y_0(0))/(dif t) = 10
$

=== Resposta

Para facil leitura e manipulação podemos reescrever o sistema utilizando a
notação do operador $D$:

$
D^2 y(t) + 4D y(t) + 40y(t) = D x(t)\
$

Para definir a resposta de entrada nula do sistema $y_0(t)$ observamos a função
do operador $D$, que multiplica a função $y(t)$ em questão, como uma função de
segundo grau onde as raizes são os modos caracterísiticos:

$
D^2 + 4D + 40\ arrow.b.double \
lambda^2 + 4 lambda + 40 = 0\
$

Extraio as informações para aplicar a fórmula quadrática $a=1, b=4, c=40$:

$
lambda &= (-b plus.minus sqrt(b^2 - 4 a c))/(2a)\
&= (-4 plus.minus sqrt((-4)^2 - 4 dot.op 1 dot.op 40))/(2 dot.op 1)\
&= (-4 plus.minus sqrt(16 - 160))/2\
&= (-4 plus.minus sqrt(-144))/2\
&= -2 plus.minus (12 j)/2\
&= -2 plus.minus 6j\
therefore &lambda_1 = -2 + 6j\ & lambda_2 =-2-6j
$

A partir dos modos característicos, observando que possuo $lambda_i$ distintos e
complexos, a partir disso monto a equação característica:

$
y_0(t) = c e^(alpha t) cos(beta t + theta)
$

Substituindo com a informação obtida temos que:

$
y_0(t) = c e^(-2 t)cos(6t + theta)
$

Fazendo $t=0$ e substituindo as condições iniciais, temos:

$
y_0(0) &= c e^(0) cos(6*0 + theta) = 2\
&= c cos(theta) = 2
$

Para solucionar a equação resta descobrir os valores das constantes, para isso
utilizamos os valores de $y_0(0)=2$ e $D y_0(0)=10$ dado no enunciado. Primeiro
calculamos a primeira derivada da função $y_0$ obtida:

$
D y_0(t) &= D(c e^(-2 t)cos(6t + theta)) \
&= -2 c e^(-2t)(3 sin(6t + theta) + cos(6t + theta))
$

Fazendo $t=0$ e substituindo as condições iniciais, temos:
$
D y_0(0) &= -2 c e^(0)(3 sin(0 + theta) + cos(0 + theta)) = 10\
&= -2 c (3 sin(theta) + cos(theta)) = 10\
&= 3 c sin(theta) + c cos(theta) = -5\
$

Montando o sistema linear para descobrir o valor destas constantes obtemos:

$
cases(c cos(theta) = 2, 3 c sin(theta) + c cos(theta) = -5)\

&3c sin(theta) + 2 = -5\
&3c sin(theta) = -7\
&c sin(theta) = -7/3\
&c cos(theta) = 2\
$

Fazendo o quadrado e somando os dois lados, temos:

$
c^2 = 2^2 + (-7/3)^2\
c^2 = 4 + 49/9\
c^2 = 85/9\
c = sqrt(85)/3 = 9.22/3 = 3.07
$

Em seguida,

$
(c sin(theta))/(c cos(theta)) = (-7/3)/(2) = -7/6 \
$

Resolvendo, temos:

$
theta = arctan(-7/6) = -0.86
$

Logo:

$
y_0(t) = 3.07 e^(-2 t)cos(6t - 0.86)
$

== Quarto sistema

$
y[n+2] + y[n+1] + 0.16y[n] = 5x[n]\ y[-1] = 0; quad y[-2] = 1/4
$

=== Resposta

Para facil leitura e manipulação podemos reescrever o sistema utilizando a
notação do operador de avanço $E$:

$
E^2 y[n] + E y[n] + 0.16y[n] = 5x[n]
$

Descubro os modos característicos:

$
E^2 + E + 0.16 = 0\
gamma^2 + gamma + 0.16 = 0\
(x+0.2)(x+0.8) = 0\
therefore &gamma_1 = -0.2\ & gamma_2 = -0.8
$

A partir dos modos característicos, observando que possuo $gamma_i$ distintos
monto a equação característica:

$
y_0[n] = c_1 gamma_1^n + c_2 gamma_2^n
$

Substituindo com a informação obtida temos que:

$
y_0[n] = c_1 (-0.2)^n + c_2 (-0.8)^n
$

Para solucionar a equação resta descobrir os valores das constantes, para isso
utilizamos os valores de $y_0[-1]=0$ e $y_0[-2]=1/4$ dado no enunciado:

$
y_0[-2] &= c_1 (-0.2)^(-2) + c_2 (-0.8)^(-2) = 1/4\
&= c_1(-1/5)^(-2) + c_2(-4/5)^(-2) = 1/4\
&= c_1(-5)^(2) + c_2(-5/4)^(2) = 1/4\
&= c_1(25) + c_2(25/16) = 1/4\
$

$
y_0[-1] &= c_1 (-0.2)^(-1) + c_2 (-0.8)^(-1) = 0\
&= c_1 (-1/5)^(-1) + c_2 (-4/5)^(-1) = 0\
&= c_1 (-5) + c_2 (-5/4) = 0\
$

Montando o sistema linear para descobrir o valor destas constantes obtemos:

$
cases(c_1(25) + c_2(25/16) = 1/4, c_1 (-5) + c_2 (-5/4) = 0)\

&c_1 = 1/125\
&c_2 = 4/125
$

Substituindo os valores obtidos na resposta de entrada nula:

$
y_0[n] = (1/125 (-0.2)^n + 4/125 (-0.8)^n)u[n]
$

== Quinto sistema

$
y[n+2] + 1.6y[n+1] + 0.64y[n] = 5x[n]\ y[-1] = 1; quad y[-2] = 2
$

=== Resposta

Para facil leitura e manipulação podemos reescrever o sistema utilizando a
notação do operador de avanço $E$:

$
E^2 y[n] + 1.6E y[n] + 0.64y[n] = 5x[n]
$

Encontramos os modos característicos:

$
E^2 + 1.6E + 0.64 = 0\
gamma^2 + 1.6 gamma + 0.64 = 0\
(x+0.8)^2 = 0\

&gamma = -0.8\
$

A partir dos modos característicos, observando que possuo apenas uma raiz
descubro a equação característica:

$
y_0[n] = c gamma^n
$

Substituindo com a informação obtida temos que:

$
y_0[n] = c (-0.8)^n
$

Aplicando as condições iniciais:

$
y_0[-1] &= c (-0.8)^(-1) = 1\
&= c (-5/4) = 1\
&& c = -4/5\
$

Portanto temos a resposta de entrada nula como:

$
y_0[n] = (-4/5 (-0.8)^n)u[n]
$

== Sexto sistema

$
y[n+2] - 1.56y[n+1] + 0.81y[n] = 5x[n]\ y[-1] = 1; quad y[-2] = 3
$

=== Resposta

Para facil leitura e manipulação podemos reescrever o sistema utilizando a
notação do operador de avanço $E$:

$
E^2 y[n] - 1.56E y[n] + 0.81y[n] = 5x[n]
$

Encontramos os modos característicos:

$
E^2 - 1.56E + 0.81 = 0\
gamma^2 - 1.56 gamma + 0.81 = 0\ \

a= 1, b= -1.56, c= 0.81\ \

gamma = (-b plus.minus sqrt(b^2 - 4 a c))/(2a)\
= (1.56 plus.minus sqrt((-1.56)^2 - 4 dot.op 1 dot.op 0.81))/(2 dot.op 1)\
= (1.56 plus.minus sqrt(2.4336 - 3.24))/2\
= (1.56 plus.minus sqrt(-0.8064))/2\
= 0.78 plus.minus (0.9 j)/2\
= 0.78 plus.minus 0.45j\

therefore &gamma_1 = 0.78 + 0.45j\ & gamma_2 = 0.78 - 0.45j
$

Obtida as raizes, transformamos na forma polar, portanto temos que $gamma = 0.9e^(plus.minus j(pi/6))$.

Montamos a equação característica, dado que possuo raizes complexas:

$
y_0[n] &= c abs(gamma)^(n) cos(beta n + theta) \
&= c (0.9)^n cos((pi/6) n + theta)
$

Aplicando os valores iniciais informados:

$
y[-1] &= c (0.9)^(-1) cos((pi/6) (-1) + theta) = 1\
&= c (10/9) cos(-pi/6 + theta) = 1\
&= c (10/9) (cos(-pi/6) cos(theta) - sin(-pi/6) sin(theta)) = 1\
&= c (10/9) (sqrt(3)/2 cos(theta) + 1/2 sin(theta)) = 1\
$

$
y[-2] &= c (0.9)^(-2) cos((pi/6) (-2) + theta) = 3\
&= c (100/81) cos(-pi/3 + theta) = 3\
&= c (100/81) (cos(-pi/3) cos(theta) - sin(-pi/3) sin(theta)) = 3\
&= c (100/81) (1/2 cos(theta) + sqrt(3)/2 sin(theta)) = 3\
$

Resolvendo, temos:

$
c cos(theta) = 2.308 \ c sin(theta) = 0.397
$

Logo:

$
tan(theta) = -0.172 \
theta = -0.17
$

Para descobrir $c$ substituimos em uma das equações:

$
c cos(theta) &= 2.308 \
c cos(-0.17) &= 2.308 \
&= 2.308/cos(-0.17) \
&= 2.308/0.985 \
&= 2.34
$

Subsitituindo as informações temos a resposta de entrada nula:

$
y_0[n] = (2.34 (0.9)^n cos((pi/6) n - 0.17))u[n]
$