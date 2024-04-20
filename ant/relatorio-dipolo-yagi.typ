#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(size: 12pt, font: "FreeSans", lang: "pt")

#show: doc => report(
  title: "Comparativo de Antenas: Dipolo e Yagi",
  subtitle: "Antenas e Propagação",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "19 de Abril de 2024",
  doc,
)

#set heading(numbering: "1  ")

#show par: set block(below: 1.5em)
#show heading: set block(below: 1.5em)
#show figure.caption: set text(10pt, style: "italic")

= Introdução

Com o objetivo de avaliar o comportamento das antenas _Dipolo_ e _Yagi_ realizamos um estudo comparativo entre as duas. As antenas _Dipolo_ são antenas de meia onda que são muito utilizadas em sistemas de comunicação devido a sua simplicidade e eficiência. Já as antenas _Yagi_ são antenas direcionais que possuem um ganho maior que as antenas _Dipolo_ e são muito utilizadas em sistemas de comunicação de longa distância.

#pagebreak()

= Dados coletados

== Análise de resposta em frequência

Para o estudo comparativo entre as antenas _dipolo_ e _yagi_, foi montado um experimento para coletar dados onde de um lado havia uma terceira antena conectada a um gerador de ondas e do outro a antena que estava sendo avaliada recebendo o sinal com um aparelho de medição. Com este cenário, foi possível coletar dados de resposta em frequência e diagrama de radiação das antenas: 

#figure(
  caption: [Resposta em frequência das antenas _dipolo_ e _yagi_],
  
  table(
    columns: 3,

    table.header(  
      table.cell(colspan: 2, x: 1, [Ganho (dBm)]),
    ),
    
    [Frequência (MHz)],[Dipolo],[Yagi],

    $650$,  $-47$, $-49$,
    $700$,  $-44$, $-46$,
    $750$,  $-56$, $-49$,
    $800$,  $-53$, $-52$,
    $825$,  $-45$, $-49$,
    $850$,  $-51$, $-50$,
    $875$,  $-65$, $-47$,
    $900$,  $-48$, $-54$,
    $925$,  $-45$, $-54$,
    $950$,  $-52$, $-46$,
    $975$,  $-60$, $-54$,
    $1000$, $-53$, $-52$,
    $1025$, $-64$, $-53$,
    $1050$, $-88$, $-58$,
    $1075$, $-52$, $-49$,
    $1100$, $-49$, $-56$,
    $1125$, $-50$, $-50$,
    $1150$, $-50$, $-52$,
    $1200$, $-48$, $-54$,
    $1250$, $-46$, $-60$,
    $1300$, $-54$, $-53$,
    $1400$, $-56$, $-55$,
    $1500$, $-55$, $-57$,
  )
)


Na antena dipolo podemos notar um ganho maior em frequências próximas a $700$ MHz, enquanto a antena yagi teve um comportamento instável porém com maior ganho em frequências baixas. 

Vemos a seguir na @respost-frequencia o gráfico da resposta em frequência de ambas as antenas:

#figure(
  caption: [Resposta em frequência das antenas _dipolo_ e _yagi_],
  image("./assets/dipolo-yagi-resposta-freq.png"),
)<respost-frequencia>

Como podemos observar, houveram muitas variações em ambas as antenas, principalmente na antena yagi, isso se dá pela construção manual de ambas e pelo ambiente não ser controlado, para uma análise mais precisa seria necessário uma câmera anecoica, onde o sinal emitido sofreria menos refletido.

#pagebreak()

== Análise de diagrama de radiação

Para a análise do diagrama de radiação das antenas _dipolo_ e _yagi_, com a configuração anterior, fixamos a frequência do transmissor, giramos a antena receptora e medimos a potência recebida em diferentes ângulos. Os resultados obtidos estão apresentados na tabela a seguir:

#figure(
  caption: [Diagrama de radiação antenas _dipolo_ e _yagi_],
  
  table(
    columns: 3,

    table.header(  
      table.cell(colspan: 2, x: 1, [Potência (dBm)]),
    ),
    
    [Angulo (º)],[Dipolo],[Yagi],

    $0$,    $-45$,     $-51$,
    $20$,   $-44$,     $-50$,
    $40$,   $-43$,     $-50$,
    $60$,   $-44$,     $-60$,
    $80$,   $-50$,     $-50$,
    $100$,  $-44$,     $-48$,
    $120$,  $-44$,     $-48$,
    $140$,  $-45$,     $-46$,
    $160$,  $-50$,     $-46$,
    $180$,  $-48$,     $-47$,
    $200$,  $-54$,     $-55$,
    $220$,  $-49$,     $-47$,
    $240$,  $-45$,     $-41$,
    $260$,  $-41$,     $-40$,
    $280$,  $-49$,     $-41$,
    $300$,  $-42$,     $-44$,
    $320$,  $-41$,     $-51$,
    $340$,  $-46$,     $-59$,
  )
)

Com os dados obtidos, realizamos a normalização de modo que a maior potência recebida fosse $0$ dBm. A seguir, apresentamos o gráfico do diagrama de radiação das antenas _dipolo_ e _yagi_:

#figure(
  caption: [Diagrama de radiação antenas _dipolo_ e _yagi_],
  image("./assets/dipolo-yagi-diagrama-radiacao.png"),
)

Podemos verificar uma maior diretividade na antena yagi, como era esperado.

#pagebreak()

= Conclusão

Após realizada a análise comparativa entre as antenas _dipolo_ e _yagi_, podemos concluir que a antena _yagi_ possui maior diretividade e ganho em relação a antena _dipolo_. Por outro lado, a antena _dipolo_ possui um comportamento mais estável em relação a antena _yagi_. 

Como trabalho futuro sugerimos uma aferição mais adequada dos dados, com um ambiente controlado em uma câmera anecoica para minimizar as interferências externas. Além disso, sugerimos a validação da construção das antenas com simulações computacionais para verificar a eficiência das antenas.

