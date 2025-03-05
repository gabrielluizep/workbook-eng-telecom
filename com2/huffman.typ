#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

#import fletcher.shapes: house, hexagon

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#set par(spacing: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Códigos de Huffman",
  subtitle: "Sistemas de Comunicação II",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "17 de Fevereiro de 2025",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")
#set enum(numbering: "1)a)")
#set math.mat(delim: "[", gap: 1em)
#set table(stroke: rgb("f1f1f1"))

+ Considere uma fonte discreta sem memória (DMS) com alfabeto dado por $cal(X) = {a,b,c}$ e probabilidades respectivas dadas por $p_cal(X) = [3/10, 6/10, 1/10]$

  + Calcule a entropia da fonte $H(X)$

    $
      H(X) &= - sum_(x in cal(X)) p_X (x) log_2 p_X (x)
          &= 1.295 "bits"
    $

  + Determine um código de Huffman para a fonte. Qual o comprimento médio do código obtido?

    #align(center)[
      #diagram(
        spacing: (4em, 2em), // wide columns, narrow rows
        node-stroke: 1pt, // outline node shapes
        edge-stroke: 1pt, // make lines thicker
        mark-scale: 60%, // make arrowheads smaller
        label-size: 8pt,
        
        
        node((-1,0), $b; p_b = 0.6$, name:<b>),
        node((-1,1), $a; p_a = 0.3$, name:<a>),
        node((-1,2), $c; p_c = 0.1$, name:<c>),

        node((0,0), $b; p_b = 0.6$, name:<b1>),
        node((0,1), $a or c; p_(a or c) = 0.4$, name:<ac>),

        node((1,0), $b or a or c; p_(b or a or c)=1$, name:<bac>),
        
        edge(<b>, "-|>", <b1>, label: $0$),
        edge(<a>, "-|>", <ac>, label: $0$),
        edge(<c>, "-|>", <ac>, label: $1$),
        edge(<c>, "-|>", <ac>, label: $1$),
        edge(<b1>, "-|>", <bac>, label: $0$),
        edge(<ac>, "-|>", <bac>, label: $1$),
      )
    ]

    $
      b:0; quad a:10; quad c:11
    $

    $
      L = 0.6 dot.op 1 + 0.3 dot.op 2 + 0.1 dot.op 2 = 1.4 "bits/simbolo"
    $
  
  + Calcule a entropia da extensão de segunda ordem da fonte.

    $
      cal(X)^2   &= {a a, a b, a c, b a, b b, b c, c a, c b, c c}\ 
      p_(cal(X)) &= mat(p_a^2, p_a p_b, p_a p_c, p_b p_a, p_b^2, p_b p_c, p_c p_a, p_c p_b, p_c^2)\
                 &= [0.09, 0.18, 0.03, 0.18, 0.36, 0.06, 0.03, 0.06, 0.01]
    $

    $
      H(X^2) &= -sum_(x in cal(X)^2) p_(X^2) (x) log_2 p_(X^2) (x)\
             &= 2.59 "bits"
    $
  
  + Determine um código de Huffman para a extensão de segunda ordem da fonte. Qual o comprimento médio do código obtido? Comente o resultado.

    #image("assets/1.jpeg")
    #image("assets/2.jpeg")
    // #align(center)[
    //   #diagram(
    //     spacing: (2.5em, 3em), // wide columns, narrow rows
    //     node-stroke: 1pt, // outline node shapes
    //     edge-stroke: 1pt, // make lines thicker
    //     mark-scale: 60%, // make arrowheads smaller
    //     label-size: 8pt,
        
        
    //     node((-1,0), [bb: $0.36$], name:<bb>),
    //     node((-1,1), [ab: $0.18$], name:<ab>),
    //     node((-1,2), [ba: $0.18$], name:<ba>),
    //     node((-1,3), [aa: $0.09$], name:<aa>),
    //     node((-1,4), [bc: $0.06$], name:<bc>),
    //     node((-1,5), [cb: $0.06$], name:<cb>),
    //     node((-1,6), [ac: $0.03$], name:<ac>),
    //     node((-1,7), [ca: $0.03$], name:<ca>),
    //     node((-1,8), [cc: $0.01$], name:<cc>),

    //     // ca.cc
    //     node((0,0), $0.36$, name:<bb1>),
    //     node((0,1), $0.18$, name:<ab1>),
    //     node((0,2), $0.18$, name:<ba1>),
    //     node((0,3), $0.09$, name:<aa1>),
    //     node((0,4), $0.06$, name:<bc1>),
    //     node((0,5), $0.06$, name:<cb1>),
    //     node((0,6), $0.04$, name:<ca-cc>),
    //     node((0,7), $0.03$, name:<ac1>),

    //     // ca.cc.ac
    //     node((1,0), $0.36$, name:<bb2>),
    //     node((1,1), $0.18$, name:<ab2>),
    //     node((1,2), $0.18$, name:<ba2>),
    //     node((1,3), $0.09$, name:<aa2>),
    //     node((1,4), $0.07$, name:<ca-cc-ac>),
    //     node((1,5), $0.06$, name:<bc2>),
    //     node((1,6), $0.06$, name:<cb2>),

    //     // bc.cb
    //     node((2,0), $0.36$, name:<bb3>),
    //     node((2,1), $0.18$, name:<ab3>),
    //     node((2,2), $0.18$, name:<ba3>),
    //     node((2,3), $0.12$, name:<bc-cb>),
    //     node((2,4), $0.09$, name:<aa3>),
    //     node((2,5), $0.07$, name:<ca-cc-ac1>),

    //     // ca.cc.ac.aa
    //     node((3,0), $0.36$, name:<bb4>),
    //     node((3,1), $0.18$, name:<ab4>),
    //     node((3,2), $0.18$, name:<ba4>),
    //     node((3,3), $0.16$, name:<ca-cc-ac-aa>),
    //     node((3,4), $0.12$, name:<bc-cb2>),

    //     // ca.cc.ac.aa.bc.bb
    //     node((4,0), $0.36$, name:<bb5>),
    //     node((4,1), $0.28$, name:<ca-cc-ac-aa-bc-cb>),
    //     node((4,2), $0.18$, name:<ab5>),
    //     node((4,3), $0.18$, name:<ba5>),

    //     // ab.ba
    //     node((5,0), $0.36$, name:<ab-ba>),
    //     node((5,1), $0.36$, name:<bb6>),
    //     node((5,2), $0.28$, name:<ca-cc-ac-aa-bc-cb1>),

    //     // ca.cc.ac.aa.bc.cb.bb
    //     node((6,0), $0.64$, name:<ca-cc-ac-aa-bc-cb-bb>),
    //     node((6,1), $0.36$, name:<ab-ba2>),

    //     // 1
    //     node((7,0), $1$, name:<1>),

    //     edge(<bb>, "-|>", <bb1>),
    //     edge(<bb1>, "-|>", <bb2>),
    //     edge(<bb2>, "-|>", <bb3>),
    //     edge(<bb3>, "-|>", <bb4>),
    //     edge(<bb4>, "-|>", <bb5>),
    //     edge(<bb5>, "-|>", <bb6>),
    //     edge(<bb6>, "-|>", <ca-cc-ac-aa-bc-cb-bb>, label:$0$),
    //     edge(<ca-cc-ac-aa-bc-cb-bb>, "-|>", <1>, label: $0$),

    //     edge(<ab>, "-|>", <ab1>),
    //     edge(<ab1>, "-|>", <ab2>),
    //     edge(<ab2>, "-|>", <ab3>),
    //     edge(<ab3>, "-|>", <ab4>),
    //     edge(<ab4>, "-|>", <ab5>),
    //     edge(<ab5>, "-|>", <ab-ba>,label: $0$),
    //     edge(<ab-ba>, "-|>", <ab-ba2>),
    //     edge(<ab-ba2>, "-|>", <1>, label: $1$),

    //     edge(<ba>, "-|>", <ba1>),
    //     edge(<ba1>, "-|>", <ba2>),
    //     edge(<ba2>, "-|>", <ba3>),
    //     edge(<ba3>, "-|>", <ba4>),
    //     edge(<ba4>, "-|>", <ba5>),
    //     edge(<ba5>, "-|>", <ab-ba>, label: $1$),
        

    //     edge(<aa>, "-|>", <aa1>),
    //     edge(<aa1>, "-|>", <aa2>),
    //     edge(<aa2>, "-|>", <aa3>),
    //     edge(<aa3>, "-|>", <ca-cc-ac-aa>, label: $0$),
        
    //     edge(<bc>, "-|>", <bc1>),
    //     edge(<bc1>, "-|>", <bc2>),
    //     edge(<bc2>, "-|>", <bc-cb>, label: $0$),
    //     edge(<bc-cb>, "-|>", <bc-cb2>),
    //     edge(<bc-cb2>, "-|>", <ca-cc-ac-aa-bc-cb>, label: $1$),
        
    //     edge(<cb>, "-|>", <cb1>),
    //     edge(<cb1>, "-|>", <cb2>),
    //     edge(<cb2>, "-|>", <bc-cb>, label: $1$),

    //     edge(<ac>, "-|>", <ac1>),
    //     edge(<ac1>, "-|>", <ca-cc-ac>, label: $1$),
        

    //     edge(<ca>, "-|>", <ca-cc>,label: $0$),
    //     edge(<ca-cc>, "-|>", <ca-cc-ac>, label: $0$),
    //     edge(<ca-cc-ac>, "-|>", <ca-cc-ac1>),
    //     edge(<ca-cc-ac1>, "-|>", <ca-cc-ac-aa>, label: $1$),
    //     edge(<ca-cc-ac-aa>, "-|>", <ca-cc-ac-aa-bc-cb>, label: $0$),
    //     edge(<ca-cc-ac-aa-bc-cb>, "-|>", <ca-cc-ac-aa-bc-cb1>),
    //     edge(<ca-cc-ac-aa-bc-cb1>, "-|>", <ca-cc-ac-aa-bc-cb-bb>, label: $1$),
        

    //     edge(<cc>, "-|>", <ca-cc>, label: $1$),
    //   )
    // ]
    
    
    $
    "bb"&: p = 0.36; quad 00      quad&(2 "bits")   \
    "ab"&: p = 0.18; quad 10      quad&(2 "bits")   \
    "ba"&: p = 0.18; quad 101     quad&(3 "bits")   \
    "aa"&: p = 0.09; quad 0100    quad&(4 "bits")  \
    "bc"&: p = 0.06; quad 0110    quad&(4 "bits")  \
    "cb"&: p = 0.06; quad 01111   quad&(5 "bits")  \
    "ac"&: p = 0.03; quad 011011  quad&(6 "bits")  \
    "ca"&: p = 0.03; quad 010100  quad&(6 "bits")  \
    "cc"&: p = 0.01; quad 010101  quad&(6 "bits")  \
    $

    $
      L &= 0.36 dot.op 2 + 0.18 dot.op 2 + 0.18 dot.op 3 + 0.09 dot.op 4 \ 
        &space + 0.06 dot.op 4 + 0.06 dot.op 5 + 0.03 dot.op 6 + 0.03 dot.op 6 + 0.01 dot.op 6\ 
        &= 2.94 "bits/superpalavra"
    $

    Obtemos um ganho utilizando superpalavras pois a quantidade de bits por símbolo é menor.
       
+ Escreva um programa para comprimir e descomprimir arquivos de texto usando códigos de Huffman. Seu programa deve:
  - Determinar a frequência de cada caractere do arquivo de entrada.
  - Utilizar essas frequências para construir o código de Huffman.
  - Comprimir o arquivo de entrada .txt usando o código de Huffman, gerando um arquivo de saída com extensão .bin.
  - Descomprimir o arquivo de saída .bin , gerando um arquivo .txt idêntico ao arquivo de entrada.
  Por simplicidade, assuma que o código de Huffman seja conhecido tanto na compressão quanto na descompressão — na prática, o código deve ser armazenado no arquivo de saída para que o arquivo de entrada possa ser descomprimido. Teste seu programa com o livro Alice’s Adventures in Wonderland, de Lewis Carroll, disponível em https://www.gutenberg.org/files/11/11-0.txt. Para este caso, determine:

  + A entropia da distribuição de frequências dos caracteres livro.

    $
      H(X) = 4.60 "bits" 
    $

  + O comprimento médio do código de Huffman obtido.

    $
      l = 4.64 "bits/simbolo"
    $


  + O tamanho (em bytes) e a taxa de compressão do arquivo comprimido.

  O arquivo comprimido possui 95591 bytes e a taxa de compressão é de 41.68%.