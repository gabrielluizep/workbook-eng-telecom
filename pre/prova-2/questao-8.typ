#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Prova 2",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "19 de Setembro de 2023",
  doc,
)

= Questão
// TODO: Verificar se `"Unif"` é a maneira correta de escrever a distribuição uniforme no typst.
Sejam $U_1, U_2, U_3 dash.wave "Unif"({0,1,2})$ variáveis aleatórias sorteadas
independentemente. Sejam

$ X = U_1 + U_2 + U_3 \ Y = U_1 + U_2 - U_3 $

#set enum(numbering: "(a)")

+ Determine a PMF conjunta de $X$ e $Y$.
+ Determine e esboce as PMFs marginais de $X$ e $Y$.
+ Determine e esboce as PMFs de $X$ dado que $Y = y$, para dois valores de $y in S_Y$ à
  sua escolha.

#pagebreak();

= Desenvolvimento

== PMF conjunta de $X$ e de $Y$

#let values = ()

#for i in (0, 1, 2) {
  for j in (0, 1, 2) {
    for k in (0, 1, 2) {
      let x = i + j + k
      let y = i + j - k

      values.push([$#i$])
      values.push([$#j$])
      values.push([$#k$])
      values.push([$1/27$])
      values.push([$#x$])
      values.push([$#y$])
    }
  }
}

// typstfmt::off
#table(
  columns: (1fr, 1fr, 1fr, 2fr, 2fr, 2fr),
  inset: 10pt,
  align: (horizon + center),
  [$U_1$], [$U_2$], [$U_3$], [$Pr[U_1 and U_2 and U_3]$], [$X=U_1 + U_2 + U_3$], [$Y=U_1 + U_2 - U_3$],
  ..values
)
// typstfmt::on

== PMFs marginais de $X$ e $Y$
// typstfmt::off
#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 10pt,
  align: (horizon + center),
  [         ], [$y=-2$], [$y=-1$], [$y=0$ ], [$y=1$ ], [$y=2$], [$y=3$], [$y=4$], [$p_X (x)$],
  [$x=0$    ], [      ], [      ], [$1/27$], [      ], [      ], [      ], [      ], [$1/27$],
  [$x=1$    ], [      ], [$1/27$], [      ], [$2/27$], [      ], [      ], [      ], [$3/27$],
  [$x=2$    ], [$1/27$], [      ], [$2/27$], [      ], [$3/27$], [      ], [      ], [$6/27$],
  [$x=3$    ], [      ], [$2/27$], [      ], [$3/27$], [      ], [$2/27$], [      ], [$7/27$],
  [$x=4$    ], [      ], [      ], [$3/27$], [      ], [$2/27$], [      ], [$1/27$], [$6/27$],
  [$x=5$    ], [      ], [      ], [      ], [$2/27$], [      ], [$1/27$], [      ], [$3/27$],
  [$x=6$    ], [      ], [      ], [      ], [      ], [$1/27$], [      ], [      ], [$1/27$],
  [$p_Y (y)$], [$1/27$], [$3/27$], [$6/27$], [$7/27$], [$6/27$], [$3/27$], [$1/27$], [$1$   ],
)
// typstfmt::on

=== Esboços das PMFs marginais de $X$ e $Y$

#image("./assets/marginal-x.svg")
#image("./assets/marginal-y.svg")

== PMFs de $X$ dado que $Y = y$

#image("./assets/condicionais-x.svg")

== PMFs de $Y$ dado que $X = x$

#image("./assets/condicionais-y.svg")

= Resultados

Ao final do desenvolvimento obtivemos a partir do software de computação
numérica Octave os seguintes resultados após desenvolvido o seguinte script:

#raw(read("./questao-8.m"), lang: "matlab", block: true)