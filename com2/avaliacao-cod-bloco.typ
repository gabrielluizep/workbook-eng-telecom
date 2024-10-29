#import "@preview/klaro-ifsc-sj:0.1.0": report

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
#set enum(numbering: "a)")
#set math.mat(delim: "[")

= Questão

Considere o *código de Hamming estendido* $(8,4)$, obtido a apartir do código de Hamming $(7,4)$, adicionando um "bit de paridade global" no final de cada palavra de código. (Dessa forma, todas as palavras-código terão um número par de bits 1.)

+ Determine uma matriz geradora $G$ para o código.
  
  Sabemos que a palavra código do código de Hamming $(7,4)$ é dada por

  $
    v = mat(v_1, v_2, v_3, v_4, v_5, v_6, v_7) = mat(u_1, u_2, u_3, u_4, p_1, p_2, p_3) 
  $

  Onde $u = mat(u_1, u_2, u_3, u_4)$ é a palavra de informação e $p = mat(p_1, p_2, p_3)$ é o vetor de paridade. Onde o vetor de paridade é obtido da seguinte maneira:

  $
    cases(
      p_1 = u_1 + u_2 + u_4,
      p_2 = u_1 + u_3 + u_4,
      p_3 = u_2 + u_3 + u_4
    )
  $

  Sabendo que a matriz geradora $G$ é dada por

  $
    v = u G
  $

  Podemos escrever a matriz geradora $G$ do código de Hamming $(7,4)$ como

  $ 
    v &= mat(u_1, u_2, u_3, u_4, u_1 + u_2 + u_4, u_1 + u_3 + u_4, u_2 + u_3 + u_4) = u G \
      &= mat(u_1, u_2, u_3, u_4) mat(1, 0, 0, 0, 1, 1, 0;
                                     0, 1, 0, 0, 1, 0, 1;
                                     0, 0, 1, 0, 0, 1, 1;
                                     0, 0, 0, 1, 1, 1, 1) = u G \
    therefore G &= mat(1, 0, 0, 0, 1, 1, 1;
                       0, 1, 0, 0, 1, 0, 1;
                       0, 0, 1, 0, 0, 1, 1;
                       0, 0, 0, 1, 1, 1, 0)
  $

  A partir desta análise do código de Hamming $(7,4)$, devemos alterá-lo de modo a adiconar um bit de paridade global, ou seja:

  $
    v = mat(v_1, v_2, v_3, v_4, v_5, v_6, v_7) = mat(u_1, u_2, u_3, u_4, p_1, p_2, p_3, p_4) 
  $

  onde

  $
    cases(
      p_1 = u_1 + u_2 + u_4,
      p_2 = u_1 + u_3 + u_4,
      p_3 = u_2 + u_3 + u_4,
      p_4 = v_1 + v_2 + v_3 + v_4 + v_5 + v_6 + v_7
    )
  $

  Ou seja 

  $
    p_4 &= (u_1) + (u_2) + (u_3) + (u_4) \ 
        &+ (u_1 + u_2 + u_4) + (u_1 + u_3 + u_4) + (u_2 + u_3 + u_4)  \
        &= u_1 + u_2 + u_3   
  $

  Com a definição de $p_4$ em termos da palavra de mensagem $u$, podemos escrever a matriz geradora $G$ do código de Hamming estendido $(8,4)$ como

  $ 
    v &= mat(u_1, u_2, u_3, u_4, u_1 + u_2 + u_4, u_1 + u_3 + u_4, u_2 + u_3 + u_4, u_1 + u_2 + u_3) = u G \
      &= mat(u_1, u_2, u_3, u_4) mat(1, 0, 0, 0, 1, 1, 1, 1;
                                     0, 1, 0, 0, 1, 0, 1, 1;
                                     0, 0, 1, 0, 0, 1, 1, 1;
                                     0, 0, 0, 1, 1, 1, 0, 0) = u G \
    therefore G &= mat(1, 0, 0, 0, 1, 1, 0, 1;
                       0, 1, 0, 0, 1, 0, 1, 1;
                       0, 0, 1, 0, 0, 1, 1, 1;
                       0, 0, 0, 1, 1, 1, 1, 0)
  $

#pagebreak()

#enum.item(2)[
  Construa uma tabela mensagem $->$ palavra-código 

  Utilizando a linguagem de programação `Python`, podemos construir uma tabela de mapeamento de mensagens para palavras-código do código de Hamming estendido $(8,4)$.

  #table(
    columns: (1fr, 2fr),
    table.header($u$, $v$),

    $0000$,$00000000$,
    $0001$,$00011110$,
    $0010$,$00100111$,
    $0011$,$00111001$,
    $0100$,$01001011$,
    $0101$,$01010101$,
    $0110$,$01101100$,
    $0111$,$01110010$,
    $1000$,$10001101$,
    $1001$,$10010011$,
    $1010$,$10101010$,
    $1011$,$10110100$,
    $1100$,$11000110$,
    $1101$,$11011000$,
    $1110$,$11100001$,
    $1111$,$1111111$,
  )
]

#pagebreak()

#enum.item(3)[
  Determine a distância mínima e a distribuição de peso das palavras-código

  Sabendo que o código de Hamming estendido $(8,4)$ é um código linear podemos obter a distância mínima do código a partir da distribuição de pesos das palavras códigos. A distribuição de pesos das palavras códigos é dada por

  #table(
    columns: (2fr, 1fr),
    table.header("Palavra-código", "Peso"),

    $00000000$,$0$,
    $00011110$,$4$,
    $00100111$,$4$,
    $00111001$,$4$,
    $01001011$,$4$,
    $01010101$,$4$,
    $01101100$,$4$,
    $01110010$,$4$,
    $10001101$,$4$,
    $10010011$,$4$,
    $10101010$,$4$,
    $10110100$,$4$,
    $11000110$,$4$,
    $11011000$,$4$,
    $11100001$,$4$,
    $11111111$,$8$,
  )

  #table(
    rows: 2, 
    columns: (1fr, 1fr, 1fr, 1fr,1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (center + horizon),
    $i$,$0$, $1$, $2$,$3$, $4$, $5$, $6$, $7$, $8$,
    $A_i$,$1$, $0$,$0$, $0$, $14$, $0$, $0$, $0$, $1$, 
  )

  Com a distribuição de peso das palavras códigos, podemos determinar a distância mínima do código de Hamming estendido $(8,4)$ como sendo $d_min = 4$.
]

#pagebreak()

#enum.item(4)[
  Determine a matriz de verificação $H$ para o código.

  A matriz de verificação é definida como

  $
    H v^T = 0
  $

  Podemos também relacionar a matriz de verificação $H$ com a matriz geradora $G$ através da relação

  $
    G H^T = 0
  $

  Sabendo que o código de Hamming estendido é um código sistemático, ou seja os bits da mensagem podem ser encontrados inalterados na palavra código, e sabendo que podemos separar a matriz geradora $G$ em duas matrizes $I$ e $P$ onde $I$ é a matriz identidade e $P$ é a matriz de paridade, podemos escrever a matriz de verificação $H$ como

  $
    G &= [I_k P]; \
  $

  $
    G &= mat(1, 0, 0, 0, 1, 1, 0, 1;
             0, 1, 0, 0, 1, 0, 1, 1;
             0, 0, 1, 0, 0, 1, 1, 1;
             0, 0, 0, 1, 1, 1, 1, 0)
    therefore P = mat(1, 1, 0, 1;
                      1, 0, 1, 1;
                      0, 1, 1, 1;
                      1, 1, 1, 0)
    => P^T = mat(1, 1, 0, 1;
                 1, 0, 1, 1;
                 0, 1, 1, 1;
                 1, 1, 1, 0)
      
  $

  sendo $m=n-k$, logo $m=4$. Portanto a matriz de verificação é dada por

  $
    H &= [P^T I_m]
      &= mat(1, 1, 0, 1;
             1, 0, 1, 1;
             0, 1, 1, 1;
             1, 1, 1, 0;
             1, 0, 0, 0;
             0, 1, 0, 0;
             0, 0, 1, 0;
             0, 0, 0, 1)
  $
]

#pagebreak()

#enum.item(5)[
  Construa uma tabela de síndrome $->$ padrão de erro

  
]