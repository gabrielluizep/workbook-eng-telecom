#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#set heading(numbering: "1  ")

#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)
#show figure.caption: set text(10pt, style: "italic")

#show: doc => report(
  title: [Modulação em Frequência _(FM)_],
  subtitle: "Sistemas de Comunicações I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "16 de Abril de 2024",
  doc,
)

= Introdução

Este relatório aborda os fundamentos teóricos e práticos da modulação em
frequência (FM) em sistemas de comunicações. Na seção de fundamentação teórica,
serão apresentados os conceitos essenciais relacionados à modulação e
demodulação de sinais FM, com base nas seções 9.1, 9.2, 9.3 e 9.4 do livro
Matlab SDR. O objetivo é compreender como um sinal de informação é modulado em
frequência, gerando um sinal FM e como esse processo pode ser revertido na
demodulação para recuperar o sinal original. Para ilustrar esses conceitos,
serão utilizadas simulações computacionais em Python, mostrando o processo de
modulação de um sinal senoidal e sua posterior demodulação. Por meio dessas
análises, busca-se uma compreensão mais profunda dos princípios fundamentais da
modulação em frequência e suas aplicações em sistemas de comunicações.

#pagebreak()

= Fundamentação teórica

Uma das formas mais simples de modulador FM analógico é o _Voltage Controller Oscilator (VCO)_.
Este dispositivo, mostrado abaixo na @modulador-fm-vco, gera um sinal senoidal,
cuja fase (e, portanto, efetivamente a frequência) muda em resposta a variações
de amplitude de um sinal de controle de entrada.

#figure(
  image("./assets/r4-block-diagram-fm.png"),
  caption: figure.caption(position: top, [Fonte@Stewart_Robert_W2015-09-11]),
)<modulador-fm-vco>;

Quando o sinal de controle é inserido no VCO, ele é multiplicado por $K_"fm"$ ma
constante que representa a 'razão de ganho de tensão para frequência' do
dispositivo (medida em Hz/V). O produto de $K_"fm"$ e o sinal de controle é
então integrado (alterando sua fase em 90 graus). O sinal integrado é denotado
por $hat(theta)(t)$:

$
  hat(theta)(t) = k_0 integral_(-oo)^t v(t) dif t
$

Podemos então expressar a saída do VCO como, sendo $k_0 = 2 pi K_"fm"$:

$
  s_"fm" (t) = A_c cos(omega_c t + 2 pi K_"fm" dot integral_(-oo)^t s_i (t) dif t)
$

O sinal _FM_ pode ser classificado com base na sua largura de banda, podendo ser
considerado _Narrowband (NFM)_ ou _Wideband (WFM)_, dependendo do valor de
índice de modulação, caso ele seja muito maior que 1, o sinal é considerado _WFM_,
caso contrário, _NFM_.

No caso do _NFM_, aproximações são viáveis devido ao desvio máximo de frequência
permitido ser pequeno (5kHz). Isso simplifica a equação fundamental, tornando-a
semelhante à equação do sinal _AM-DSB-TC_. A diferença crucial é que no _NFM_, a
banda lateral inferior é invertida. Esta semelhança espectral implica larguras
de banda aproximadamente iguais. Devido à sua eficiência espectral e baixo
custo, o _NFM_ é amplamente utilizado em aplicações de voz, como microfones sem
fio e rádios em veículos de emergência.

O rádio FM comercial utiliza o padrão de FM de banda larga (WFM), com um desvio
de frequência de 75kHz e uma largura de banda limitada, geralmente de 200kHz.
Isso resulta em estações de rádio FM sendo posicionadas a intervalos de 0.2MHz
no dial dos rádios analógicos. A largura de banda precisa ser limitada devido à
criação teórica de um número infinito de bandas laterais durante o processo de
modulação. As bandas laterais são múltiplos positivos e negativos da frequência
do sinal de informação em torno da portadora. Para analisar um sinal WFM
modulado por tom único, são utilizadas funções de Bessel, onde as bandas
laterais são indexadas pelo símbolo n. A largura de banda de um sinal WFM pode
ser estimada encontrando as frequências dos componentes laterais superior e
inferior que contêm uma quantidade significativa de potência, usando a regra de
Carson. Reguladores limitam o número de bandas laterais que podem ser
transmitidas com sinais WFM, com estações limitadas a 200kHz no Reino Unido.
Embora isso permita a transmissão de aproximadamente 98% da energia modulada
total, a filtragem de banda passante dos sinais WFM pode ter um pequeno efeito
prejudicial na qualidade do sinal.

Para realizarmos a demodulação de um sinal FM, podemos utilizar o técnicas de
diferenção, obtendo assim a informação juntamente com componentes de alta
frequência, onde a informação está contida dentro do envelope da onda:

#figure(
  image("./assets/r4-envelope.png"),
  caption: figure.caption(position: top, [Fonte@Stewart_Robert_W2015-09-11]),
);

#pagebreak()

= Análise dos resultados

Utilizando a linguagem de progrmação _Python_ e bibliotecas de cálculo numérico,
podem realizar simulações para modulação e demodulação de sinais FM.

A @fm-mod demonstra a modulação de um sinal senoidas de frequência 15kHz e
amplitude 1V.

Analisando no domínio do tempo o sinal modulado notamos um adensamento de ondas
devido a variação da frequência, onde a frequência é maior, maior é o
adensamento. Podemos verificar no domínio da frequência que o sinal modulado
possui várias componentes de frequência, quase como se fossem impulsos, podemos
verificar que o espaçamento entre é igual a $K_"fm" = 75"kHz"$.

#figure(
  image("./assets/r4-fm-mod.png"),
  caption: [Sinal modulado],
  supplement: "Figura",
)<fm-mod>

O código gerador dos sinais demonstrados na @fm-mod é apresentado a seguir:

#sourcecode[
```python
  si_t = sin(2 * pi * fi * t)  # Sinal de entrada
  Si_f = fftshift(fft(si_t))  # Sinal de entrada na frequencia

  kfm = int(75e3)  # Desvio de frequencia em Hz
  k0 = 2 * pi * kfm  # Desvio de frequencia em rad/s

  theta_hat_t = k0 * np.cumsum(si_t) * ts  # Sinal integrado 0 a t

  c_t = Ac * cos(2 * pi * fc * t + theta_hat_t)  # Sinal modulado
  C_f = fftshift(fft(c_t))  # Sinal modulado na frequencia
```
]

Para efeito de simulação discreta foi utilizado uma integração por meio da
função de soma cumulativa `np.cumsum` para obter o sinal integrado.

Para realização da demodulação do sinal modulado, utilizamos a técnica de
diferenciação discreta, onde a informação é obtida juntamente com componentes de
alta frequência, onde a informação está contida dentro do envelope da onda.

#figure(
  image("./assets/r4-fm-demod.png"),
  caption: [Sinal modulado],
  supplement: "Figura",
);

Para a análise não foi extraída a informação contida no envelope da onda, para
realização seria necessário de ferramentas matemáticas como a transformada de
Hilbert.

#pagebreak()

= Conclusões

Neste relatório, exploramos os princípios fundamentais da modulação em
frequência (FM) em sistemas de comunicações. Iniciamos revisando os conceitos
teóricos envolvidos na modulação e demodulação de sinais FM, destacando a
importância do Voltage Controller Oscillator (VCO) como um dos
dispositivos-chave na geração de sinais FM. Discutimos também as características
de sinais FM estreitos (NFM) e largos (WFM), assim como as implicações práticas
da largura de banda limitada em transmissões FM comerciais.

Em seguida, utilizamos simulações computacionais em Python para demonstrar o
processo de modulação e demodulação de sinais FM. Através dessas simulações,
pudemos visualizar as alterações na forma de onda e no espectro de frequência
durante esses processos, evidenciando a relação entre o sinal de informação e o
sinal modulado.

Embora tenhamos obtido resultados promissores nas simulações, é importante
ressaltar que a extração eficiente da informação demodulada requer técnicas
adicionais, como a utilização da transformada de Hilbert para analisar o
envelope da onda. Portanto, há oportunidades para estender este estudo,
aprofundando a análise da demodulação e explorando aplicações práticas em
sistemas de comunicações reais.

No geral, este relatório oferece uma base sólida para compreender os princípios
básicos da modulação em frequência e suas aplicações, fornecendo uma plataforma
para investigações futuras e desenvolvimentos nesta área crucial da engenharia
de comunicações.

#pagebreak()

#bibliography("./refs.bib", title: [Bibliografia])