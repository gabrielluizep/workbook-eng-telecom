#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge
#import "@preview/cetz:0.1.2": canvas, plot

= Compressão de fonte

  #align(center)[
    #diagram(
      spacing: (10mm, 5mm), // wide columns, narrow rows
      node-stroke: 1pt, // outline node shapes
      edge-stroke: 1pt, // make lines thicker
      mark-scale: 60%, // make arrowheads smaller

      node((-3,0), [Fonte]),
      edge((-3,0), "rr", "-|>", $X_i in cal(X)$),

      node((-1,0), [Codificador de fonte]),
      edge((-1,0), "r,dd,l", "..|>", [bits]),
      
      node((-1,2), [Decodificador de fonte]),
      edge((-1,2), "ll", "-|>", $hat(X)_i in cal(X)$),
      
      node((-3,2), [Destino]),
    )
  ]

  - Compressão sem perdas (lossless): $hat(X)_i = X$
  - Compressão com perdas (lossy): $hat(X)_i approx X$


= Códigos símbolo-a-símbolo "symbol codes"

  Um codificador de fonte símbolo-a-símbolo para uma DMS com alfabeto $cal(X)$ é dado por um mapeamento

  $
    "Enc:" cal(X) -> {0,1}^+ = {0,1,00,01,10,11,000,001,010,011,100,101,110,111, ...}
  $

  Exemplo: $cal(X) = {a,b,c,d}; quad p_x [1"/"2, 1"/"4, 1"/"8, 1"/"8]$
  #let Enc = "Enc"

  #table(
    columns: (1fr, 2fr,2fr,2fr,2fr),
    align: (center + horizon),
    stroke: rgb("f1f1f1"),
    fill: (_, y) => if y == 0 {rgb("f1f1f1")},
    table.header($$, $Enc_1$, $Enc_2$, $Enc_3$, $Enc_4$),

    $a$, $00$, $0$, $0$, $0$,
    $b$, $01$, $01$, $01$, $1$,
    $c$, $10$, $000$, $001$, $00$,
    $d$, $11$, $001$, $0001$, $11$
  )

  Def: Um código é dito ser #underline()[unicamento decodificável (u.d.)] se


  $
    x_1 x_2 x_3 dots + x_1^' x_2^' x_3^' dots \
    Enc(x_1) Enc(x_2) Enc(x_3) dots + Enc(x_1^') Enc(x_2^') Enc(x_3^') dots \
  $

  Def: Um código é dito ser #underline()[livre-de-prefixo (p.f.)] se nenhuma palavra-código é prefixo de outra.

  Fato: 

  $
    "p.f." => "u.d."
  $

  // árvore deitada

  Árvore: $Enc_2$
  #align(center)[
    #diagram(
      spacing: (10mm, 5mm), // wide columns, narrow rows
      node-stroke: 1pt, // outline node shapes
      edge-stroke: 1pt, // make lines thicker
      mark-scale: 60%, // make arrowheads smaller

      node((0,0), "", name:<0>),
      node((1,-1), [a], name:<a>),
      node((1,1), "", name:<1>),
      edge(<0>, "-|>", <a>, 1),
      edge(<0>, "-|>", <1>, 0),
      edge(<1>, "-|>", <b>, 1),
      edge(<1>, "-|>", <2>, 0),
      edge(<2>, "-|>", <c>, 1),
      edge(<2>, "-|>", <d>, 0),
      node((2,0), [b],name:<b>),
      node((3,1), [c],shape: circle,name:<c>),
      node((2,2), "", name:<2>),
      node((3,3), [d],name:<d>),
    )
  ]

  O comprimento médio de um código (considerando uma DMS) é 

  $
    overline(l) = E[l(x)] = sum_{x in cal(X)} p_x l(x)
  $

  Onde $l(x)$ é o número de bits em $Enc(x)$

  Exemplo:

  #let bpl = "bits/letra"
  $
    Enc_1&: overline(l) = 1/2 * 2 + 1/4 * 2 + 1/8 * 2 + 1/8 * 2 = 2 bpl\
    Enc_2&: overline(l) = 1/2 * 1 + 1/4 * 2 + 1/8 * 3 + 1/8 * 3 = 1.75 bpl\
    Enc_3&: overline(l) = 1/2 * 1 + 1/4 * 2 + 1/8 * 3 + 1/8 * 4 = 1.875 bpl\
    Enc_4&: overline(l) = 1/2 * 1 + 1/4 * 1 + 1/8 * 2 + 1/8 * 2 = 1.25 bpl\
  $