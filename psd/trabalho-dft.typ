#import "@preview/codelst:2.0.1": sourcecode

#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(font: "FreeSans")

#show: doc => report(
  title: [Transformada de Fourier Discreta],
  subtitle: [Processamento de Sinais Digitais],
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: [18 de Março de 2024],
  doc,
)

= Questão 1

As duas sequências de oito pontos $x_1[n]$ e $x_2[n]$ mostradas na figura a seguir tem _DFT's_ $X_1[k]$ e $X_2[k]$, respectivamente. Determine a relação entre $X_1[k]$ e $X_2[k]$.

#figure(
  image("./assets/dft-1.png", width: 60%),
  caption: [Definições de $x_1[n]$ e $x_2[n]$],
  supplement: "Figura"
);

== Reposta

Ao compararmos os dois gráficos percebemos que a sequência $x_2[n]$ é a sequência $x_1[n]$ deslocada de 4 posições para a direita, analisamos também um janelamento de 8 pontos $[0, 7]$.

Obtendo a expressão de $x_1[n]$ e $x_2[n]$ em função dos impulsos unitários $delta[n]$:

$
x_1[n] &= delta[n-1] + 2 delta[n-2] + 3 delta[n-3] + 2 delta[n-4] + delta[n-5] \
x_2[n] &= 2 delta[n] + delta[n-1] + delta[n-5] + 2 delta[n-6] + 3 delta[n-7]
$

Portanto podemos reescrever $X_2[k]$ em função de $X_1[k]$:

$
X_2[k] = X_1[k] e^(-j (2 pi)/(8)4 k) 
$

== Simulação

Utilizando a linguagem de programação python, podemos simular a relação entre $X_1[k]$ e $X_2[k]$.

#sourcecode[```python	
  n = np.arange(0, 8)  # Gera um vetor de 0 a 7

  x1_n = [0, 1, 2, 3, 2, 1, 0, 0]  # Definição de x1[n]
  x2_n = [2, 1, 0, 0, 0, 1, 2, 3]  # Definição de x2[n]

  X1_k = fft(x1_n) * (
      np.e ** (-1j * 2 * np.pi / 8 * 4 * n)
  )  # Calcula a FFT de x1[n] e realiza deslocamento de 4

  x2_hat_n = ifft(X1_k)  # Calcula a IFFT
```]

Onde $hat(x)_2[n]$ é a sequência $x_2[n]$ reconstruída a partir de $X_1[k]$.

#figure(
  image("./assets/dft-r1.png", width: 80%),
  caption: [Plot de $x_1[n]$, $x_2[n]$ e $hat(x)_2[n]$] ,
  supplement: "Figura"
);

Verificamos que como esperado $hat(x)_2[n]$ é igual a $x_2[n]$.

#pagebreak()

= Questão 2

Suponha que temos duas sequências de quatro pontos $x[n]$ e $h[n]$, da seguinte forma:

$
x[n] &= cos((pi n)/2) quad quad &n = 0, 1, 2, 3 \

\

h[n] &= 2^n quad quad &n = 0, 1, 2, 3
$

Portanto temos:

#set enum(numbering: "a )")
+ Calcule a _DFT_ de quatro pontos $X[k]$.
+ Calcule a _DFT_ de quatro pontos $H[k]$.
+ Calcule $y[n] = x[n] ast.circle_4 h[n]$ (realizando a convolução circular diretamente).
+ Calcule $y[n]$ do item anterior multiplicando as _DFT's_ de $x[n]$ e $h[n]$ e realizando uma _DFT_ inversa.

== Reposta

A partir do enunciado podemos obter as sequências $x[n]$ e $h[n]$:

$
x[n] &= delta[n] - delta[n-2] \

\

h[n] &= delta[n] + 2 delta[n-1] + 4 delta[n-2] + 8 delta[n-3]
$

=== Item _a_

Para calcular a _DFT_ de quatro pontos $X[k]$ utilizamos a seguinte expressão:

$
X[k] = sum_(n=0)^(N-1) x[n] e^(-j (2pi)/N n k)
$

Substituindo os valores de $x[n]$ e $N = 4$:

$
X[k]
&= 1 e^(-j (2pi)/4 0 k) + 0 e^(-j (2pi)/4 1 k) - 1 e^(-j (2pi)/4 2 k) + 0 e^(-j (2pi)/4 3 k) \
&= 1 - e^(-j (2 pi)/4 2 k)
$

=== Item _b_

Realizando o mesmo procedimento para $H[k]$:

$
H[k]
&= 1 e^(-j (2pi)/4 0 k) + 2 e^(-j (2pi)/4 1 k) + 4 e^(-j (2pi)/4 2 k) + 8 e^(-j (2pi)/4 3 k) \
&= 1 + 2 e^(-j (2 pi)/4 k) + 4 e^(-j (2 pi)/4 2 k) + 8 e^(-j (2 pi)/4 3 k)
$

=== Item _c_

Para calcular $y[n] = x[n] ast.circle_4 h[n]$ realizamos a convolução circular diretamente:

$
y[n] = sum_(m=0)^(N-1) x[m] h[(n-m)_(mod 4)] 
$

Para $N = 4$ então obtemos:

$
y[n]
&= x[0] h[n_(mod 4)] + x[1] h[(n-1)_(mod 4)] + \ 
&quad x[2] h[(n-2)_(mod 4)] + x[3] h[(n-3)_(mod 4)] \
&= h[n_(mod 4)] - h[(n-2)_(mod 4)]
$

Portanto para os valores de 0 a 3 temos:

#grid(
  columns: (1fr, 1fr),
  [$
    y[0]
    &= h[0] - h[-2_(mod 4)] \
    &= h[0] - h[2] \
    &= 1 - 4 \
    &= -3 \ 

    \

    y[1]
    &= h[1] - h[-1_(mod 4)] \
    &= h[1] - h[3] \
    &= 2 - 8 \
    &= -6 \
  $],
  [$
    y[2]
    &= h[2] - h[0_(mod 4)] \
    &= h[2] - h[0] \
    &= 4 - 1 \
    &= 3 \

    \
    y[3]
    &= h[3] - h[1_(mod 4)] \
    &= h[3] - h[1] \
    &= 8 - 2 \
    &= 6
  $]
)


Portanto $y[n]$ pode ser representado por:

$
y[n] = -3delta[n] - 6 delta[n-1] + 3 delta[n-2] + 6 delta[n-3]
$

==== Simulação

Utilizado a biblioteca `scipy` do python, podemos simular a convolução circular de $x[n]$ e $h[n]$.

#sourcecode[```python
  N = 4
  n = np.arange(0, N)

  x_n = cos(pi * n / 2)
  h_n = 2**n

  y_n = ndimage.convolve(x_n, h_n, mode="wrap", origin=-int(N / 2))
```]

#figure(
  image("./assets/dft-2c.png", width: 80%),
  caption: [Plot de $x[n]$, $h[n]$ e $y[n]$] ,
  supplement: "Figura"
);

=== Item _d_

Com as _DFT's_ calculadas no item _a_ e _b_, podemos calcular $y[n]$ multiplicando as _DFT's_ de $x[n]$ e $h[n]$ e realizando uma _DFT_ inversa.

$
Y[k] 
&= X[k] H[k] \
&= (1 - e^(-j (2 pi)/4 2 k)) H[k] \
&= H[k] - H[k] e^(-j (2 pi)/4 2 k)\
&arrow.t.b.double\
y[n] &= h[n] - h[(n-2)_(mod 4)] \ 
&= delta[n] + 2 delta[n-1] + 4 delta[n-2] + 8 delta[n-3] - \ 
&quad delta[(n-2)_(mod 4)] - 2 delta[(n-3)_(mod 4)] - 4 delta[(n-4)_(mod 4)] - 8 delta[(n-5)_(mod 4)] \
&= delta[n] + 2 delta[n-1] + 4 delta[n-2] + 8 delta[n-3] - \
&quad delta[n-2] - 2 delta[n-3] - 4 delta[n] - 8 delta[n-1] \
&=-3 delta[n] - 6 delta[n-1] + 3 delta[n-2] + 6 delta[n-3]
$

==== Simulação

Utilizando a biblioteca `numpy` do python, podemos calcular a _DFT_ inversa de $X[k] H[k]$.

#sourcecode[```python
  N = 4
  n = np.arange(0, N)

  x_n = cos(pi * n / 2)
  h_n = 2**n

  X_k = fft(x_n)
  H_k = fft(h_n)

  Y_k = X_k * H_k

  y_n = ifft(Y_k)
```]

#figure(
  image("./assets/dft-2d.png", width: 80%),
  caption: [Plot de $x[n]$, $h[n]$ e $y[n]$ e suas respectivas _DFT's_] ,
  supplement: "Figura"
);

#pagebreak()

= Questão 3

Dois sinais de comprimento finito, $x_1[n]$ e $x_2[n]$, são esboçados na figura a seguir. Suponha que $x_1[n]$ e $x_2[n]$ sejam nulos fora da região mostrada na figura. Seja $x_3[n]$ a convolução circular de oito pontos de $x_1[n]$ e $x_2[n]$. Determine $x_3[2]$.

#figure(
  image("./assets/dft-3.png", width: 60%),
  caption: [Definições de $x_1[n]$ e $x_2[n]$],
  supplement: "Figura"
);

== Resposta

Analisando a figura, podemos obter as sequências $x_1[n]$ e $x_2[n]$:

$
x_1[n] &= delta[n] + 2 delta[n-1] + delta[n-2] + delta[n-3]  +\ &quad 2 delta[n-4] + delta[n-5] + delta[n-6] + 2 delta[n-7] \

\

x_2[n] &= delta[n-1] + 3 delta[n-2] + 2 delta[n-3]
$

Utilizando a formula da convolução circular sendo $N = 8$:

$
x_3[n] = sum_(m=0)^(N-1) x_1[m] x_2[(n-m)_(mod N)]
$

Podemos então obter $x_3[2]$:

$
x_3[2] 
&= x_1[0] x_2[(2-0)_(mod 8)] + x_1[1] x_2[(2-1)_(mod 8)] + \
&quad x_1[2] x_2[(2-2)_(mod 8)] + x_1[3] x_2[(2-3)_(mod 8)] + \
&quad x_1[4] x_2[(2-4)_(mod 8)] + x_1[5] x_2[(2-5)_(mod 8)] + \
&quad x_1[6] x_2[(2-6)_(mod 8)] + x_1[7] x_2[(2-7)_(mod 8)] \
&= x_1[0] x_2[2] + x_1[1] x_2[1] + x_1[2] x_2[0] + x_1[3] x_2[7] + \
&quad x_1[4] x_2[6] + x_1[5] x_2[5] + x_1[6] x_2[4] + x_1[7] x_2[3] \
&= 1 dot.op 3 + 2 dot.op 1 + 1 dot.op 0 + 1 dot.op 0 + 2 dot.op 0 + 1 dot.op 0 + 1 dot.op 0 + 2 dot.op 2 \
&=3 + 2 + 0 + 0 + 0 + 0 + 0 + 4 \
&= 9
$

Portanto $x_3[2] = 9$.

=== Simulação 

Utilizando python simulamos a operação

#sourcecode[```python
  N = 8
  n = np.arange(0, N)

  x1_n = [1, 2, 1, 1, 2, 1, 1, 2]
  x2_n = [0, 1, 3, 2, 0, 0, 0, 0]

  x3_n = ndimage.convolve(x1_n, x2_n, mode="wrap", origin=-int(N / 2))
```]

Obtemos o seguinte resultado

#figure(
  image("./assets/dft-r3.png", width: 80%),
  caption: [Plot de $x_3[n]$ evidenciando o valor em $x_3[2]$] ,
  supplement: "Figura"
);

#pagebreak()

= Questão 4

Na figura a seguir é mostrada uma sequência de tempo discreto com seis pontos $x[n] = 0$ fora do intervalo mostrado. O valor de $x[4]$ não é conhecido e é representado como $b$. Observe que a amostra mostrada como $b$ na figura não está necessariamente na escala. Sejam $X(e^(j omega))$ a _TFTD_ de $x[n]$ e $X_1[k]$ as amostras de $X(e^(j omega))$ em a cada $pi "/" 2$, isto é,

#figure(
  image("./assets/dft-4.png", width: 80%),
  //caption: [Plot de $x_3[n]$ evidenciando o valor em $x_3[2]$] ,
  supplement: "Figura"
);

A sequência com uatro pontos $x_1[n]$ que resulta da inversa com quatro pontos de $X_1[k]$ é mostrada a seguir. Com base nessa figura, você pode determinar $b$ de modo único? Caso afirmativo, dê esse valor de $b$.

#figure(
  image("./assets/dft-4a.png", width: 80%),
  // caption: [Plot de $x_3[n]$ evidenciando o valor em $x_3[2]$] ,
  supplement: "Figura"
);

Definimos $x_1[n]$ a partir da sequência mostrada na figura como:

$
x_1[n] = 4 delta[n] + delta[n-1] + 2 delta[n-2] + 2 delta[n-3]
$

Com essa informação podemos determinar a _DFT_ de 4 pontos da sequência:

$
X_1[k] = 4 + e^(-j (2 pi)/4 k) + 2 e^(-j (2 pi)/4 2 k) + 2 e^(-j (2 pi)/4 3 k)
$

Observando a sequência $x[n]$ dada na primeira imagem podemos defini-la em termos de função:

// 1 0 2 2 b 1 
$
x[n]
&= delta[n] + 2 delta[n-2] + 2 delta[n-3] + b delta[n-4] + delta[n-5] \
$

Portanto a _DFT_ de 4 pontos de $x[n]$ é:

$
X_1[k] = 1 + 2 e^(-j (2 pi)/4 2 k) + 2 e^(-j (2 pi)/4 3 k) + b  + e^(-j (2 pi)/4 k)
$

Comparando as duas expressões de $X_1[k]$ podemos obter o valor de $b$:

$
4 + e^(-j (2 pi)/4 k) + 2 e^(-j (2 pi)/4 2 k) + 2 e^(-j (2 pi)/4 3 k) \ 
= \
 1 + 2 e^(-j (2 pi)/4 2 k) + 2 e^(-j (2 pi)/4 3 k) + b  + e^(-j (2 pi)/4 k) \
$

Anulando os termos comuns obtemos:

$
4 = 1 + b therefore #rect()[b = 3]
$

#pagebreak()

= Questão 5

Na figura a seguir são mostradas duas sequências de comprimento finito $x_1[n]$ e $x_2[n]$. Qual é o menor N tal que a convolução circular de N pontos de $x_1[n]$ e $x_2[n]$ seja igual à convolução linear dessas sequência?

#figure(
  image("./assets/dft-5.png", width: 80%),
  caption: [Definições de $x_1[n]$ e $x_2[n]$],
  supplement: "Figura"
);

== Resposta

A partir da figura definimos as sequências $x_1[n]$ e $x_2[n]$:

$
x_1[n] &= delta[n] - 2 delta[n-1] - delta[n-2] + 3 delta[n-3] \

\
x_2[n] &= 2 delta[n-1] - delta[n-4] + delta[n-5]
$

Verificamos pelas imagens também que as respectivas janelas que contem valores são 4 para $x_1[n]$ e 6 para $x_2[n]$. 

Portanto utilizando a fórmula do tamanho da convolução linear:

$
N = N_1 + N_2 - 1
$

Obtemos que o menor N tal que a convolução circular de N pontos de $x_1[n]$ e $x_2[n]$ seja igual à convolução linear dessas sequência é 9.

== Simulação

Para validar os cálculos realizados simulamos ambas as convoluções e as comparamos. Será realizado utilizando python.

#sourcecode[```Python 
N = 9
n = np.arange(0, N)

x1_n = [1, -2, -1, 3, 0, 0, 0, 0, 0]
x2_n = [0, 2, 0, 0, -1, 1, 0, 0, 0]

circ_conv = ndimage.convolve(x1_n, x2_n, mode="wrap", origin=-int(N / 2))
linear_conv = signal.convolve(x1_n, x2_n)
```]

#figure(
  image("./assets/dft-r5.png", width: 80%),
  caption: [Plot das convoluções circular e linear de $x_1[n]$ e $x_2[n]$] ,
  supplement: "Figura"
);

Como observamos acima, a convolução circular de 9 pontos de $x_1[n]$ e $x_2[n]$ é igual à convolução linear dessas sequências.

#pagebreak()

= Questão 6

Na figura a seguir é mostrada uma sequência $x[n]$ para a qual o valor de $x[3]$ é uma constante desconhecida $c$. 

#figure(
  image("./assets/dft-6.png", width: 80%),
  //caption: [Plot das convoluções circular e linear de $x_1[n]$ e $x_2[n]$] ,
  supplement: "Figura"
);

O valor da amostra com amplitude $c$ não está necessariamente representada na escala. Considere:

$
X_1[k] = X[k] e^(j (2 pi)/5 2k)
$

Sendo $X[k]$ a _DFT_ de cinco pontos de $x[n]$. A sequência $x_1[n]$ representada na figura a seguir é a _DFT_ inversa de $X_1[k]$. Qual o valor de $c$?

#figure(
  image("./assets/dft-6a.png", width: 80%),
  //caption: [Plot das convoluções circular e linear de $x_1[n]$ e $x_2[n]$] ,
  supplement: "Figura"
);


== Reposta 

Obtendo a sequências $x[n]$ e $x_1[n]$ a partir das figuras:

$
x[n] &= 2 delta[n] - delta[n-1] + c delta[n-3] + delta[n-4] \

\

x_1[n] &= 2 delta[n] + delta[n-1] + 2 delta[n-2] - delta[n-3]
$

Sabendo que a multiplicação por $e^(j (2 pi)/5 2k)$ em $X[k]$ resulta em um deslocamento de 2 posições para a direita, podemos definir a relação entre $x_1[n]$ e $x[n]$:	

$
x_1[n] = x[(n-2)_mod(5)]
$

Portanto reescrevendo $x[(n-2)_mod(5)]$:

$
x[(n-2)_mod(5)] 
&= 2delta[n-2] - delta[n-3] + c delta[(n-5)_mod(5)] + delta[(n-6)_mod(5)]\
&= 2delta[n-2] - delta[n-3] + c delta[n] + delta[n-1]\
&= c delta[n] + delta[n-1] + 2delta[n-2] - delta[n-3]\
$

Realizando a comparação com $x_1[n]$ obtemos:

$
x_1[n] &= 2 delta[n] + delta[n-1] + 2 delta[n-2] - delta[n-3]\
&= \
x[(n-2)_mod(5)]  &= c delta[n] + delta[n-1] + 2 delta[n-2] - delta[n-3]
$

Cancelando os termos comuns obtemos:

$
c = 2
$ 

#pagebreak()

= Questão 7

Suponha que tenhamos uma sequência de 1025 pontos de dados (1 a mais que $N = 2^10$). Em vez de descartar o valor final, vamos preencher a sequência com zeros até que seu comprimento seja de $N = 2^11$, de modo que possamos usar um algoritmo _FFT_ de raiz 2.

+ Quantas multiplicações complexas são necessárias para se computar a _DFT_ usando um algoritmo de _FFT_ raiz 2?
+ Quantas multiplicações complexas seriam necessárias para se computar diretamente a _DFT_ de 1025 pontos?

== Respostas

=== Item _a_

Utilizando a fórmula para o cálculo do número de multiplicações complexas necessárias para se computar a _DFT_ usando um algoritmo de _FFT_ raiz 2:

$
N/2 log_2 N
$

Sendo $N = 2^11$:

$
&2^11/2 log_2 2^11 = #rect()[11.264]
$

Portanto são necessárias 11264 multiplicações complexas.

=== Item _b_

Para calcular diretamente a _DFT_ de 1025 pontos, utilizamos a fórmula:

$
N^2
$

Sendo $N = 1025$:

$
&1025^2 = #rect()[1050625]
$

Portanto são necessárias 1050625 multiplicações complexas.

#pagebreak()

= Questão 8

Considere a sequência de comprimento finito real $x[n]$ mostrada na figura a seguir.

#figure(
  image("./assets/dft-8.png", width: 80%),
  caption: [Definições de $x[n]$],
  supplement: "Figura"
);

+ Esboce a sequência de comprimento finito $y[n]$ cuja _DFT_ de seis pontos seja

  $
  Y[k] = W_6^(5k)X[k]
  $

  Sendo $X[k]$ a _DFT_ de seis pontos de $x[n]$.

+ Esboce a sequência de comprimento finito w[n] cuja _DFT_ de seis pontos seja 
  
  $
  W[k] = Im{X[k]}
  $

+ Esboce a sequência de comprimento finito $q[n]$ cuja _DFT_ de três pontos seja

  $
  Q[k] = X[2k+1] quad quad k = 0, 1, 2
  $

== Respostas

=== Item _a_

A partir da figura podemos obter a sequência $x[n]$:

$
x[n] = 4 delta[n] + 3 delta[n-1] + 2 delta[n-2] + delta[n-3]
$

Sabendo que $W_6^(5k) = e^(-j (2 pi)/6 5k)$ e que a multiplicação por $e^(-j (2 pi)/6 5k)$ em $X[k]$ resulta em um deslocamento de 5 posições para a direita, podemos facilmente relacionar $y[n]$ e $x[n]$:

$
y[n] = x[(n-5)_(mod 6)]
$

Portanto reescrevendo $x[(n-5)_(mod 6)]$ obtemos $y[n]$:

$
y[n] = 
x[(n-5)_(mod 6)] 
&= 4 delta[n-5] + 3 delta[(n-6)_mod(6)] +\ 
&quad 2 delta[(n-7)_mod(6)] + delta[(n-8)_mod(6)]\
&= 4 delta[n-5] + 3 delta[n] + 2 delta[n-1] + delta[n-2]\
&= 3 delta[n] + 2 delta[n-1] + delta[n-2] + 4 delta[n-5]
$

=== Item _b_

Calculamos a _DFT_ de seis pontos de $x[n]$:

$
X[k] = 4 + 3 W_6^k + 2 W_6^(2k) + W_6^(3k)
$

Sabendo que:

$
W_6 = e^(-j (2 pi)/6) quad "e" quad Im{e^(-j theta)} = -sin(theta) 
$

Podemos obter a sequência $W[k]$:

$
W[k]
&= Im{X[k]} \ 
&=-3 sin[(2 pi)/6 k] -2 sin[(2 pi)/6 2k]- sin[(2 pi)/6 3k]\
&=-3 sin[(pi/3) k] - 2 sin[((2pi)/3) k] - sin[pi k]
$

=== Item _c_

Para obter a sequência $q[n]$ a partir de $x[n]$ utilizamos a expressão:

$
Q[k] = X[2k+1] quad quad k = 0, 1, 2
$

E sendo $X[k]$ a _DFT_ de seis pontos de $x[n]$:

$
X[k] = 4 + 3 W_6^k + 2 W_6^(2k) + W_6^(3k)
$

Portanto obtemos:

$
Q[0] &= X[1]\
&= 3 W_6^1 + 2 W_6^2 + W_6^3 \ 
&= 3 W_6 + 2 W_6^2 + W_6^3\
Q[1] &= X[3]\
&= 3 W_6^3 + 2 W_6^6 + W_6^9 \
&= 3 W_6^3 + 2 W_6^0 + W_6^3\
Q[2] &= X[5]\
&= 3 W_6^5 + 2 W_6^10 + W_6^15 \
&= 3 W_6^5 + 2 W_6^4 + W_6^3
$

Portanto $q[n]$ pode ser representado por:

$
q[n] = 3 delta[n-1] + 2 delta[n-2] + delta[n-3]
$

#pagebreak()

= Questão 9

Realize a simulação das questões utilizando software.

= Questão 10

Comente os códigos feitos no MATLAB dos dois métodos de convolução fornecido pela professora. Faça testes usando essas funções fornecidas e compare com os resultados das funções cconv e conv.


== Função de convolução por sobreposição e armazenamento

#sourcecode[```matlab
function y=sobreposicao_armazena(x,h,N)

% Define o número de blocos necessários para realizar a convolução
L = length(x)
K = length(h)
B = ceil((L + K - 1)/(N - K + 1))

% Adiciona zeros para garantir que haja espaço suficiente para sobreposição e soma durante a convolução.
x=[zeros(1,K-1) x zeros(1,B*(N-K+1))]
hm = [h zeros(1,N-K)]

% Este loop divide o sinal de entrada x em blocos de tamanho N, com uma sobreposição de K-1 amostras entre os blocos.
for i = 1:B
    % Armazena os blocos de tamanho N
    X(i,:) = [x(1+(i-1)*(N-(K-1)):i*N-(i-1)*(K-1))];
end

% Realiza a convolução circular do primeiro bloco X com a resposta ao impulso estendida hm e, em seguida, selecionam apenas a parte relevante do resultado, removendo as amostras extras causadas pela convolução circular.
y = cconv(X(1,:),hm,N)
y = y(K:N)

% Este loop realiza o mesmo processo para os blocos restantes e concatena os resultados ao longo do tempo.
for i = 2:B
    y_aux = cconv(X(i,:),hm,N)
    y = [y y_aux(K:N)]
end
```]

== Função de convolução por sobreposição e soma 

#sourcecode[```matlab
function [yconv,yfft]=sobreposicao_soma(x,h,N)

% Determina o número de blocos necessários para dividir o sinal de entrada em blocos de tamanho N
t_x = length(x);
t_h = length(h);
blocos = t_x/N;

% Adiciona zeros para acomodar a resposta ao impulso h.
for i = 1:blocos
    X(i,:) = [x(1+(i-1)*N:i*N) zeros(1,t_h-1)];
end
hm = [h zeros(1,N-1)];

% Calcula a convolução por dois métodos diferentes: convolução circular e FFT.
for i = 1:blocos
    Y(i,:) = [zeros(1,(i-1)*N) cconv(X(i,:),hm,N+t_h-1) zeros(1,t_x-(i)*N)];
    YY(i,:) = [zeros(1,(i-1)*N) ifft(fft(X(i,:)).*fft(hm)) zeros(1,t_x-(i)*N)];
end


% Este loops somam os resultados de convolução de todos os blocos para obter o sinal de saída final tanto para a abordagem de sobreposição e soma quanto para a FFT.
yconv = zeros(1,t_x+t_h-1);
yfft = zeros(1,t_x+t_h-1);

for i = 1:blocos
    yconv = yconv+Y(i,:);
    yfft = yfft+YY(i,:);
end
```]