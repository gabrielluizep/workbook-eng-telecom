#show math.ast: math.dot.op
#set par(justify: true)
#set text(size: 10pt)

#grid(columns: (1fr, 2fr),
  [#image("./assets/IFSC_horizontal_fundo_transparente.png", height: 4em)],
  [
    #align(center + horizon)[
      #set par(leading: 0.5em)
      *Parte 3 - Engenharia de Telecomunicações\
      Avaliação Teórica\
      Prof. Humberto Oliveira*
    ]
  ]
)

#[
  #set line(stroke: 0.5pt)
  #grid(columns: (6fr, 1fr),
    [Nome: #box(width: 1fr, line(length: 95%))], 
    [Data: #box(width: 1fr, line(length: 100%))], 
  )
]

#[
*Instruções:*
- Não esqueça de colocar o nome e a data; Também coloque o nome em todas as folhas que usar durante a prova;
- A prova pode ser feita à lápis ou à caneta, porém, para ter direito à revisão, coloque a resposta final à caneta;
- O tempo combinado para a prova deve ser cumprido sem qualquer período adicional;
- Está permitido o uso de calculadora do modelo Casio fx-82, similar ou inferior;
- Nenhuma dúvida será respondida durante a prova, exceto sobre má impressão ou má formulação de questões;
- Resolva na ordem que desejar, porém mantenha a organização adequada nas respostas;
- A consulta NÃO poderá ser feita à equipamentos eletrônicos (celulares, notebooks, etc);
- Cada aluno poderá portar um formulário, desde que devidamente autorizado previamente pelo professor;
- Casos excepcionais serão resolvidos pelo professor.
]

1. [0,6] As quatro equações de Maxwell, fundamentais do eletromagnetismo, explicam uma grande variedade de fenômenos, desde a razão pela qual a agulha de uma bússola aponta para o norte até o motivo para um carro entrar em movimento quando giramos a chave de ignição. Com base nas equações de Maxwell assinale *V* nas afirmativas verdadeiras e *F* para as falsas.
  #[
    #set list(marker: [( *V* )])
  - O campo elétrico - não eletrostático - existe somente quando houver um campo magnético variável, isto é, produzido por cargas elétricas aceleradas.
  - O campo elétrico eletrostático é um campo conservativo e está relacionado ao fluxo elétrico das cargas elétricas envolvidas por meio de uma superfície fechada.
  - A lei de gauss está intimamente relacionada com a lei de conservação de carga elétrica.
  - Uma diferença de potencial também decorre de campos não eletrostáticos, ou seja, é induzida a partir de um campo magnético variável, mesmo que a espira através da qual o fluxo magnético está variando não sejaum condutor de verdade, mas uma curva imaginária.
  ]

#grid(columns: (2fr, 1fr),
  [
  2. [0,6] Considere um solenóide com comprimento $cal(l) = 10 "cm"$, $500$ espiras por metro e que a corrente em seu enrolamento esteja crescendo com uma taxa igual a $100 A"/"s$ (figura ao lado). A área da seção reta do solenóide é de $4,0 "cm"^2$. Determine o módulo da fem induzida na espira fora do solenóide. b) calcule o módulo do campo elétrico induzido na espira, sabendo que seu raio é igual a $2,0 "cm"$. c) Determine a indutância e a energia armazenada no solenóide (indutor) após 1 minuto.
  ],[#image("./assets/questao-2.png")]
)
http://ftp.ufv.br/dpf/203/q29.pdf
$
epsilon 
&= -dif/(dif t) Phi(t)
$

3. [0,6] Suponha que você está no espaço a uma distância de $20 "m"$ de sua nave espacial. Você tem uma arma laser _“a la Star Wars”_ de $1 "kW"$. Se sua massa total, incluindo a roupa espacial e o laser tem $95 "kg"$, quanto tempo você levará para chegar até a nave, se apontar o laser diretamente no sentido contrário a ela e disparar?

4.  [0,6] Dois polarizadores possuem seus eixos de transmissão cruzados de tal modo que a luz não passa por elas. Um terceiro polarizador é inserido entre os dois primeiros polarizadores, de modo que seu eixo de transmissão faz um ângulo $theta$ com o primeiro polarizador. Uma luz não polarizada de intensidade $I_0$ incide sobre o primeiro polarizador. Determine a razão das intensidades da luz transmitida e incidente ($I"/"I_0$) através dos três polarizadores, se (a) $theta = 45º$; (b) $theta = 30º$.

  $
  theta_(2,3) = 90º - theta(1,2) quad quad I_1 = I_0 / 2 quad quad I_2 = I_1 * cos^2(theta_(1,2)) quad quad I_3 = I_2 *cos^2(theta_(2,3))
  $  
  
  a) 
  $
  theta_(1,2) &= 45º  therefore theta_(2,3) &= 45º\
  $
  #grid(columns: (1fr, 1fr),[$
  I_2 
  &= I_1 * cos^2(theta_(1,2))\
  &= I_0/2 * cos^2(45º)\
  &= I_0/2 * (sqrt(2)/2)^2\
  &= I_0/2 * 2/4\
  &= I_0/4\ \
  $],[$
  I_3 
  &= I_2 * cos^2(theta_(2,3))\
  &= I_0/4 * cos^2(45º)\
  &= I_0/4 * (sqrt(2)/2)^2\
  &= I_0/4 * 2/4\
  &= #rect()[$ I_0/8 $]\
  $]
  )

  b) 
  $
  theta_(1,2) &= 30º therefore theta_(2,3) &= 60º\
  $

  #grid(columns: (1fr, 1fr),[$
  &= I_1 * cos^2(theta_(1,2))\
  &= I_0/2 * cos^2(30º)\
  &= I_0/2 * (sqrt(3)/2)^2\
  &= I_0/2 * 3/4\
  &= (3I_0)/8\
  $],[$
  &= I_2 * cos^2(theta_(2,3))\
  &= (3I_0)/8 * cos^2(60º)\
  &= (3I_0)/8 * (1/2)^2\
  &= (3I_0)/8 * 1/4\
  &= #rect()[$ (3I_0)/32 $]\
  $])

  

5. [0,6] A densidade de corrente de deslocamento através de uma região (figura abaixo) circular de raio R = 5,0 cm tem valor absoluto de JD = 10 A /m2 , sendo uniforme e dirigida para fora da figura. Calcule o módulo do campo magnético produzido pela corrente de deslocamento (a) a 3,0 cm do centro da região; (b) a 10 cm
