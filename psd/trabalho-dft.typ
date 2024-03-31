#import "@preview/codelst:2.0.1": sourcecode

#import "@preview/klaro-ifsc-sj:0.1.0": report

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

= Questão 6 (Não consegui fazer)

Na figura a seguir é mostrada uma sequência $x[n]$ para a qual o valor de $x[3]$ é uma constante desconhecida $c$. 

#figure(
  image("./assets/dft-6.png", width: 80%),
  //caption: [Plot das convoluções circular e linear de $x_1[n]$ e $x_2[n]$] ,
  supplement: "Figura"
);

O valor da amostra com amplitude $c$ não está necessariamente representada na escala. Considere:

$
X_1[k] = X[k] e^(j (2 pi)/5 3k)
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

Podemos obter a _DFT_ de 5 pontos de $x[n]$ e $x_1[n]$:

$
X[k] = 2 - e^(-j (2 pi)/5 k) + c e^(-j (2 pi)/5 3 k) + e^(-j (2 pi)/5 4 k) \

\

X_1[k] = 2 + e^(-j (2 pi)/5 k) + 2 e^(-j (2 pi)/5 2 k) - e^(-j (2 pi)/5 3 k)
$

Utilizando a relação $X_1[k] = X[k] e^(j (2 pi)/5 3k)$ podemos obter o valor de $c$:

Para simplificação faremos $e^(-j (2 pi)/N) = W_N$

$
2 + W_5^k + 2 W_5^(2k) - W_5^(3k) &= W_5^(3k)(2 - W_5^k + c W_5^(3k) + W_5^(4k)) \
&= 2 W_5^(3k) - W_5^(4k) + c W_5^(6k) + W_5^(7k) \
&= 2 W_5^(3k) - W_5^(4k) + c W_5^(k) + W_5^(2k) \
&= c W_5^(k) + W_5^(2k) + 2W_5^(3k) - W_5^(4k)
$

#pagebreak()

= Questão 7

Suponha que tenhamos uma sequência de 1025 pontos de dados (1 a mais que $N = 2^10$). Em vez de descartar o valor final, vamos preencher a sequência com zeros até que seu comprimento seja de $N = 2^11$, de modo que possamos usar um algoritmo _FFT_ de raiz 2.

+ Quantas multiplicações complexas são necessárias para se computar a _DFT_ usando um algoritmo de _FFT_ raiz 2?
+ Quantas multiplicações complexas seriam necessárias para se computar diretamente a _DFT_ de 1025 pontos?