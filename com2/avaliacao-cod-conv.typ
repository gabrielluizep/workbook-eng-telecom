#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

#import fletcher.shapes: house, hexagon

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#set par(spacing: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Avaliação Códigos de Bloco",
  subtitle: "Sistemas de Comunicação II",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "28 de Outubro de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")
#set enum(numbering: "1)a)")
#set math.mat(delim: "[", gap: 1em)
#set table(stroke: rgb("f1f1f1"))


+ Considere o código convolucional com matrizes geradoras dadas por

  $ 
  G_0 = mat(1, 1, 1), G_1 = mat(1, 1, 0), G_2 = mat(0, 1, 1).
  $

  + Determine a taxa e a ordem de memória do código convolucional.

    $
      n &= 3 \
      k &= 1 \
      R &= k/n = 1/3 \
      mu &= 2 \
    $

  + Esboce o diagrama de blocos do codificador.

    $
    v_t &= u_t G_0 + u_(t-1) G_1 + u_(t-2) G_2 \
        &= u_t mat(1, 1, 1) + u_(t-1) mat(1, 1, 0) + u_(t-2) mat(0, 1, 1) \
        &= mat(u_t, u_t, u_t) + mat(u_(t-1), u_(t-1), 0) + mat(0, u_(t-2), u_(t-2)) \
        &= mat(u_t + u_(t-1), u_t + u_(t-1) + u_(t-2), u_t + u_(t-2))
    $


    #align(center)[
      #diagram(
      spacing: (10mm, 5mm), // wide columns, narrow rows
      node-stroke: 1pt, // outline node shapes
      edge-stroke: 1pt, // make lines thicker
      mark-scale: 60%, // make arrowheads smaller
      edge((-2,0), "r,u,r", "-|>", $u_t$, label-side: left),
      edge((-1,0), "r", "-|>"),
      edge((-2,0), "r,d,r,r,r,r,u,u,l", "-|>"),
      
      edge("-|>", "u"),
      edge("-|>", "r"),
      node((1,0), $z^(-1)$),
      edge("-|>", "u"),
      edge((1,0), "r,u","-|>"),
      node((0,0), $z^(-1)$),
      
      node((0,-1),  math.plus.circle, inset: 2pt),
      edge("-|>","uu", $v_t^((0))$),
      edge("-|>","r"),

      node((1,-1),  math.plus.circle, inset: 2pt),
      edge("-|>","uu", $v_t^((1))$),

      node((2,-1),  math.plus.circle, inset: 2pt),
      edge("-|>","uu", $v_t^((2))$),
      )
    ]


  + Esboce o diagrama de estados do código.

    #align(center)[
      #diagram(
        spacing: (4em, 2em), // wide columns, narrow rows
        node-stroke: 1pt, // outline node shapes
        edge-stroke: 1pt, // make lines thicker
        mark-scale: 60%, // make arrowheads smaller
        label-size: 8pt,
        
        
        node((-1,0), $00$, shape: circle, name:<00>),
        node((0,1), $01$, shape: circle  ,name:<01>),
        node((0,-1), $10$, shape: circle ,name:<10>),
        node((1,0), $11$, shape: circle  ,name:<11>),

        edge(<00>, "..|>", <10>, $111$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<00>, "-|>", <00>, $000$, bend:-140deg, loop-angle: 0deg, label-fill: white, label-pos: 0.5, label-side: center),
        
        edge(<10>, "-|>", <01>, $110$, bend: -20deg, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<10>, "..|>", <11>, $001$, label-fill: white, label-pos: 0.5, label-side: center),

        edge(<11>, "..|>", <11>, $010$, bend:140deg, loop-angle: 0deg, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<11>, "-|>", <01>, $101$, label-anchor: "south", label-fill: white, label-pos: 0.5, label-side: center),

        edge(<01>, "..|>", <10>, $100$, bend: -20deg, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<01>, "-|>", <00>, $011$, label-anchor: "south", label-fill: white, label-pos: 0.5, label-side: center),
      )
    ]

  + Determine os parâmetros $(n^',k^')$ do código de bloco resultante, com $h = 5$ blocos e terminação no estado zero.

    $
      n^' &= n dot.op h  = 15 \
      k^' &= k dot.op h  = 5
    $

  + Codifique a mensagem 11101. Insira a cauda apropriada.

   Utilizando o diagrama de estados para codificar a mensagem $11101$ e retornando ao estado $00$ da onde inciaremos, obtemos o resultado $111 space 001 space 010 space 101 space 100 space 110 space 011$

  + Decodifique a palavra recebida $110 space 110 space 110 space 111 space 010 space 101 space 101$ utilizando o algoritmo de Viterbi.

    Primeiramente montamos o diagrama do algoritmo de Viterbi
    #let table-node(pos, label, tint: white, ..args) = node(
      pos, align(center, label),
      width: 8mm,
      stroke: none,
      ..args,
    )

    #let circle-node(pos, label, tint: white, ..args) = node(
      pos, align(center, label),
      shape: circle,
      ..args,
    )

    #align(center)[
      #diagram(
        spacing: (4em, 3em), // wide columns, narrow rows
        node-stroke: 1pt, // outline node shapes
        edge-stroke: 1pt, // make lines thicker
        mark-scale: 60%, // make arrowheads smaller
        label-size: 8pt,        
        
        table-node((-.5,0), $00$),
        table-node((-.5,1), $10$),
        table-node((-.5,2), $01$),
        table-node((-.5,3), $11$),

        table-node((0.5,-.5), $110$),
        table-node((1.5,-.5), $110$),
        table-node((2.5,-.5), $110$),
        table-node((3.5,-.5), $111$),
        table-node((4.5,-.5), $010$),
        table-node((5.5,-.5), $101$),
        table-node((6.5,-.5), $101$),

        circle-node((0,0), $0$, name:<001>),
        circle-node((1,0), $2$, name:<002>),
        circle-node((2,0), $4$, name:<003>),
        circle-node((3,0), $3$, name:<004>),
        circle-node((4,0), $4$, name:<005>),
        circle-node((5,0), $4$, name:<006>),
        circle-node((6,0), $6$, name:<007>),
        circle-node((7,0), $6$, name:<008>),

        circle-node((1,1), $1$, name:<102>),
        circle-node((2,1), $3$, name:<103>),
        circle-node((3,1), $2$, name:<104>),
        circle-node((4,1), $3$, name:<105>),
        circle-node((5,1), $5$, name:<106>),

        circle-node((2,2), $1$, name:<013>),
        circle-node((3,2), $3$, name:<014>),
        circle-node((4,2), $3$, name:<015>),
        circle-node((5,2), $4$, name:<016>),
        circle-node((6,2), $4$, name:<017>),

        circle-node((2,3), $4$, name:<113>),
        circle-node((3,3), $5$, name:<114>),
        circle-node((4,3), $4$, name:<115>),
        circle-node((5,3), $4$, name:<116>),

        // 00 State
        edge(<001>,  "-|>", <002>, $000$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<002>,  "-|>", <003>, $000$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<003>,  "-|>", <004>, $000$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<004>,  "-|>", <005>, $000$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<005>,  "-|>", <006>, $000$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<006>,  "-|>", <007>, $000$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<007>,  "-|>", <008>, $000$, label-fill: white, label-pos: 0.5, label-side: center),

        edge(<001>,  "..|>", <102>, $111$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<002>,  "..|>", <103>, $111$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<003>,  "..|>", <104>, $111$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<004>,  "..|>", <105>, $111$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<005>,  "..|>", <106>, $111$, label-fill: white, label-pos: 0.5, label-side: center),
        
        // 10 State

        edge(<102>,  "-|>", <013>, $110$, label-fill: white, label-pos: 0.8, label-side: center),
        edge(<103>,  "-|>", <014>, $110$, label-fill: white, label-pos: 0.8, label-side: center),
        edge(<104>,  "-|>", <015>, $110$, label-fill: white, label-pos: 0.8, label-side: center),
        edge(<105>,  "-|>", <016>, $110$, label-fill: white, label-pos: 0.8, label-side: center),
        edge(<106>,  "-|>", <017>, $110$, label-fill: white, label-pos: 0.8, label-side: center),

        edge(<102>,  "..|>", <113>, $001$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<103>,  "..|>", <114>, $001$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<104>,  "..|>", <115>, $001$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<105>,  "..|>", <116>, $001$, label-fill: white, label-pos: 0.5, label-side: center),

        // 01 State

        edge(<013>,  "-|>", <004>, $011$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<014>,  "-|>", <005>, $011$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<015>,  "-|>", <006>, $011$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<016>,  "-|>", <007>, $011$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<017>,  "-|>", <008>, $011$, label-fill: white, label-pos: 0.5, label-side: center),

        edge(<013>,  "..|>", <104>, $100$, label-fill: white, label-pos: 0.8, label-side: center),
        edge(<014>,  "..|>", <105>, $100$, label-fill: white, label-pos: 0.8, label-side: center),
        edge(<015>,  "..|>", <106>, $100$, label-fill: white, label-pos: 0.8, label-side: center),

        // 11 State

        edge(<113>,  "-|>", <014>, $101$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<114>,  "-|>", <015>, $101$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<115>,  "-|>", <016>, $101$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<116>,  "-|>", <017>, $101$, label-fill: white, label-pos: 0.5, label-side: center),

        edge(<113>,  "..|>", <114>, $010$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<114>,  "..|>", <115>, $010$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<115>,  "..|>", <116>, $010$, label-fill: white, label-pos: 0.5, label-side: center),
      )
    ]

    Então podemos decodificar nossa mensagem recebida seguindo o caminho com menor erro acumulado, setas cheias indicam bit 0 e seta pontilhada indica bit 1. Obtemos assim 
    
    $
      b &= 110 space 110 space 110 space 111 space 010 space 101 space 101 \
      hat(v) &= 111 space 110 space 100 space 001 space 010 space 101 space 011 quad (6 "erros") \
      e &=  001 space 000 space 010 space 110 space 000 space 000 space 110 \
      hat(u)_"cauda" &= 1011100 \
      hat(u) &= 10111
    $

  + Determine a distância livre do código através do método de Mason.

    $ 
      G_0 = mat(1, 1, 1), G_1 = mat(1, 1, 0), G_2 = mat(0, 1, 1).
    $

    $
      G(D) &= mat(1+D, 1+D+D^2, 1+D^2)\
           &= mat(0"b"011, 0"b"111, 0"b"101)
    $


    #align(center)[
      #diagram(
        spacing: (4em, 3em), // wide columns, narrow rows
        node-stroke: 1pt, // outline node shapes
        edge-stroke: 1pt, // make lines thicker
        mark-scale: 60%, // make arrowheads smaller
        label-size: 8pt,  

        circle-node((0,1), $x$, name:<x>),
        circle-node((1,1), $s_1$, name:<s1>),
        circle-node((2,1), $s_2$, name:<s2>),
        circle-node((1.5,0), $s_3$, name:<s3>),
        circle-node((3,1), $y$, name:<y>),

        edge(<x>,  "..|>", <s1>, $D^3$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<s1>,  "-|>", <s2>, $D^2$, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<s2>,  "-|>", <y>, $D^2$, label-fill: white, label-pos: 0.5, label-side: center),
        
        edge(<s2>,  "-|>", <s1>, $D$, bend: 70deg, label-fill: white, label-pos: 0.5, 
        label-side: center),

        edge(<s1>,  "..|>", <s3>, $D$, bend: 20deg, label-fill: white, label-pos: 0.5, label-side: center),
        edge(<s3>,  "-|>", <s2>, $D^2$, bend: 20deg, label-fill: white, label-pos: 0.5, label-side: center),

        edge(<s3>,  "..|>", <s3>, $D$, bend: 140deg, label-fill: white, label-pos: 0.5, label-side: center),
      )
    ]

    $
      cases(
        s_1 &= D^3 &x &+ D    &s_2\
        s_2 &= D^2 &s_1 &+D^2 &s_3\
        s_3 &= D   &s_1 &+ D  &s_3 \
        y   &= D^2 &s_2
      )\
    $

    Resolvendo $s_3$:

    $
      s_3 &= D s_1 + D s_3 \
      s_3 &(1 - D) = D s_1 \
      s_3  &= (D s_1)/(1 - D) \
    $

    Substituindo $s_3$ em $s_2$:

    $
      s_2 &= D^2 s_1 + D^2 s_3 \
      s_2 &= D^2 s_1 + D^2 (D s_1)/(1 - D) \
      s_2 &= D^2 s_1 (1 + (D)/(1 - D)) \
      s_2 &= D^2 s_1 ((1-D)/(1-D) + (D)/(1 - D))\
      s_2 &= D^2 s_1 ((1-D + D)/(1 - D))\ 
      s_2 &= (D^2 s_1)/(1 - D)
    $

    Substituindo $s_2$ em $s_1$:

    $
      s_1 &= D^3 x + D s_2 \
      s_1 &= D^3 x + (D^3 s_1)/(1 - D) \
      s_1 &= D^3 (x + s_1/(1 - D)) \
      x &= s_1/D^3 - s_1/(1 - D)   \
      x &= s_1 (1/D^3 - 1/(1 - D))   \
      x &= s_1 (((1 - D) - D^3)/(D^3(1 - D)))   \
      s_1 &= x (D^3(1 - D))/(1 - D - D^3) \
    $

    Substituindo $s_2$ e $s_1$ em $y$:

    $
      y &= D^2 s_2 \
      y &= D^2 (D^2 s_1)/(1 - D) \
      y &= (D^4 s_1)/(1 - D) \
      y(1 - D) &= D^4 s_1 \
      y(1 - D) &= D^4 x (D^3(1 - D))/(1 - D - D^3) \
      y &= x D^7/(1 - D - D^3) \       
    $

    Logo obtemos a função de transferência:

    $
      T(D) = y/x =  D^7/(1 - D - D^3)
    $

    E indentificamos a distância livre como o maior expoente de $D$ no denominador, ou seja, $7$

#pagebreak()

Escreva um programa que simule o desempenho de BER de um sistema de comunicação que utiliza o código convolucional mostrado na figura abaixo com decodificação via algoritmo de Viterbi, modulação QPSK (com mapeamento Gray) e canal AWGN. Considere a transmissão de 1000 quadros, cada qual contendo $h = 200$ blocos de informação e relação sinal-ruído de bit $(E_b "/" N_0)$ variando de -1 a 7 dB, com passo de 1 dB. Compare com o caso não-codificado


    #align(center)[
      #diagram(
      spacing: (10mm, 5mm), // wide columns, narrow rows
      node-stroke: 1pt, // outline node shapes
      edge-stroke: 0.75pt, // make lines thicker
      mark-scale: 60%, // make arrowheads smaller
      

      node((0,0), $z^(-1)$, name: <z0>),
      node((1,0), $z^(-1)$, name: <z1>),
      node((2,0), $z^(-1)$, name: <z2>),
      node((3,0), $z^(-1)$, name: <z3>),
      node((4,0), $z^(-1)$, name: <z4>),
      node((5,0), $z^(-1)$, name: <z5>),

      edge(<start>, "-|>", <z0>),
      edge(<z0>,"-|>",<z1>),
      edge(<z1>,"-|>",<z2>),
      edge(<z2>,"-|>",<z3>),
      edge(<z3>,"-|>",<z4>),
      edge(<z4>,"-|>",<z5>),
      edge(<z5>, "-", <end>),

      edge(<before-z0>, "-", <before-z0-above>),
      edge(<after-z0>, "-", <after-z0-above>),
      edge(<after-z1>, "-", <after-z1-above>),
      edge(<after-z2>, "-", <after-z2-above>),
      edge(<end>, "-", <end-above>),

      edge(<before-z0-above>, "-|>", <st>),
      edge(<after-z0-above>, "-|>", <st>),
      edge(<after-z1-above>, "-|>", <st>),
      edge(<after-z2-above>, "-|>", <st>),
      edge(<end-above>, "-|>", <st>),
      
      edge(<before-z0>, "-", <before-z0-below>),
      edge(<after-z1>, "-", <after-z1-below>),
      edge(<after-z2>, "-", <after-z2-below>),
      edge(<after-z4>, "-", <after-z4-below>),
      edge(<end>, "-", <end-below>),

      edge(<before-z0-below>, "-|>", <sb>),
      edge(<after-z1-below>, "-|>", <sb>),
      edge(<after-z2-below>, "-|>", <sb>),
      edge(<after-z4-below>, "-|>", <sb>),
      edge(<end-below>, "-|>", <sb>),
      
      node((-2,0), name: <start>),
      node((6,0), name: <end>),
      node((6,-0.5), name: <end-above>),
      node((6,0.5), name: <end-below>),
      node((-0.5,0), name: <before-z0>),
      node((-0.5,-0.5), name: <before-z0-above>),
      node((-0.5,0.5), name: <before-z0-below>),
      node((0.5,0), name: <after-z0>),
      node((0.5,-0.5), name: <after-z0-above>),
      node((0.5,0.5), name: <after-z0-below>),
      node((1.5,0), name: <after-z1>),
      node((1.5,-0.5), name: <after-z1-above>),
      node((1.5,0.5), name: <after-z1-below>),
      node((2.5,0), name: <after-z2>),
      node((2.5,-0.5), name: <after-z2-above>),
      node((2.5,0.5), name: <after-z2-below>),
      node((3.5,0), name: <after-z3>),
      node((3.5,-0.5), name: <after-z3-above>),
      node((3.5,0.5), name: <after-z3-below>),
      node((4.5,0), name: <after-z4>),
      node((4.5,-0.5), name: <after-z4-above>),
      node((4.5,0.5), name: <after-z4-below>),

      node((2.5,-2), math.plus.circle, inset: 2pt , name:<st>),
      node((2.5,2), math.plus.circle, inset: 2pt  , name:<sb>),

      edge(<st>, "-|>", "uu", $v_t^((0))$),
      edge(<sb>, "-|>", "dd", $v_t^((1))$),
      )
    ]

    Utilizando Python e a biblioteca `komm` podemos simular o desempenho do sistema de comunicação descrito acima. O código abaixo realiza a simulação e plota o gráfico do desempenho BER do sistema.

    #figure(
      image("./assets/conv-code-802-11-qpsk-awgn.png", width: 70%),
      caption: "Desempenho BER do código de convolucional 802.11 de taxa 1/2 utilizando QPSK e canal AWGN",
    );
