#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge
#import "@preview/cetz:0.1.2": canvas, plot


Teoria da informação

Shannon, 1949

A Mathematical Theory of Communication

Bell Labs

"Como quantifica informação"

No contexto de sistemas de comunicação


#align(center)[
  #diagram(
    spacing: (4em, 2em), // wide columns, narrow rows
    node-stroke: 1pt, // outline node shapes
    edge-stroke: 1pt, // make lines thicker
    mark-scale: 60%, // make arrowheads smaller
    label-size: 8pt,
    
    
    node((-1,-1), "Fonte", name:<f>),
    edge(<f>,"-|>", <t>),
    node((0,-1), "Transissor", name:<t>),
    edge((0,-1),"-|>", <c>, bend: 30deg,),
    node((1,0), "Canal", name:<c>),
    edge(<c>,"-|>", <r>, bend: 30deg),
    node((0,1), "Receptor", name:<r>),
    edge(<r>,"-|>", <d>),
    node((-1,1), "Destino", name:<d>),
  )
]

+ Até quando podemos comprimir uma fonte de informação?
  
  R: #underline()[Entropia] da Fonte

+ Qual a máxima taxa de transmissão de transmissão possível em um #underline()[canal de comunicação], para que se tenha um comunicação confiável?
  
  $
    P_b -> 0
  $

  R: Capacidade do Canal
#align(center)[
  #diagram(
    spacing: (4em, 2em), // wide columns, narrow rows
    node-stroke: 1pt, // outline node shapes
    edge-stroke: 1pt, // make lines thicker
    mark-scale: 60%, // make arrowheads smaller
    label-size: 8pt,
    
    
    node((-1,-1), radius: 0.25em, $0$, name:<in0>),
    node((1,-1), radius: 0.25em, $0$, name:<out0>),
    
    edge(<in0>, "-|>", <out0>, $p$),
    edge(<in0>, "-|>", <out1>, $1-p$),
    edge(<in1>, "-|>", <out0>, $1-p$),
    edge(<in1>, "-|>", <out1>, $p$),

    node((-1,1), radius: 0.25em, $1$, name:<in1>),
    node((1,1), radius: 0.25em, $1$, name:<out1>),
  )
]

= Fontes informação e Entropia

Uma #underline()[fonte de informação] é modelada por um #underline()[processo estocástico].

Nesta disciplina: apenas o caso i.i.d de tempo discreto.

Def: Uma fonte discreta sem memória (DMS) é caracterizada por uma única VA $X$, de alfabeto $cal(X)$ e pmf $p_X$.

= Informação de um eventeo "$X = x$"

#align(center)[
  #diagram(
    spacing: (4em, 2em), // wide columns, narrow rows
    node-stroke: 1pt, // outline node shapes
    edge-stroke: 1pt, // make lines thicker
    mark-scale: 60%, // make arrowheads smaller
    label-size: 8pt,
    
    
    node((-1,0), "Fonte", name:<f1>),
    node((-1,1), [#emoji.face.think], name:<doubt>),
    edge((-1,0), "r", "-|>"),

    node((1,0), "Fonte", name:<f2>),
    node((1,1), [#emoji.face.surprise], name:<surprise>),
    edge((1,0), "r", "-|>", $X = x$),

    edge(<doubt>, "-|>", <surprise>, [recebeu $I(x)$ de informação]),
  )
]

$
  I(X=x) = log(1/p_X(x))
$

// plot I(x) = log(1/p(x))
#align(center)[
  #canvas(length: 1cm, {
    plot.plot(
      size: (8, 6),
      x-tick-step: 10,
      y-tick-step: 10,
      y-min: 0,
      y-max: 10,
      axis-style: "school-book",
      {
        plot.add(
          hypograph: true,
          style: plot.palette.blue(0),
          domain: (0.0001, 1),
          x => 1/x,
        )
      },
    )
  })
]

Propriedades:

#let bit = $"bit"$
#let bits = $"bits"$

+ $I(X=x) >= 0$
+ $I(X=x)$ é decrescente com $p_X(x)$

Ex: $cal(X) = {0,1} quad p_x = [underbrace(1/2,0), underbrace(1/2,1)]$  

$
  X tilde "Bernoulli"(1/2)
$

$
  I(X=0) &= log(1/(p_x (0)))\
          &= log(1/(1/2))\
          &= log(2)\
          &= 1 bit \
  I(X=1) &= log(1/(p_x (1)))\
          dots.v\
          &= 1 bit
$

Ex: $cal(X) = {0,1} quad p_x = [underbrace(3/4,0), underbrace(1/4,1)]$  

$
  X tilde "Bernoulli"(1/4)
$

$
  I(X=1) &= log(1/(p_x (1)))\
          &= log(1/(1/4))\
          &= log(4)\
          &= 2 bits \
  I(X=1) &= log(1/(p_x (0)))\
         &= log(1/(3/4))\
         &= log(4/3)\
         &= 0.415 bits \
$

= Unidades de informação

- Base 2: bits ou Shannons
- Base 3: trits
- Base 4: dibits #strike()[ou quats?]
- Base 10: Hartley ou bits decimais
- Base $e$: nats

$
  log_10 (10) &= 1 "Hartley" \
  log_2 (10)  &= 3.32 bits  
$

= Entropia de uma DMS

A entropia é o valor esperado da informação:

$
  H(x) = sum_(x in cal(X)) p_x (x) log(1/(p_x (x)))
$

Ex: 
$
cal(X) = {0,1} quad p_x = [underbrace(1/2,0), underbrace(1/2,1)]\
therefore H(x) = 1 bit
$ 

$
cal(X) &= {0,1} quad p_x = [underbrace(3/4,0), underbrace(1/4,1)]\
therefore H(x) &= 3/4 log_2 (4/3)+ 1/4 log_2 (4) \
               &= 0.811 bit
$

$
cal(X) &= {suit.spade, suit.heart, suit.diamond, suit.club} quad p_x = [1/2, 1/4, 1/8, 1/8]\
therefore H(x) &= 1/2 log_2 (2) + 1/4 log_2 (4) + 1/8 log_2 (8) + 1/8 log_2 (8) \
               &= 1.75 bits
$

$
cal(X) &= {suit.spade, suit.heart, suit.diamond, suit.club} quad p_x = [underbrace(1/4,00), underbrace(1/4,01), underbrace(1/4,10), underbrace(1/4,11)]\
therefore H(x) &= 1/4 log_2 (4) + 1/4 log_2 (4) + 1/4 log_2 (4) + 1/4 log_2 (4) \
               &= 2 bits
$