#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/physica:0.8.0": evaluated
#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Prova 3",
  subtitle: "Processos Estocásticos",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "3 de Outubro de 2023",
  doc,
)

= Questão

Considere duas variáveis aleatórias $X$ e $Y$ com PDF conjunta constante (igual
a $k$) e diferente de zero apenas na área sombreada da figura abaixo.

#align(center)[
  #canvas(length: 1cm, {
    plot.plot(
      size: (8, 6),
      x-tick-step: 10,
      y-tick-step: 10,
      x-min: -10,
      x-max: 10,
      y-min: 0,
      y-max: 10,
      axis-style: "school-book",
      {
        plot.add(
          hypograph: true,
          style: plot.palette.blue(0),
          domain: (-10, 0),
          x => x + 10,
        )

        plot.add(
          hypograph: true,
          style: plot.palette.blue(0),
          domain: (0, 10),
          x => -x + 10,
        )
      },
    )
  })
]

#set enum(numbering: "(a)")

+ Determine o valor da constante $k$;
+ Determine $Pr[X>=Y]$;
+ Determine e esboce a PDF marginal de $Y$;
+ Determine e esboce a CDF marginal de $Y$;
+ Determine e esboce a PDF condicional de $Y$ dado $X = 5$;
+ Determine a covariância entre $X$ e $Y$.

#pagebreak()

= Desenvolvimento

== Determinando a área sombreada

Para determinar a área sombreada dada pela questão reparti a área em duas partes
de modo que fosse possível descrever de maneira simples a área sombreada.

#let eq1 = $[0 <= y <= x+10]$
#let eq2 = $[0 <= y <= -x+10 ]$

#grid(
  columns: (1fr, 1fr),
  rows: 2,
  row-gutter: 2em,
  [
    A primeira área consiste no triangulo formado pela reta $y = x + 10$ vista no
    intervalo de $-10 < x < 0$. Portanto obtem-se a área parametrizada:

    #v(2em)

    $ eq1 $
  ],
  [
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
              domain: (-10, 0),
              x => x + 10,
            )
          },
        )
      })
    ]
  ],
  [
    #align(center)[
      #canvas(length: 1cm, {
        plot.plot(
          size: (8, 6),
          x-tick-step: 10,
          y-tick-step: 10,
          x-min: 0,
          x-max: 10,
          y-min: 0,
          y-max: 10,
          axis-style: "school-book",
          {
            plot.add(
              hypograph: true,
              style: plot.palette.blue(0),
              domain: (0, 10),
              x => -x + 10,
            )
          },
        )
      })
    ]
  ],
  [
    A segunda área consiste no triangulo formado pela reta $y = -x + 10$ vista no
    intervalo de $0 < x < 10$. Obtendo-se a área parametrizada:

    #v(2em)

    $ eq2 $<second>
  ],
)

A área sombreada é a união das duas áreas anteriormente descritas, portanto:

#let eq3 = $eq1 or eq2$
$ eq3 $

#align(center)[
  #canvas(length: 1cm, {
    plot.plot(
      size: (8, 6),
      x-tick-step: 10,
      y-tick-step: 10,
      axis-style: "school-book",
      {
        plot.add(
          hypograph: true,
          style: plot.palette.blue(0),
          domain: (-10, 0),
          x => x + 10,
        )

        plot.add(
          hypograph: true,
          style: plot.palette.blue(0),
          domain: (0, 10),
          x => -x + 10,
        )
      },
    )
  })
]

Sabendo que a função massa de probabilidade conjunta é constante de deve ter
valor igual a $k$ na área sombreada, temos que

$ A = A_1 = A_2 = (10 dot.op 10)/2 $

$
A_t = A_1 + A_2 = 2 A = 2 dot.op (10 dot.op 10)/2 \
A_t = cancel(2) dot.op (10 dot.op 10)/cancel(2) = 100 \
$

== Determinando o valor de $k$

Sabendo que a função massa de probabilidade conjunta é constante de deve ter
valor total igual a $1$, podemos obter o valor da constante $k$ resolvendo a
igualdade:

$
A_t k = 1 \
k = 1/A_t \
k = 1/100
$

$ f_(X,Y)(x,y) = 1/100 (eq3) $

== Determinando $Pr[X>=Y]$

Determinamos a probabilidade de $X >= Y$ sendo a intersecção entre a área
sombreada e a área $X >= Y$ e a área sombreada $eq3$. Portanto:

#align(
  center,
)[
  #canvas(
    length: 1cm,
    {
      plot.plot(
        size: (8, 6),
        x-tick-step: 5,
        y-tick-step: 5,
        axis-style: "school-book",
        {
          plot.add(
            hypograph: true,
            style: plot.palette.blue(0),
            domain: (-10, 0),
            x => x + 10,
          )

          plot.add(
            hypograph: true,
            style: plot.palette.blue(0),
            domain: (0, 10),
            x => -x + 10,
          )

          plot.add(hypograph: true, style: plot.palette.tango(0), domain: (0, 10), x => x)
        },
      )
    },
  )
]

#align(
  center,
)[
  #canvas(
    length: 1cm,
    {
      plot.plot(
        size: (8, 6),
        x-tick-step: 5,
        y-tick-step: 5,
        axis-style: "school-book",
        {
          plot.add(hypograph: true, style: plot.palette.tango(0), domain: (0, 5), x => x)

          plot.add(
            hypograph: true,
            style: plot.palette.tango(0),
            domain: (5, 10),
            x => -x + 10,
          )
        },
      )
    },
  )
]

Visualmente concluimos que a $Pr[X >= Y] = 1/4$, podemos confirmar isso
calculando a área deste triangulo gerado pela intersecção das áreas e dividindo
pela área total.

#grid(columns: (1fr, 1fr), rows: 1, [$
  &A_Delta = 1/2 dot.op 10 dot.op 5 = 25 \
  &A_t = 100
  $], [$
  &Pr[X >= Y] = A_Delta/A_t \
  &Pr[X >= Y] = 1/4
  $])

== Determinando a PDF marginal de $Y$

Para calcular a PDF marginal de $Y$ devemos integrar a PDF conjunta em relação a $X$,
portanto utilizo a seguinte formula:

$
f_Y (y) &= integral_(-oo)^(oo) f_(X,Y)(x,y) dif x \
$

Noto que existem três situações possíveis para a análise da PDF marginal de $Y$,
ela terá valor zero para quando o valor de $y$ for menor que $0$ ou maior que $10$,
e terá valor diferente de zero quando $0 < y < 10$. Portanto:

#grid(columns: (1fr, 1fr), rows: 1, [
  Para $-oo < y < 0 "ou para" 10 < y < oo $:
  $ f_Y (y) &= integral_(-oo)^(oo) 0 dif x = 0 $
], [
  Para $0 < y < 10$:

  $
  f_Y (y) &= integral_(y-10)^(-y-10) 1/100 dif x
  $
])

Portanto para $0 < y < 10$:

$
f_Y (y) &= 1/100 evaluated(x)_(y-10)^(-y-10) \
f_Y (y) &= 1/100 (-y-10 - (y-10)) \
f_Y (y) &= 1/100 (-2y + 20) \
f_Y (y) &= -2/100 y + 1/5 \
f_Y (y) &= 1/5 - y/50
$

== Determinando a CDF marginal de $Y$

$
F_Y (y) &= integral_(-oo)^y f_Y (u) dif u \
F_Y (y) &= integral_(-oo)^y (1/5 - u/50) dif u \
F_Y (y) &= 1/5y - y^2/100 evaluated(u)_(0)^y \
F_Y (y) &= 1/5y - y^2/100 - 1/5(0) + (0)^2/100 \
F_Y (y) &= 1/5y - y^2/100 \
$

== Determinando a PDF condicional de $Y$ dado $X = 5$

#grid(columns: (1fr, 1fr), rows: 2, row-gutter: 2em, align(center)[$
  f_X (x) &= integral_(-oo)^(oo) f_(X,Y)(x,y) dif y \
  &= integral_(0)^(-x+10) 1/100 dif y \
  &= 1/100 evaluated(y)_(0)^(-x+10) \
  &= 1/100 (-x+10 - 0) \
  &= 1/100 dot.op -x+10
  $], align(center)[$
  f_X (5) &= 1/100 dot.op -5+10 \
  &= 1/100 dot.op 5 \
  &= 1/20
  $])

$
f_(Y|X=5) (y) &= (f_(X,Y)(5,y))/(f_X (5)) \
&= (1/100)/(1/20) = 1/100 dot.op 20/1 \
&= 1/5
$

#pagebreak()

== Determinando a covariancia entre $X$ e $Y$

$
"cov"[X,Y] &= E[(X-mu_x)(Y-mu_y)] \

"cov"[X,Y] &= E[X Y] - E[X]E[Y] \
$

Obs.: $f_(X,Y) (x,y) = -y/5$
$
E[X Y] &= integral_(-oo)^(oo)integral_(-oo)^(oo) x y f_(X,Y)(x,y) dif x dif y \
&= integral_(0)^(10)integral_(y-10)^(-y-10) x y (-y/5) dif x dif y \
&= integral_(0)^(10)integral_(y-10)^(-y-10) (-x y^2)/5 dif x dif y \
&= -1/5 integral_0^10 y^2 integral_(y-10)^(-y-10) x dif x dif y \
&= -1/5 integral_(-10)^(10) y^2 dot.op evaluated(x^2/2)^(-y-10)_(y-10) dif y \
&= -1/5 integral_(-10)^(10) y^2 dot.op [(-y-10)^2/2 - (y-10)^2/2] dif y \
&= -1/5 integral_(-10)^(10) y^2 dot.op [(y^2 + 20y + 100)/2 - (y^2 - 20y + 100)/2] dif y \
&= -1/5 integral_(-10)^(10) y^2 dot.op (cancel(y^2) + 20y + cancel(100) - cancel(y^2) + 20y - cancel(100))/2 dif y \
&= -1/5 integral_(-10)^(10) y^2 dot.op (20y) dif y \
&= -1/5 integral_(-10)^(10) 20y^3 dif y \
&= -4 dot.op evaluated(y^4/4)_(-10)^(10) \
&= -4 dot.op (10^4/4 - (-10)^4/4) \
&= -4 dot.op (10^4 - 10^4)/4 \
&= 0
$

Obs.: $f_X (x) = 1/10$
$
E[X] &= integral_(-oo)^(oo) x f_X (x) dif x \
&= integral_(-10)^(10) x (1/10) dif x \
&= 1/10 integral_(-10)^(10) x dif x \
&= 1/10 dot.op evaluated(x^2/2)_(-10)^(10) \
&= 1/10 dot.op (10^2/2 - (-10)^2/2) \
&= 1/10 dot.op (100/2 - 100/2) \
&= 0
$

Realizados os cálculos, obtivemos informação suficiente para obter o resultado
da covariância:

$
"cov"[X,Y] &= E[X Y] - E[X]E[Y] \
&= 0 - 0 dot.op E[Y] \
&= 0
$

= Plots gerados

#image("./assets/plots.svg")