#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "Avaliação 1",
  subtitle: "Sistemas de Comunicação II",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "14 de Outubro de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")
#set enum(numbering: "1.a)")

= Introdução

A diversidade é uma técnica muito necessária em sistemas de comunicação sem fio, ela permite diminuir os efeitos de desvanecimento profundo e melhorar a qualidade do sinal recebido. A diversidade consiste em utilizar múltiplos percursos de propagação para melhorar a confiabilidade do sinal recebido. Neste relatório serão descritas as técnicas de diversidade Maximum Ratio Combining (MRC), Selection Combining (SC), Equal Gain Combining (EGC) e Alamouti.


= Técnicas de Diversidade

== Maximum Ratio Combining (MRC)

A técnica Maximum Ratio Combining (MRC) consiste em combinar os sinais recebidos de múltiplas antenas ponderando de acordo com sua relação sinal-ruído (SNR). Resultando assim em um ganho de SNR proporcional ao número de antenas.

== Selection Combining (SC)

A técnica Selection Combining (SC) consiste em selecionar o sinal recebido com a maior relação sinal-ruído (SNR) entre as antenas disponíveis. Esta técnica é mais simples que a MRC, porém, não é tão eficiente.

== Equal Gain Combining (EGC)

Assim como a MRC, a técnica Equal Gain Combining (EGC) combina os sinais recebidos de múltiplas antenas, porém, ao contrário da MRC, a EGC pondera os sinais de forma igual. Possui um desempenho intermediário entre a MRC e a SC.

== Alamouti

A técnica de Alamouti é um esquema de diversidade espacial-temporal utilziado em sistemas de duas antenas transmissoras. A técnica garante um ganho de diversidade da ordem de $2M$, onde $M$ é o número de antenas receptoras. O esquema de codificação Alamouti permite a transmissão de dois simbolos em dois períodos de tempo consecutivos inicialmente são transmitidos dois simbolos $s_0$ e $s_1$ e no próximo período de tempo são transmitidos $s_1^*$ e $-s_0^*$.

#pagebreak()

= Conclusão

As técnicas de diversidade são fundamentais para melhorar o desempenho de sistemas de comunicação em ambientes com desvanecimento. Cada técnica possui suas vantagens e desvantagens, sendo aplicáveis a diferentes cenários e requisitos de complexidade e desempenho. O MRC maximiza a SNR ao custo de maior processamento, enquanto o SC oferece simplicidade em troca de menor ganho de diversidade. O EGC proporciona um equilíbrio entre desempenho e complexidade. Por fim, a técnica de Alamouti se destaca como uma solução eficiente para sistemas MIMO, oferecendo um elevado ganho de diversidade com baixa complexidade, sem a necessidade de feedback do canal.