#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Filtros IIR",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "08 de Agosto de 2024",
  doc,
)


#show figure.caption: set text(10pt, style: "italic")

= Questão 1

+ Usando a transformação bilinear, projete um filtro passa-baixas Butterworth que atenda as seguintes especificações:

  $
  0.9 <= |H(e^(j omega))| <= 1, &quad 0 <= omega <= 0.2pi \
  |H(e^(j omega))| <= 0.2, &quad 0.3pi <= omega <= pi
  $

  Considere $T_s = 2$

  Faça o mesmo projeto usando o `MATLAB` ou `SIMULINK`. Plote a resposta em frequência.


== Resolução

Inicialmente, a partir das definições das especificações do filtro foi feito o processo de pré-distorção do sinal, como visto na @bilinear.

Portanto a transformação bilinear mapeia frequências analógicas em digitais como abaixo:

$
Omega -> 2/T_s  tan(omega/2)
$<bilinear>

#sourcecode()[```matlab
wp = 0.2*pi;
wr = 0.3*pi;
ts = 2;

omega_ap = (2/ts)*tan(wp/2)
omega_ar = (2/ts)*tan(wr/2)
```]

Em seguida, foi feito a normalização como visto na @tabela-transformacoes, das frequências pré-distorcida, onde: $a$ igual à 1, e calculamos as frequências normalizadas $omega'_p$ e $omega'_r$.

#figure(
  caption: [Transformações na frequência analógica],
  table(
    columns: (2fr, 1fr, 1fr),
    align: horizon,

    table.header([Transformação], [Normalização], [Desnormalização]),

    $"passa-baixas"(Omega) <-> "passa-baixas"(Omega')$,$ Omega'_p = 1/a \ Omega'_r = 1/a Omega_r/Omega_p $, $ s' <-> 1/a s/Omega_p $
  )
)<tabela-transformacoes>

Após a normalização das frequências, foi implementado o cálculo das atenuações, como visto na @tabela-atenuacoes, onde: definimos os valores de atenuação desejados $sigma_p$ e $sigma_r$, e calculamos as atenuações em decibéis $A_p$ e $A_r$.

#figure(
  caption: [Atenuações],
  table(
    columns: (3fr, 2fr, 3fr, 2fr),
    align: horizon,

    table.header([],[Ondulação], [Ganho \[dB\]], [Atenuação\[dB\]]),

   [Faixa de passagem],$delta_p$,$G_p=20log(1-delta_p)$, $A_p =-G_p$,
   [Faixa de rejeição],$delta_r$,$G_r=20log(delta_r)$, $A_r =-G_r$
  )
)<tabela-atenuacoes>

Depois foi calculado os parâmetros do filtro, em que: calculamos o valor de $epsilon$, como visto no @calculo-epsilon, usando as atenuações desejadas, calculamos o numerador, como visto na @calculo-n, e o denominador necessários para determinar a ordem do filtro $n$, e arredondamos $n$ para o próximo número inteiro.


$
epsilon = sqrt((10^(0.1*A_p))-1)
$<calculo-epsilon>

$
n = ceil(log((10^(0.1*A_r)-1) / epsilon^2) / (2*log(Omega'_r)))
$<calculo-n>

#sourcecode()[```matlab
eps = sqrt((10^(0.1*atenuacao_p))-1)

num = log10((10^(0.1*atenuacao_r)-1) / eps^2);
den = 2*log10(omega_r_linha);

n = ceil(num/den)
```]

Seguidamente foi cálculado as raízes de $s'$, onde: Utilizamos a função `roots()` para encontrar as raízes da equação $1+epsilon^2(-s'^2)^n =0$. Estas raízes são armazenadas em uma matriz.

#sourcecode()[```matlab
  roots([eps^2 0 0 0 0 0 0 0 0 0 0 0 1])
```]

Para obtermos os coeficientes do filtro $s'$ utilizamos a função `poly()` para obter os coeficientes do filtro a partir das raízes encontradas.

#sourcecode()[```matlab
  poly(roots([eps^2 0 0 0 0 0 0 0 0 0 0 0 1]))
```]

Após a obtenção dos coeficientes do filtro, obtivemos a seguinte expressão:

$
h'(s')&=\ &2.0648 / (1s'^6 + 4.3600s'^5 + 9.5048s'^4 + 13.1362s'^3 + 12.1033s'^2 + 7.0697s +2.0648)
$

Em seguida, foram substituídos os valores de s' pelos valores desnormalizados, utilizando a expressão $s' = (1/a)(s/omega_p)$.

$
h(s) = 0.0024 / (1s^6 + 1.4166s^5 + 1.0034s^4 + 0.4506s^3 + 0.1349s^2+ 0.0256s + 0.0024)
$

Então colocamos os valores dos coeficientes do numerador e do denominador em vetores $b$ e $a$, respectivamente.

#sourcecode()[```matlab
b = [0.0024];
a = [1 1.4166 1.0034 0.4506 0.1349 0.0256 0.0024];
```]

Por fim, foi implementado a aplicação da transformação bilinear, em que: Utilizamos a função `bilinear()` para converter os coeficientes do filtro desnormalizado para o domínio discreto. Assim, retornando os coeficientes do filtro discretizado em `num` e `den`.

#sourcecode()[```matlab
  [num, den] = bilinear(b, a, 1/ts);
```]

#figure(
  image("assets/3.png")
)

#pagebreak()

= Questão 2

+ Crie, usando `MATLAB`, um sinal de entrada composto de três componentes senoidais, nas frequências $770 "Hz"$, $852 "Hz"$ e $941 "Hz"$, com $f_s = 8 "kHz"$. Projete, usando o `SIMULINK` ou o `MATLAB`, um filtro IIR para isolar cada componente. Documente as especificações utilizadas. Faça comentários.


== Resolução

Para iniciarmos a resolução da questão, foi criado um sinal de entrada composto de três componentes senoidais, nas frequências $770 "Hz"$, $852 "Hz"$ e $941 "Hz"$, com $f_s = 8 "kHz"$.

#grid(
  columns: 2,
  rows: 2,
 figure(caption:[Filtro Butterworth],image("assets/5.png")),
 figure(caption:[Filtro Chebyshev I],image("assets/6.png")),
 figure(caption:[Filtro Chebyshev II],image("assets/7.png")),
 figure(caption:[Filtro Elíptico],image("assets/8.png"))
)

Com base nas imagens dos quatro tipos de filtro, podemos comparar a eficiência de cada um na filtragem das componentes. A análise dos filtros seguiu a ordem apresentada no simulador fdatool. O primeiro filtro examinado foi o Butterworth, que apresentou ordem 8, com uma banda de transição maior do que os filtros Chebyshev e Elíptico, além de uma banda de atenuação mais ampla.

O filtro Chebyshev I, de ordem 6, mostrou-se mais seletivo que o filtro Elíptico, mas com uma banda de atenuação menor. O filtro Chebyshev II apresentou um comportamento similar ao Butterworth, porém com uma banda de atenuação menor. Já o filtro Elíptico, também de ordem 6, foi mais seletivo que os filtros Butterworth e Chebyshev II, com uma banda de transição menor e uma banda de atenuação comparável à do Chebyshev I.

Todos os filtros demonstraram estabilidade com os parâmetros selecionados. Como o objetivo é filtrar frequências específicas, optou-se pelo filtro Butterworth. Embora seja mais complexo e custoso de implementar, ele oferece uma banda de atenuação maior, essencial para a filtragem de múltiplas frequências do sinal. A seguir, será realizada uma análise detalhada do filtro Butterworth para as frequências desejadas, utilizando a regra de 10:1.

#grid(
  columns: 2,
  rows: 2,
  figure(caption:[Filtro 770Hz],image("assets/image.png")),
  figure(caption:[Filtro 852Hz],image("assets/9.png")),
  grid.cell(colspan: 2, 
    figure(caption:[Filtro 942Hz],image(width: 50%,"assets/10.png"))
  )
)

Para a filtragem das frequências desejadas, foram utilizados filtros Butterworth de ordem 8, com as seguintes especificações:

- Filtro 770Hz: $f_p = 770 "Hz"$, $f_s = 8 "kHz"$, $A_p = 0.1 "dB"$, $A_r = 60 "dB"$.
- Filtro 852Hz: $f_p = 852 "Hz"$, $f_s = 8 "kHz"$, $A_p = 0.1 "dB"$, $A_r = 60 "dB"$.
- Filtro 942Hz: $f_p = 942 "Hz"$, $f_s = 8 "kHz"$, $A_p = 0.1 "dB"$, $A_r = 60 "dB"$.

#grid(
  columns: 2,
  rows: 2,
  figure(caption:[Filtro 770Hz],image("assets/14.png")),
  figure(caption:[Filtro 852Hz],image("assets/15.png")),
  grid.cell(colspan: 2, 
    figure(caption:[Filtro 942Hz],image(width: 50%,"assets/16.png"))
  )
)

Analisando a fase verificamos que para o filtro de 770Hz temos uma fase próxima de $0 degree$ para sua banda de passagem e fora dela uma praticamente uma variação de aproximadamente $plus.minus 360degree$ (6 radianos). Para os filtros de 852Hz e 942Hz temos uma fase próxima de $-360 degree$ próximo de sua banda de passagem e fora em frequências mais baixas uma fase de $0 degree$ e em frequências mais altas uma fase de $-720 degree$.

#grid(
  columns: 2,
  rows: 2,
  figure(caption:[Filtro 770Hz],image("assets/20.png")),
  figure(caption:[Filtro 852Hz],image("assets/21.png")),
  grid.cell(colspan: 2, 
    figure(caption:[Filtro 942Hz],image(width: 50%,"assets/22.png"))
  )
)

Analisando a resposta ao impulso dos três filtros, verificamos que são identicos.

#grid(
  columns: 2,
  rows: 2,
  figure(caption:[Filtro 770Hz],image("assets/23.png")),
  figure(caption:[Filtro 852Hz],image("assets/24.png")),
  grid.cell(colspan: 2, 
    figure(caption:[Filtro 942Hz],image(width: 50%,"assets/25.png"))
  )
)

Como vemos nas figuras acima todos os filtros são estáveis, uma ve que os polos e zeros estão no circulo de raio unitário.


#figure(caption:[Sinal no tempo e na frequência],image(width: 60%, "assets/32.png"))

Na figura acima podemos verificar as senoides geradas e somadas, tanto no domínio do tempo quanto no domínio da frequência.

#grid(
  columns: 2,
  rows: 2,
  figure(caption:[Filtro 770Hz],image("assets/33.png")),
  figure(caption:[Filtro 852Hz],image("assets/34.png")),
  grid.cell(colspan: 2, 
    figure(caption:[Filtro 942Hz],image(width: 50%,"assets/35.png"))
  )
)

Aplicando individualmente o filtro de 770Hz, 852Hz e 942Hz, obtemos os sinais filtrados, como mostrado nas figuras acima. A filtragem foi bem sucedida, isolando cada componente senoidal do sinal original.

Com estas análises podemos concluir que o filtro Butterworth de ordem 8 é capaz de filtrar as frequências desejadas com eficiência. A utilização de um filtro IIR foi uma escolha acertada, pois permite a filtragem de múltiplas frequências com uma banda de atenuação maior, garantindo a qualidade do sinal filtrado.