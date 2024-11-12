#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode

#set text(size: 12pt, font: "FreeSans", lang: "pt")
// #show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Lista 1",
  subtitle: "Comunicações Sem Fio",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "14 de Outubro de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")
#set enum(numbering: "1.a)")

= Síntese das seções 5.5 e 5.6 do livro de Rappaport

- Tipos de atenuação em pequena escala
  - Efeitos de atenuação por conta do espalhamento por atraso de tempo em caminhos múltiplos
    - Atenuação uniforme
    - Atenuação seletiva de frequência
  - Efeitos de atenuação devidos ao espalhamento Doppler
    - Atenuação rápida
    - Atenuação lenta

Ao analisar as atenuações em pequena escala, podemos classificá-las em diferentes tipos, considerando como base as características do sinal transmitido e do canal de transmissão. Essas atenuações podem ser divididas em dois grupos principais: aquelas causadas pelo espalhamento por atraso de tempo em caminhos múltiplos e aquelas devidas ao espalhamento Doppler.

Os efeitos de atenuação devido ao espalhamento por atraso de tempo em caminhos múltiplos pode ser classificada em dois tipos: atenuação plana e atenuação seletiva de frequência. A atenuação plana ocorre quando a largura de banda de coerência do canal é muito maior que a largura de banda do sinal transmitido, enquanto a atenuação seletiva de frequência ocorre quando a largura de banda de coerência do canal é menor que a largura de banda do sinal transmitido.

Ao analisar os efeitos causados pelo espalhamento Doppler, podemos classificá-los em dois tipos: atenuação rápida e atenuação lenta. A atenuação rápida ocorre quando o período do sinal é maior que o tempo de coerência do canal ou quando a frequência de Doppler é muito alta em comparação à largura de banda do sinal. Caso contrário, a atenuação é considerada lenta.

Para a comunicação de rádios móveis, duas distribuições de atenuação de sinal são comumente utilizadas: Rayleigh e Ricean. A escolha entre elas depende do ambiente de propagação do sinal. A distribuição Ricean é usada quando há linha de visada entre as antenas comunicantes. À medida que a amplitude de pico do sinal ($A$) tende a zero, a distribuição Ricean converge para a distribuição Rayleigh.

A distribuição Ricean é dada por

$
  p(r) =  cases(
            r/sigma^2  exp(-(r^2 + A^2)/(2sigma^2)) dot.op I_0((A r)/ sigma^2) &quad "para" A >= 0"," r>=0,
            0  &quad "para" r <0 
          )
$

A distribuição Rayleigh é uma distribuição de atenuação mais generalista para comunicações móveis, obtida a partir da soma quadrática de duas variáveis gaussianas, que representam a parte real e a parte imaginária de um sinal complexo em um canal de comunicação móvel.

A distribuição Rayleigh é dada por
$
  p(r) = cases(
            r/sigma^2  exp(-r^2/(2sigma^2)) &quad "para" r>=0,
            0  &quad "para" r <0 
          )
$

