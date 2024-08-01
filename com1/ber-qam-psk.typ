#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")
#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)

#show: doc => report(
  title: "QAM vs PSK: Análise de Desempenho",
  subtitle: "Sistemas de Comunicações I",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "01 de Agosto de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show figure.caption: set text(10pt, style: "italic")

= Introdução

Neste relatório, abordaremos conceitos fundamentais e análises de desempenho de técnicas de modulação digital, especificamente a modulação por chaveamento de fase (PSK) e a modulação de amplitude em quadratura (QAM). Serão explicados os princípios básicos dessas técnicas de modulação, bem como a importância da relação sinal-ruído (SNR) e da taxa de erro de bit (BER) na avaliação da qualidade de sistemas de comunicação. Além disso, apresentaremos simulações comparativas de BER vs. SNR para diferentes esquemas de PSK e QAM, destacando as vantagens e desvantagens de cada técnica em termos de eficiência espectral e robustez contra ruídos.

= Fundamentação teórica

== Modulação PSK

A modulação por chaveamento de fase (PSK - Phase Shift Keying) é uma técnica de modulação digital na qual a fase da portadora é variada de acordo com os dados digitais a serem transmitidos. Em PSK, diferentes fases da portadora representam diferentes estados dos dados binários. Por exemplo, no BPSK (Binary PSK), apenas duas fases são usadas, representando 0 e 1. Já no QPSK (Quadrature PSK), quatro fases são utilizadas, permitindo a transmissão de dois bits por símbolo. A modulação PSK é conhecida por sua eficiência espectral e robustez contra ruídos e interferências, sendo amplamente utilizada em sistemas de comunicação modernos, como redes de satélites e comunicações sem fio.

== Modulação QAM

A modulação de amplitude em quadratura (QAM - Quadrature Amplitude Modulation) é uma técnica de modulação que combina a modulação em amplitude e em fase para transmitir mais informações por unidade de tempo. No QAM, dois sinais portadores são modulados em amplitude, e esses sinais são combinados em um único sinal composto. Isso permite a transmissão de múltiplos bits por símbolo, aumentando significativamente a eficiência espectral. A QAM é utilizada em diversas aplicações, como modems de linha telefônica, televisão digital e sistemas de comunicação de alta velocidade, como Wi-Fi e LTE, devido à sua capacidade de transmitir grandes quantidades de dados de forma eficiente.

== SNR (Signal-to-Noise Ratio)

A relação sinal-ruído (SNR - Signal-to-Noise Ratio) é uma medida da qualidade de um sinal em comparação com o nível de ruído presente no sistema. É expressa como a razão entre a potência do sinal e a potência do ruído, geralmente em decibéis (dB). Um SNR mais alto indica que o sinal é significativamente mais forte do que o ruído, resultando em uma melhor qualidade de transmissão e maior confiabilidade na comunicação. O SNR é um parâmetro crucial na avaliação do desempenho de sistemas de comunicação, pois afeta diretamente a taxa de erro de bit (BER) e a capacidade de transmitir dados de forma precisa e eficiente.

== BER (Bit Error Rate)

A taxa de erro de bit (BER - Bit Error Rate) é uma métrica que quantifica a taxa de erros na transmissão de bits em um sistema de comunicação. É definida como a proporção de bits recebidos incorretamente em relação ao total de bits transmitidos. A BER é influenciada por diversos fatores, incluindo a relação sinal-ruído (SNR), a qualidade do canal de comunicação e a técnica de modulação utilizada. Em sistemas de comunicação, uma BER mais baixa é desejável, pois indica uma transmissão mais confiável e com menos erros. Técnicas de correção de erros e modulações robustas são frequentemente empregadas para reduzir a BER e melhorar o desempenho geral do sistema.


= Análise dos resultados

== Simulação de BER vs. SNR para MPSK 

Nesta seção, apresentamos os resultados da simulação de BER vs. SNR para modulação PSK com diferentes números de fases (4, 8, 16 e 32). A figura abaixo mostra a curva de BER vs. SNR para cada esquema de modulação PSK. Observamos que, à medida que o número de fases aumenta, a eficiência espectral do sistema melhora, permitindo a transmissão de mais bits por símbolo.

#figure(
      image("./assets/r7-mpsk.png"),
      caption: [Bit Error Rate (BER) vs. SNR para PSK 4, 8 e 16 e 32],
    )
  
== Simulação de BER vs. SNR para MQAM

Aqui, apresentamos os resultados da simulação de BER vs. SNR para modulação QAM com diferentes números de amplitudes e fases (4, 16, 64 e 256). A figura abaixo mostra a curva de BER vs. SNR para cada esquema de modulação QAM. Observamos que a QAM apresenta uma eficiência espectral ainda maior do que a PSK, permitindo a transmissão de mais bits por símbolo e uma melhor qualidade de transmissão.

#figure(
      image("./assets/r7-mqam.png"),
      caption: [Bit Error Rate (BER) vs. SNR para QAM 4, 16 e 64 e 256],
    )

== Comparativo entre MPSK e MQAM

Por fim, comparamos os resultados de BER vs. SNR para modulação PSK e QAM em uma única figura, destacando as diferenças de desempenho entre as duas técnicas de modulação. A figura abaixo mostra a comparação entre as curvas de BER vs. SNR para PSK e QAM, evidenciando as vantagens da QAM em termos de eficiência espectral

#figure(
      image("./assets/r7-mpsk-vs-mqam.png"),
      caption: [Comparação entre BER vs. SNR para PSK e QAM],
    )

Como podemos analisar no gráfico acima a modulação QAM apresenta uma melhor eficiência espectral em relação à modulação
PSK, permitindo a transmissão de mais bits por símbolo e uma melhor qualidade de transmissão. A QAM é amplamente utilizada em sistemas de comunicação modernos devido à sua capacidade de transmitir grandes quantidades de dados de forma eficiente e robusta contra ruídos e interferências.

= Conclusões

Neste relatório, exploramos as técnicas de modulação digital PSK e QAM, destacando suas características, vantagens e limitações. Através das simulações de BER vs. SNR, observamos que a QAM oferece uma eficiência espectral superior em comparação com a PSK, permitindo a transmissão de mais bits por símbolo e uma melhor qualidade de transmissão. No entanto, essa maior eficiência vem ao custo de uma maior complexidade no receptor e uma maior sensibilidade ao ruído. As análises comparativas demonstraram que, embora ambas as técnicas sejam amplamente utilizadas em sistemas de comunicação, a escolha entre PSK e QAM depende das exigências específicas de cada aplicação, como a necessidade de robustez contra ruídos ou a maximização da taxa de dados. Em suma, este estudo reforça a importância de uma análise cuidadosa dos requisitos do sistema ao selecionar a técnica de modulação mais adequada.

