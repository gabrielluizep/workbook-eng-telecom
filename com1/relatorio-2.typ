#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Modelo COM1",
  subtitle: "Sistemas de Comunicações I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "25 de Março de 2024",
  doc,
)

= Introdução

Este relatório tem como objetivo realizar os exercícios relativos ao tipo de modulação _AM DSC TC/SC_ propostos pelo professor para a disciplina de Sistemas de Comunicações I. Serão realizados os experimentos propostos com auxilio de ferramentas de programção.

Foi utilizada a linguagem de programação Python juntamente com Jupyter Notebook para a descrição e simulação dos sinais. Os pacotes utilizados em Python foram Numpy, para manipulação de vetores e materiais matemáticos, Matplotlib, para a geração de gráficos e SciPy para a análise de sinais.

= Fundamentação teórica

Modulação é o processo de transformar sinais de modo que seja possível transmitir eficientemente em um dado meio. Num processo de modulação, o sinal de informação é deslocado de sua frequência base para uma frequência elevada, chamada de frequência portadora. A modulação é feita para que o sinal de informação possa ser transmitido por um meio de comunicação, como o ar, o espaço ou um cabo. Ao chegar ao destino, o sinal é demodulado, ou seja, é recuperado a partir do sinal modulado.

A modulação _AM (Amplitude Modulation)_ faz com que o sinal de informação seja transmitido através da variação da amplitude da onda portadora. É chamada de _AM DSB_ (Double Side Band) quando são transmitidas as duas bandas laterais, superior e inferior, e a portadora, onde _TC (Transmitted Carrier)_ é omitido mas indica a transmissão da portadora em conjunto com o sinal. 

Matematicamente podemos descrever como:

$
s(t) = [mu + m(t)] c(t)
$

Onde $s(t)$ é o sinal modulado, $mu$ é o fator de modulação, $m(t)$ é o sinal de informação e $c(t)$ é a portadora.

O fator de modulação implica na inversão de fase no sinal modulado, onde quando possuímos um $mu > 1$ não temos a inversão de fase e podemos retirar a informação com um detector de envoltória, pois o sinal está contido na envoltória da onda modulada.

Temos também como variação da modulação _AM_ a _AM DSB SC (Supressed Carrier)_ onde a portadora é suprimida, ou seja, não é transmitida. Neste caso, a modulação é dada por:

$
s(t) = m(t) c(t)
$

Esta modulação é mais simples pela ausência da portadora, porém é mais difícil de ser demodulada, pois a informação está contida na envoltória da onda modulada.

Utilizando modulações podemos utilizar um unico meio para transmissão de diversos sinais, pois cada sinal modulado possui uma frequência diferente, evitando assim a interferência entre os sinais. Não existindo _aliasing_ entre os sinais modulados.

O processo de multiplexação _FDM (Frequency Division Multiplexing)_ é utilizado para transmitir diversos sinais em um único meio de transmissão. Cada sinal é modulado em uma frequência diferente, evitando assim a interferência entre os sinais. A multiplexação _FDM_ é utilizada em sistemas de comunicação de rádio e televisão.

Utilizamos da estratégia de _SSB (Single Sided Band)_ para a multiplexação _FDM_, onde apenas uma banda lateral é transmitida, evitando a redundância de informações.

= Análise dos resultados

== Modulação _AM DSB TC_

Realizando o processo de modulação _AM DSB TC_ com um cosseno e um fator de modulação $mu = 1.5$ temos o seguinte resultado:

#figure(
  image("./assets/r2-am-dsb-tc.png"),
  caption: [Processo de modulação _AM DSB TC_],
  supplement: "Figura"
);

Notamos que a mensagem é facilmente recuperada através de um detector de envoltória, pois a informação está contida na envoltória da onda modulada.

Alterando este paramentro $mu$ verificamos uma degradação do sinal modulado, tornando difícil a recuperação do sinal conforme diminui-se $mu$, analisamos abaixo os resultados para diferentes fatores de modulação:

#figure(
  image("./assets/r2-fatores-modulacao.png"),
  caption: [Resultado para diferentes fatores de modulação $mu$],
  supplement: "Figura"
);

== Modulação _AM DSB SC_

Para a modulação _AM DSB SC_ temos o seguinte resultado:

#figure(
  image("./assets/r2-am-dsb-sc.png"),
  caption: [Processo de modulação _AM DSB SC_],
  supplement: "Figura"
);

Verificamos que a portadora não faz parte do espectro do sinal modulado.

== Multiplexação _FDM SSB_

#figure(
  image("./assets/r2-multiplexacao.png"),
  caption: [Multiplexação _FDM SSB_],
  supplement: "Figura"
);

Na figura acima, verificamos os espectros dos sinais a esquerda e sua representação em _SSB_ a direita, notamos que se não houvese a remoção da banda inferior do sinal haveia _aliasing_, ou seja, interferência entre os sinais.

Para obter o sinal _SSB_ foi utilizado um filtro ideal que permite a passagem do sinal apenas na banda superior, removendo a banda inferior.

Para a demulplexação do sinal foi realizado um processo inverso, onde o sinal foi filtrado por vários filtros passa faixa, seguido de demoduladores para retornar os sinais para sua banda original e um filtro passa baixa removendo as componentes de alta frequência resultantes dos processos anteriores. Desta maneira obtemos novamente os sinais originais:

#figure(
  image("./assets/r2-demultiplexacao.png"),
  caption: [Demultiplexação _FDM SSB_],
  supplement: "Figura"
);

= Conclusões

A partir deste estudo dirigido podesmos concluir que a modulação _AM_ é um processo eficiente para a transmissão de sinais, porém é necessário um cuidado com o fator de modulação para que a informação seja facilmente recuperada.

A multiplexação _FDM_ é uma técnica eficiente para a transmissão de diversos sinais em um único meio de transmissão, evitando assim a interferência entre os sinais.