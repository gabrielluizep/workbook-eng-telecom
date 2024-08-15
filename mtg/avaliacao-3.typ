#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Avaliação 3",
  subtitle: "Meios de Transmissão Guiados",
  authors: ("Gabriel Luiz Espindola Pedro",),
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")

= Questão 1

Uma LT de microfitacom $6"cm"$ de comprimento é terminada em uma carga resistiva de $100 Omega$. A linha de sinal possui $0,692"mm"$ de largura no topo de um substrato de polietileno com $0,5"mm"$ de espessura. ($epsilon_r = 2,26$ para polietileno)

Extraindo as informações do enunciado:

$
cal(l) &= 6"cm" \
R_L &= 100 Omega \
w &= 0,692"mm" \
epsilon_r &= 2,26 \
h &= 0,5 "mm" \
f &= 1 "GHz"
$


+ Qual é a impedância da linha?
+ Qual a impedância da entrada desta linha em $1 "GHz"$?
+ Qual é o valor máximo de frequência para o qual esta microfita opera?

#pagebreak()

= Questão 2

Considere o WR975 preenchido com polietileno. Determine para $600 "MHz"$ (WR975: $a = 9,75''$, $b = 4,875''$, $1'' = 2,54 "cm"$ $epsilon_r = 2,26$):

Extraindo as informações do enunciado:

$
f &= 600 "MHz" \
a &= 9,75'' &&= 24,765 "cm" \
b &= 4,875'' &&= 12,3825 "cm" \
epsilon_r &= 2,26
$

+ $u_u$

$
u_u 
&= c/sqrt(e_r) \
&= (3 dot.op 10^8)/sqrt(2.26) \
&= 199,55 "MHz"
$

+ $u_p$
+ $u_G$

#pagebreak()

= Questão 3

A análise de uma linha de microfita com $2,56 "cm"$ de comprimento revela que ela possui uma impedância característica de $50 Omega$ e uma permissividade relativa efetiva de $5,49$. Ela é terminada por um resistor de $60 Omega$ em série com um capacitor de $1,42 "pF"$. Determine a impedância de entrada vista nesta linha terminada em $1,6 "GHz"$.

#pagebreak()

= Questão 4

Um guia de onda retangular de seção transversaç com dimensões $4,0 "cm"$ por $2,5 "cm"$, preenchido com plástico ($epsilon_r = 2,9$), é utilizado para suportar a propagação de um sinal a $3,0 "GHz"$. 

+ Determine a frequência de corte para o modo fundamental nesse guia.
+ Calcule as 6 primeiras frequências de diferentes modos de operação de um guia com essas dimensões do guia dado na questão.
+ Quantos modos de propagação são suportados por esse guia em $3,0 "GHz"$? Justifique.
