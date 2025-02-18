#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

#import fletcher.shapes: house, hexagon

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#set par(spacing: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Avaliação Canais Binários Assimétricos",
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

Seja o canal binario assimetrico

#figure(
  image("./assets/bsa.png"),
)

Calculando as probabilidades condicionais por caminho da treliça

$
  p(y=0|x=0) &= 1 dot.op (1-q) dot.op (1-p_2)\
  p(y=1|x=0) &= 1 dot.op (1-q) dot.op p_2\ \

  p(y=0|x=1) &= [p_1 dot.op (1-q) dot.op (1-p_2)] + [(1-p_1) dot.op (1-q) dot.op p_2]\
  p(y=1|x=1) &= [(1-p_1) dot.op (1-q) dot.op (1-p_2)] + [p_1 dot.op (1-q) dot.op p_2]\ \

  p(y=e|x=0) &= 1 dot.op q \
  p(y=e|x=1) &= [(1-p_1) dot.op q] + [p_1 dot.op q]
$

Com os valores dados pelo enunciado 

$
  p(x=0) &= 0.65\
  p(x=1) &= 0.35\
     p_1 &= 0.25\
     p_2 &= 0.10\
       q &= 0.05
$

Podemos então calcular os valores de $p(y|x)$

$
  p(y=0|x=0) &=0.855\
  p(y=1|x=0) &=0.095\
  p(y=0|x=1) &=0.285\
  p(y=1|x=1) &=0.665\
  p(y=e|x=0) &=0.05\
  p(y=e|x=1) &=0.05\
$

Com os valores do enunciado também podemos calcular $H(x)$

$
  H(X) &= p(x=0) log_2 1/p(x=0) + p(x=1) log_2 1/p(x=1)\
       &= 0.863
$

Com os valores obtidos de $p(y|x)$, podemos calcular $H(Y)$

$
  H(Y) &= p(y=0) log_2 1/p(y=0) + p(y=1) log_2 1/p(y=1)\
       &= 0.802
$

Com os valores das probabilidades condicionais, caculamos então $H(Y|X=x_i)$

$
  H(Y|X) &= sum_y sum_x p(x|y) log_2 1/p(y|x) \
         &= 0.869
$

Com isso calculamos a capacidade do canal

$
  I(X;Y) &= H(X) - H(Y|X)\ 
         &= 0.265
$


