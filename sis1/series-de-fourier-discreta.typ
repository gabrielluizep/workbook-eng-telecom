#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Série de Fourier de Tempo Discreto",
  subtitle: "Sinais e Sistemas I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "10 de Dezembro de 2023",
  doc,
)

= Formulário

Série de Fourier de tempo discreto
$
x[n] &= sum_(k=<N>) a_k e^(j k omega_0 n) \
a_k &= 1 / N sum_(k=<N>) x[n] e^(-j k omega_0 n)\
omega_0 &= (2 pi) / N \
$

Progressão geométrica finita
$
S_n = sum_(k=0)^n a r^k = a (1 - r^(n+1)) / (1 - r) \
$

= Questões

== a
#image("./assets/discrete-fourier-series-a.png"),

$
N &= 7 \
omega_0 &= (2 pi) / N = (2 pi) / 7\
$
\
$
a_k &= 1 / N sum_(n=<N>) x[n] e^(-j k omega_0 n) \
&= 1 / 7 sum_(n=0)^6 x[n] e^(-j k omega_0 n) \
&= 1 / 7 sum_(n=0)^4 e^(-j k omega_0 n) \
&= 1 / 7 sum_(n=0)^4 (e^(-j k omega_0))^n quad; a= 1; r = e^(-j k omega_0); n = 4\
&= 1/7 ((1 - r^(n+1)) / (1 - r))\
&= 1/7 ((1 - e^(-j 5 k omega_0) ) / (1 - e^(-j k omega_0)))\

$
\
$
x[n] &= sum_(k=<N>) a_k e^(j k omega_0 n) \
&= sum_(k=<N>) (1/7 ((1 - e^(-j 5 k omega_0) ) / (1 - e^(-j k omega_0)))) e^(j k omega_0 n) \
$

\ \

== b
#image("./assets/discrete-fourier-series-b.png")

$
N = 6 \
omega_0 = (2 pi) / N = (2 pi) / 6 = pi /3\
$
\
$
a_k &= 1 / N sum_(n=<N>) x[n] e^(-j k omega_0 n) \
&= 1 / 6 sum_(n=0)^5 x[n] e^(-j k omega_0 n) \
&= 1 / 6 sum_(n=0)^3 e^(-j k omega_0 n)\
&= 1 / 6 sum_(n=0)^3 (e^(-j k omega_0))^n quad; a= 1; r = e^(-j k omega_0); n = 3\
&= 1/6 ((1 - r^(n+1)) / (1 - r))\
&= 1/6 ((1 - e^(-j 4 k omega_0) ) / (1 - e^(-j k omega_0)))\
$
\
$
x[n]&= sum_(k=<N>) a_k e^(j k omega_0 n) \
&= sum_(k=0)^6 (1/6 ((1 - e^(-j 4 k omega_0) ) / (1 - e^(-j k omega_0)))) e^(j k omega_0 n) \
$

== c

#image("./assets/discrete-fourier-series-c.png")

$
N &= 6 \
omega_0 &= (2 pi) / N = (2 pi) / 6 = pi/3\
$
\
$
#table(
  columns: 12,
  rows: 2,
  [n],[...],[-4],[-3],[-2],[-1],[0],[1],[2],[3],[4],[...],
  [x[n]],[...],[-1],[0],[-1],[2],[1],[2],[-1],[0],[-1],[...]
)
$
\
$
a_k &= 1 / N sum_(n=<N>) x[n] e^(-j k omega_0 n) \
&= 1 / 6 sum_(n=0)^5 x[n] e^(-j k omega_0 n) \
&= 1 / 6 (x[0] + x[1] e^(-j k omega_0) + x[2] e^(-j 2 k omega_0) \ &+ x[3] e^(-j 3 k omega_0) + x[4] e^(-j 4 k omega_0) + x[5] e^(-j 5 k omega_0))\
&= 1 / 6 (1 + 2 e^(-j k omega_0) - e^(-j 2 k omega_0) - e^(-j 4 k omega_0) + 2 e^(-j 5 k omega_0))
$
\
$
x[n] &= sum_(k=<N>) a_k e^(j k omega_0 n) \
&= sum_(k=0)^6 (1 / 6 (1 + 2 e^(-j k omega_0) - e^(-j 2 k omega_0) - e^(-j 4 k omega_0) + 2 e^(-j 5 k omega_0))) e^(j k omega_0 n) \
$