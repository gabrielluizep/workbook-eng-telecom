#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Modulações GMSK e CPM",
  subtitle: "Sistemas de Comunicações I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "19 de Agosto de 2024",
  doc,
)

#show figure.caption: set text(10pt, style: "italic")


// Fazer um trabalho sobre as modulações GMSK e CPM, trazendo aplicações e uma breve comparação com as modulações FSK e PSK. 

// IMPORTANTE: Citar as referências utilizadas para fazer o trabalho. As referências deverão ser citadas ao longo do texto, não apenas ao final.

// A formatação do trabalho é livre, mas procure inserir figuras para ilustrar as explicações.

= Introdução

A modulação é uma técnica fundamental em comunicações digitais, permitindo a transmissão de informações através de diferentes meios. Entre as diversas técnicas de modulação, destacam-se a modulação de fase contínua (CPM) e a modulação de desvio de frequência mínima (MSK), que incluem a variação conhecida como GMSK. Este trabalho tem como objetivo explorar essas modulações, com foco especial em suas aplicações práticas e em uma comparação com outras técnicas comuns, como a modulação por desvio de frequência (FSK) e a modulação por deslocamento de fase (PSK). A análise abordará a eficiência espectral, a largura de banda, e a robustez de cada técnica.

= Fundamentação teórica

== Modulação PSK

A modulação PSK _(Phase Shift Keying)_ é uma técnica de modulação digital que consiste em chavear _(shift keying)_ em valores de fases discretos para representar simbolos digitais. @sklar_digital_2001

#grid(
  columns: 2,
  rows:1, 
  figure(
    caption: figure.caption(position: top, text(size:8pt)[Fonte: @levelup_psk_2024]),
    supplement: none,
    figure(
      image(width: 60%,"./assets/psk-timing-diagram.png"),
      caption: [Diagrama de tempo para modulação PSK],
    )
  ),
  figure(
    caption: figure.caption(position: bottom, text(size:8pt)[Fonte: @Stewart_Robert_W2015-09-11]),
      supplement: none,
    figure(
      image(width: 42.25%,"./assets/8psk-constellation.png"),
      caption: figure.caption(position: top,[Constelação de fase para BPSK (Binary Phase Shift Keying)]),
    )
  )
)

== Modulação FSK

Outra técnica de modulação digital amplamente utilizada é a modulação FSK _(Frequency Shift Keying)_, por sua vez utiliza da frequência como parâmetro para representar os simbolos digitais. Cada frequência representa um simbolo diferente. @sklar_digital_2001

#figure(
  caption: figure.caption(position: top, text(size:8pt)[Fonte: @wikipedia_fsk_2024]),
    supplement: none,
  figure(
    image(width: 50%, "./assets/fsk-timing-diagram.png"),
    caption: [Constelação de fase para BPSK (Binary Phase Shift Keying)]
  ),
)

== Modulação MSK _(Minimum Shift Keying)_

MSK _(Minimum Shift Keying)_ é uma modulação que codifica cada bit como uma meia sinusoide, resultando em um sinal com um envelope de sinal constante, o que reduz os problemas causados pela distorção não-linear. @WikipediaMSK

#figure(
  caption: figure.caption(position: top, text(size:8pt)[Fonte: @electronics_notes_msk]),
  supplement: none,
  figure(
    image(width: 50%, "./assets/msk-timing-diagram.svg"),
    caption: [Diagrama de tempo para modulação MSK]
  ),
)<msk-td>

Como podemos observar na figura @msk-td, diferentemente da modulação o chaveamento de fase não ocorre de forma abrupta, mas sim de forma suave, o que reduz a largura de banda necessária para transmitir o sinal.

= Modulação CPM _(Continuous Phase Modulation)_

Na modulação de fase contínua CPM _(Continuous Phase Modulation)_ a fase do sinal é continuamente variada com o objetivo de reduzir a largura de banda necessária para transmitir um dado sinal. Comumente implementada como um onda de envelope contante, portanto, a potência da portadora é constante. @wikipedia_continuous_phase_modulation


O CPM é amplamente utilizado em sistemas de comunicação modernos, como o GSM _(Global System for Mobile Communications)_. Sua eficiência em termos de uso do espectro e sua capacidade de manter uma comunicação clara e confiável fazem dele uma escolha popular para redes móveis e outros sistemas que exigem alta capacidade e eficiência.

= Modulação GMSK _(Gaussian Minimum Shift Keying)_

A modulação GMSK _(Gaussian Minimum Shift Keying)_ é uma variação da modulação MSK, onde a transição de fase é suavizada pela utilização em conjunto com um filtro gaussiano. @turletti_gmsk.

#figure(
  caption: figure.caption(position: top, text(size:8pt)[Fonte: @turletti_gmsk]),
    supplement: none,
  figure(
    image(width: 80%, "./assets/msk-gmsk-phase-td.png"),
    caption: [Comparação entre MSK e GMSK]
  ),
)

O GMSK é amplamente utilizado no GSM devido à sua eficiência espectral e capacidade de reduzir a interferência entre canais adjacentes. O GSM é um dos padrões de comunicação móvel mais antigos e amplamente adotados.

== Modulador

De acordo com _Culler_ @turletti_gmsk etapas para a modulação GMSK são:

+ Criar sequência NRZ
+ Criar $N$ amostras por símbolo
+ Integrar a sequência NRZ
+ Convolver com a função gaussiana
+ Separar em fase e quadratura
+ Multiplicar pelas portadoras $cos(omega_0 n)$ e $-sin(omega_0 n)$ 
+ Somar as saídas dos multiplicadores

Ou representado em diagrama de blocos:

#figure(
  caption: figure.caption(position: top, text(size:8pt)[Fonte: @turletti_gmsk]),
    supplement: none,
  figure(
    image(width: 80%, "./assets/gmsk-mod-block-diagram.png"),
    caption: [Diagrama de blocos do modulador GMSK]
  ),
)

== Demodulador

Podemos representar o demodulador GMSK em diagrama de blocos:

#figure(
  caption: figure.caption(position: top, text(size:8pt)[Fonte: @turletti_gmsk]),
    supplement: none,
  figure(
    image(width: 80%, "./assets/gmsk-demod-block-diagram.png"),
    caption: [Diagrama de blocos do demodulador GMSK]
  ),
)

= Conclusões

A técnica de modulação GMSK é mais eficiente em termos de largura de banda e eficiência espectral do que outras técnicas de modulação, como FSK e PSK, porém com um custo computacional maior, devido a necessidade de memória, filtro gaussiano, integradores e derivadores. Este custo computacional é compensado pela capacidade de reduzir a interferência entre canais adjacentes e manter uma comunicação clara e confiável, tornando-a uma escolha popular para sistemas de comunicação móvel e outros sistemas que exigem alta capacidade e eficiência.

#bibliography("./refs.bib", title: [Bibliografia])
