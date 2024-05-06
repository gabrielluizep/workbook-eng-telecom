#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge

#import fletcher.shapes: circle

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#set heading(numbering: "1  ")

#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)
#show figure.caption: set text(10pt, style: "italic")

#show: doc => report(
  title: [Estruturas de Filtros Digitais],
  subtitle: [Processamento de Sinais Digitais],
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: [29 de Abril de 2024],
  doc,
)

= Questão 1

Considere o diagrama de fluxo de sinais a seguir.

#diagram(
  node-stroke: 0.05em,
  // Inputs
  edge((-1, 0), (0, 0), $x[n]$),
  edge((0, 0), (0, 1)),
  node((0, 1)),
  edge((0, 0), (1, 0), "-|>-"),
  edge((0, 1), (1, 1), $z^(-1)$, "-|>-", label-side: bottom),
  // Quadripolo 1
  // // Setas cruzadas
  edge(
    (1, 0),
    (2, 1),
    text(size: 8pt)[$1/4$],
    "-|>",
    label-pos: 0.9,
    label-sep: 0pt,
  ),
  edge(
    (1, 1),
    (2, 0),
    "-|>",
    text(size: 8pt)[$1/4$],
    label-pos: 0.9,
    label-side: bottom,
    label-sep: 0pt,
  ),
  // // Nó distribuidores
  node((1, 0), radius: 0.25em),
  node((1, 1), radius: 0.25em),
  // // Conectores distribuidor-somador
  edge((1, 0), (2, 0), "-|>-", $a[n]$, label-pos: 1),
  edge((1, 1), (2, 1), "-|>-", $b[n]$, label-pos: 1, label-side: bottom),
  // // Nós somadores
  node((2, 0), radius: 0.25em),
  node((2, 1), radius: 0.25em),
  // // Saídas do quadripolo
  edge((2, 0), (3, 0), "-|>-"),
  edge((2, 1), (3, 1), "-|>-", $z^(-1)$, label-side: bottom),
  // Quadripolo 2
  // // Setas cruzadas
  edge(
    (3, 1),
    (4, 0),
    "-|>",
    text(size: 8pt)[$-3/5$],
    label-pos: 0.9,
    label-side: bottom,
    label-sep: 0pt,
  ),
  edge(
    (3, 0),
    (4, 1),
    "-|>",
    text(size: 8pt)[$-3/5$],
    label-pos: 0.9,
    label-sep: 0pt,
  ),
  // // Nós distribuidores
  node((3, 0), radius: 0.25em),
  node((3, 1), radius: 0.25em),
  // // Conectores distribuidor-somador
  edge((3, 0), (4, 0), "-|>-", $c[n]$, label-pos: 1),
  edge((3, 1), (4, 1), "-|>-", $d[n]$, label-pos: 1, label-side: bottom),
  // // Nós somadores
  node((4, 0), radius: 0.25em),
  node((4, 1), radius: 0.25em),
  // // Saídas do quadripolo
  edge((4, 0), (5, 0), "-|>-"),
  edge((4, 1), (5, 1), "-|>-", $z^(-1)$, label-side: bottom),
  // Quadripolo 3
  // // Setas cruzadas
  edge(
    (5, 1),
    (6, 0),
    "-|>",
    label-side: bottom,
    text(size: 8pt)[$-2/3$],
    label-pos: 0.9,
    label-sep: 0pt,
  ),
  edge(
    (5, 0),
    (6, 1),
    "-|>",
    text(size: 8pt)[$-2/3$],
    label-pos: 0.9,
    label-sep: 0pt,
  ),
  // // Nós distribuidores
  node((5, 0), radius: 0.25em),
  node((5, 1), radius: 0.25em),
  // // Conectores distribuidor-somador
  edge((5, 0), (6, 0), "-|>-"),
  edge((5, 1), (6, 1), "-|>-"),
  // // Nós somadores
  node((6, 0), radius: 0.25em),
  node((6, 1), radius: 0.25em),
  // // Saídas do quadripolo
  edge((6, 0), (7, 0), $y[n]$, "-|>"),
)

#set enum(numbering: "a)")
+ Determine a função de transferência $H[z]$ relacionando a entrada $x[n]$ à saída $y[n]$ para
  o filtro _FIR_ em treliça da figura acima.

  $
    a[n] &= x[n] + 0.25 x[n-1] \
  $

  $
    b[n] &= 0.25 x[n] + x[n-1] \
  $

  $
    c[n]
      &= a[n] - 0.6 b[n-1] \
      &= x[n] + 0.25 x[n-1] - 0.6 (0.25 x[n-1] + x[n-2]) \
      &= x[n] + 0.25 x[n-1] - 0.15 x[n-1] - 0.6 x[n-2] \
      &= x[n] + 0.1 x[n-1] - 0.6 x[n-2] \
  $

  $
    d[n]
      &= - 0.6 a[n] + b[n-1] \
      &= - 0.6 (x[n] + 0.25 x[n-1]) + 0.25 x[n-1] + x[n-2] \
      &= - 0.6 x[n] - 0.15 x[n-1] + 0.25 x[n-1] + x[n-2] \
      &= - 0.6 x[n] + 0.1 x[n-1] + x[n-2] \
  $

  $
    y[n]
      &= c[n] - 2/3 d[n-1]\
      &= x[n] + 0.1 x[n-1] - 0.6 x[n-2] \
      &- 2/3 (- 0.6 x[n-1] + 0.1 x[n-2] + x[n-3]) \
      &= x[n] + 0.1 x[n-1] - 0.6 x[n-2] \
      &+ 0.4 x[n-1] - 2/30 x[n-2] - 2/3 x[n-3] \
      &= x[n] + 0.5 x[n-1] - 2/3 x[n-2] - 2/3 x[n-3] \
  $

  Com isso encontramos a transformada $Z$ de $y[n]$, e isolando $Y[z]/X[z]$ obtemos
  a função de transferência $H[z]$:

  $
    Y[z]             &= X[z] + 0.5 z^(-1) X[z] - 2/3 z^(-2) X[z] - 2/3 z^(-3) X[z] \
    Y[z]             &= X[z] (1 + 0.5 z^(-1) - 2/3 z^(-2) - 2/3 z^(-3)) \
    H[z] = Y[z]/X[z] &= 1 + 0.5 z^(-1) - 2/3 z^(-2) - 2/3 z^(-3) \
  $

+ Desenhe o diagrama de fluxo de sinais na forma direta I.

  #diagram(
    node-stroke: 0.05em,
    spacing: 5em,
    // Inputs
    edge((-1, 0), (0, 0), $x[n]$),
    edge((0, 0), (1, 0), "-|>-"),
    edge((0, 0), (1, 0), "-|>-"),
    // 1
    node((1, 0), radius: 0.25em),
    edge((1, 0), (2, 0), "-|>-"),
    node((2, 0), radius: 0.25em),
    // 0.5 z^-1
    node((1, 1), radius: 0.25em),
    edge((1, 0), (1, 1), "-|>-"),
    edge((1, 1), (2, 1), "-|>-", $0.5$),
    node((2, 1), radius: 0.25em),
    edge((2, 1), (2, 0), "-|>-", $z^(-1)$),
    // -2/3 z^-2
    node((1, 2), radius: 0.25em),
    edge((1, 1), (1, 2), "-|>-"),
    edge((1, 2), (2, 2), "-|>-", $-2/3$),
    node((2, 2), radius: 0.25em),
    edge((2, 2), (2, 1), "-|>-", $z^(-1)$, label-side: right),
    // -2/3 z^-3
    node((1, 3), radius: 0.25em),
    edge((1, 2), (1, 3), "-|>-"),
    edge((1, 3), (2, 3), "-|>-", $-2/3$),
    node((2, 3), radius: 0.25em),
    edge((2, 3), (2, 2), "-|>-", $z^(-1)$),
    // Outputs
    edge((2, 0), (3, 0), "-|>-"),
    edge((3, 0), (4, 0), $y[n]$),
  )

+ Determine e trace o gráfico de resposta ao impulso unitário.

  $
    h[n] = delta[n] + 1/2 delta[n-1] - 2/3 delta[n-2] - 2/3 delta[n-3]
  $

  #figure(
    caption: "Resposta ao impulso unitário",
    image("./assets/estruturas-resposta-impulso.png", width: 70%),
  )

+ Desenhe a estrutura do filtro em treliça para o filtro só-pólos $1"/"H[z]$

  $
    1/H[z] = 1/(1 + 0.5 z^(-1) - 2/3 z^(-2) - 2/3 z^(-3))
  $

  #diagram(
    node-stroke: 0.05em,
    spacing: 4em,
    // Inputs
    edge((0, 0), (1, 0), "-|>-", $x[n]$),
    // Quadripolo 1
    node((1, 0), radius: 0.25em),
    edge((1, 0), (2, 0), "-|>-"),
    node((2, 0), radius: 0.25em),
    node((1, 1), radius: 0.25em),
    edge((2, 1), (1, 1), "-|>-"),
    node((2, 1), radius: 0.25em),
    edge((2, 1), (1, 0), "-|>", $2/3$, label-pos: 0.9, label-side: left),
    edge((2, 0), (1, 1), "-|>", $-2/3$, label-pos: 0.9),
    edge((2, 0), (3, 0), "-|>-"),
    edge((3, 1), (2, 1), "-|>-", $z^(-1)$, label-side: left),
    // Quadripolo 2
    node((3, 0), radius: 0.25em),
    edge((3, 0), (4, 0), "-|>-"),
    node((4, 0), radius: 0.25em),
    node((3, 1), radius: 0.25em),
    edge((4, 1), (3, 1), "-|>-"),
    node((4, 1), radius: 0.25em),
    edge((4, 1), (3, 0), "-|>", $3/5$, label-pos: 0.9, label-side: left),
    edge((4, 0), (3, 1), "-|>", $-3/5$, label-pos: 0.9),
    edge((4, 0), (5, 0), "-|>-"),
    edge((5, 1), (4, 1), "-|>-", $z^(-1)$, label-side: left),
    // Quadripolo 3
    node((5, 0), radius: 0.25em),
    edge((5, 0), (6, 0), "-|>-"),
    node((6, 0), radius: 0.25em),
    node((5, 1), radius: 0.25em),
    edge((6, 1), (5, 1), "-|>-"),
    node((6, 1), radius: 0.25em),
    edge((6, 1), (5, 0), "-|>", $-1/4$, label-pos: 0.9, label-side: left),
    edge((6, 0), (5, 1), "-|>", $1/4$, label-pos: 0.9),
    edge((6, 0), (7, 0), "-|>-"),
    edge((7, 1), (6, 1), "-|>-", $z^(-1)$, label-side: left),
    // Saída e realimentação
    node((7, 0), radius: 0.25em),
    node((7, 1), radius: 0.25em),
    edge((7, 0), (7, 1)),
    edge((7, 0), (8, 0), "-|>-", $y[n]$),
  )

#pagebreak()

= Questão 2

Um sistema LIT causal é definido pelo diagrama de fluxo de sinais mostrado na
Figura a seguir, que representa o sistema como uma cascata de um sistema de
segunda ordem com um sistema de primeira ordem.

#diagram(
  node-stroke: 0.05em,
  spacing: 5em,
  edge((-1, 0), (0, 0), "-|>-", $x[n]$),
  node((0, 0), radius: 0.25em),
  edge((0, 0), (1, 0), "-|>-", $a[n]$, label-pos: 0),
  node((1, 0), radius: 0.25em),
  edge((1, 0), (1, 1), "-|>-", $z^(-1)$, label-side: left),
  edge((1, 0), (2, 0), "-|>-"),
  node((1, 1), radius: 0.25em),
  edge((1, 1), (0, 1), "-|>-", $0.3$),
  edge((1, 1), (1, 2), "-|>-", $z^(-1)$, label-side: left),
  node((0, 1), radius: 0.25em),
  edge((0, 1), (0, 0), "-|>-"),
  edge((1, 2), (0, 2), "-|>-", $0.4$),
  edge((0, 2), (0, 1), $b[n]$, label-pos: 1, label-side: left),
  edge((1, 2), (2, 2), "-|>-", $0.81$),
  edge((2, 2), (2, 0)),
  node((2, 0), radius: 0.25em),
  edge((2, 0), (3, 0), "-|>-", $y_1[n]$),
  node((3, 0), radius: 0.25em),
  edge((3, 0), (3, 1)),
  edge((3, 1), (4, 1), "-|>-", $2$),
  edge((4, 1), (4, 1), $c[n]$, label-side: bottom),
  edge((4, 1), (4, 0), "-|>-", $z^(-1)$),
  node((4, 1), radius: 0.25em),
  node((4, 0), radius: 0.25em),
  edge((3, 0), (4, 0), "-|>-", $y[n]$, label-pos: 1),
  node((5, 0), radius: 0.25em),
  edge((4, 0), (5, 0), "-|>-"),
  edge((5, 0), (5, 1)),
  edge((5, 1), (4, 1), "-|>-", $-0.8$),
  edge((5, 0), (6, 0), "-|>-", $y[n]$),
)

+ Qual é a função de transferência do sistema em cascata global?

  Observando os nós somadores verificamos que:

  $
    b[n] = 0.3 a[n-1] + 0.4a[n-2]
  $

  $
    a[n]
      &= x[n] + b[n]\
      &= x[n] + 0.3 a[n-1] + 0.4 a[n-2]
  $

  $
    y_1[n] = a[n] + 0.81 a[n-2]
  $

  Analisando no domínio $Z$:

  $
    A[z] &= X[z] + 0.3 z^(-1) A[z] + 0.4 z^(-2) A[z]\
    X[z] &= A[z] - 0.3 z^(-1) A[z] - 0.4 z^(-2) A[z]\
         &= A[z] (1 - 0.3 z^(-1) - 0.4 z^(-2))\
  $

  $
    Y_1[z]&= A[z] + 0.81 z^(-2) A[z]\
          &= A[z] (1 + 0.81 z^(-2))\
  $

  Obtemos então a função de transferência local considerando a entrada $x[n]$ e a
  saída $y_1[n]$:

  $
    H_1[z] = (Y_1[z])/X[z] = (1 + 0.81 z^(-2))/(1 - 0.3 z^(-1) - 0.4 z^(-2))
  $

  Considerando agora o segundo sistema da cascata:

  $
    c[n] &= 2 y_1[n-1] - 0.8 y[n-1]\
  $

  $
    y[n] &= y_1[n] + c[n-1]\
         &= y_1[n] + 2 y_1[n-1] - 0.8 y[n-1]
  $

  Portanto em $Z$:

  $
    Y[z]                   &= Y_1[z] + 2 z^(-1) Y_1[z] - 0.8 z^(-1) Y[z]\
    Y[z] + 0.8 z^(-1) Y[z] &= Y_1[z] + 2 z^(-1) Y_1[z]\
    Y[z] (1 + 0.8 z^(-1))  &= Y_1[z] (1 + 2 z^(-1))\
  $

  Temos então a função de transferência local do segundo sistema:

  $
    H_2[z] = (Y[z])/Y_1[z] = (1 + 2 z^(-1))/(1 + 0.8 z^(-1))
  $

  Podemos definir a função de transferência global como o produto das funções de
  transferências em $Z$:

  $
    H[z] = H_1[z] H_2[z] = (1 + 0.81 z^(-2))/(1 - 0.3 z^(-1) - 0.4 z^(-2)) dot.op (1 + 2 z^(-1))/(1 + 0.8 z^(-1))
  $

  Utilizando as funções _roots_ e _poly_ do _Python_ podemos obter a função de
  transferência para uma única expressão:

  $
    H[z] &= (1+2z^(-1)+0.81z^(-2)+1.62z^(-3))/(1+0.5z^(-1)-0.64z^(-2)-0.32z^(-3))
  $

+ O sistema global é estável? Explique resumidamente.

  #figure(
    caption: "Diagrama de polos e zeros",
    image("./assets/estruturas-polos-zeros.png", width: 70%),
  )

  Utilizando a função _zplane_ do _Python_ podemos visualizar o diagrama de polos,
  nele constatamos que todos os polos estão dentro do círculo unitário, portanto o
  sistema é estável.

+ Desenhe o diagrama de fluxo de sinais de uma implementação na forma direta II
  transposta desse sistema.

  #diagram(
    node-stroke: 0.05em,
    spacing: 6em,
    // Primeir coluna
    edge((-1, 0), (0, 0), "-|>-", $x[n]$),
    node((0, 0), radius: 0.25em),
    edge((0, 0), (1, 0), "-|>-"),
    edge((0, 0), (0, 1), "-|>-"),
    node((0, 1), radius: 0.25em),
    edge((0, 1), (1, 1), "-|>-", $2$),
    edge((0, 1), (0, 2), "-|>-"),
    node((0, 2), radius: 0.25em),
    edge((0, 2), (1, 2), "-|>-", $0.81$),
    edge((0, 2), (0, 3), "-|>-"),
    node((0, 3), radius: 0.25em),
    edge((0, 3), (1, 3), "-|>-", $1.62$),
    // Segunda coluna
    node((1, 0), radius: 0.25em),
    edge((1, 0), (2, 0), "-|>-"),
    edge((1, 1), (1, 0), "-|>-", $z^(-1)$),
    node((1, 1), radius: 0.25em),
    edge((1, 2), (1, 1), "-|>-", $z^(-1)$),
    node((1, 2), radius: 0.25em),
    edge((1, 3), (1, 2), "-|>-", $z^(-1)$),
    node((1, 3), radius: 0.25em),
    // Terceira coluna
    node((2, 0), radius: 0.25em),
    edge((2, 0), (2, 1), "-|>-"),
    node((2, 1), radius: 0.25em),
    edge((2, 1), (1, 1), "-|>-", $-0.5$),
    edge((2, 1), (2, 2), "-|>-"),
    node((2, 2), radius: 0.25em),
    edge((2, 2), (1, 2), "-|>-", $0.64$),
    edge((2, 2), (2, 3), "-|>-"),
    node((2, 3), radius: 0.25em),
    edge((2, 3), (1, 3), "-|>-", $0.32$),
    // Saída
    edge((2, 0), (3, 0), "-|>-", $y[n]$),
  )

= Questão 3

A figura a seguir mostra uma implementação em forma direta II de um sistema

#align(center)[
  #diagram(
    node-stroke: 0.05em,
    spacing: 6em,
    // Primeir coluna
    edge((-1, 0), (0, 0), "-|>-", $x[n]$),
    node((0, 0), radius: 0.25em),
    edge((0, 0), (1, 0), "-|>-", $a[n]$, label-pos: 0),
    edge((0, 0), (0, 1)),
    edge((1, 1), (0, 1), "-|>-", $0.5$),
    // Segunda coluna
    node((1, 0), radius: 0.25em),
    edge((1, 0), (2, 0), "-|>-"),
    edge((1, 0), (1, 1), "-|>-", $z^(-1)$),
    node((1, 1), radius: 0.25em),
    // Terceira coluna
    node((2, 0), radius: 0.25em),
    edge((2, 0), (2, 1)),
    edge((1, 1), (2, 1), "-|>-", $0.2$),
    // Saída
    edge((2, 0), (3, 0), "-|>-", $y[n]$),
  )
]

+ Determine a função de transferência $H[z]$

  $
    a[n] &= x[n] + 0.5 a[n-1]\
  $

  $
    y[n] &= a[n] + 0.2 a[n-1]\
  $

  Portanto em $Z$:

  $
    A[z] &= X[z] + 0.5 z^(-1) A[z]\
    X[z] &= A[z] - 0.5 z^(-1) A[z]\
         &= A[z] (1 - 0.5 z^(-1))\
  $

  $
    Y[z] &= A[z] + 0.2 z^(-1) A[z]\
         &= A[z] (1 + 0.2 z^(-1))\
  $

  Logo a função de transferência $H[z]$ é:

  $
    H[z] = Y[z]/X[Z]= (1 + 0.2 z^(-1))/(1 - 0.5 z^(-1))
  $

+ Determine a resposta ao impulso unitário $h[n]$

  $
    H[z]
      &= (1 + 0.2 z^(-1))/(1 - 0.5 z^(-1))
      &= 1/(1 - 0.5 z^(-1)) + 0.2 z^(-1)/(1 - 0.5 z^(-1))
  $

  Portanto utilizando a tabela de transformada inversa de $Z$:

  $
    h[n] = (0.5)^n u[n] + 0.2 (0.5)^(n-1) u[n-1]
  $

+ Assumindo que o sistema seja implementado em aritmética de ponto fixo de 8 bits,
  e que todos os produtos sejam arredondados para 8 bits antes que uma soma
  qualquer tenha sido realizada. Usando o modelo linear para ruído de
  arredondamento, encontre a variância do ruído de arredondamento na saída do
  filtro.
#align(center)[
  #diagram(
    node-stroke: 0.05em,
    spacing: 6em,
    // Primeir coluna
    edge((-1, 0), (0, 0), "-|>-", $x[n]$),
    edge((0, -1), (0, 0), "-|>", $e_0[n]$),
    node((0, 0), radius: 0.25em),
    edge((0, 0), (1, 0), "-|>-"),
    edge((0, 0), (0, 1)),
    edge((1, 1), (0, 1), "-|>-", $0.5$),
    // Segunda coluna
    node((1, 0), radius: 0.25em),
    edge((1, 0), (2, 0), "-|>-"),
    edge((1, 0), (1, 1), "-|>-", $z^(-1)$),
    node((1, 1), radius: 0.25em),
    // Terceira coluna
    edge((2, -1), (2, 0), "-|>", $e_1[n]$),
    node((2, 0), radius: 0.25em),
    edge((2, 0), (2, 1)),
    edge((1, 1), (2, 1), "-|>-", $0.2$),
    // Saída
    edge((2, 0), (3, 0), "-|>-", $y[n]$),
  )
]

A variância do ruído de arredondadmento é dada por:

$
  sigma^2_e = 2^(-2B)/12
$

Onde B é o número de bits do sistema menos 1, portanto para um sistema de 8
bits:

$
  sigma^2_e = 2^(-2 dot.op 7)/12 = 5.0863 dot.op 10^(-6)
$

Podemos escrever o ruído da saída do sistema como:

$
  sigma^2_f = sigma^2_e + sigma^2_e (b_0^2 + b_1^2 + 2a_1 b_0 b_1)/(1 - a_1^2)
$

Onde $b_0$ e $b_1$ são os coeficientes do numerador e $a_1$ do denominador da
função de transferência, portanto:

$
  sigma^2_f
    &= sigma^2_e + sigma^2_e (1^2 + 0.2^2 + 2 dot.op 0.5 dot.op 1 dot.op 0.2)/(1 - 0.5^2)\
    &= 5.0863 dot.op 10^(-6)\
    &+ 5.0863 dot.op 10^(-6) (1 + 0.04 + 0.2)/(1 - 0.25)\
    &= 5.0863 dot.op 10^(-6)\
    &+ 5.0863 dot.op 10^(-6) (1.24)/(0.75)\
    &= 5.0863 dot.op 10^(-6) (1 + 1.6533)\
    &= 1.3495 dot.op 10^(-5)
$