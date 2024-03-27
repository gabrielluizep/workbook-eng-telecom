#show math.ast : math.dot.op

= Trabalho de _TFTD_
== Gabriel Luiz Espindola Pedro

1. Usando a definição, obtenha a TFTD para os sinais a seguir.

  a) $x[n] = (0.1)^n u[n-1]$.

  $
  X[Omega] 
  &= sum_(n = -oo)^oo x[n]e^(j Omega n)\
  &= sum_(n = -oo)^oo (0.1)^n u[n-1] * e^(j Omega n)\
  &= sum_(n = 1)^oo (0.1)^n e^(j Omega n)\
  &= sum_(n = 1)^oo (0.1 * e^(j Omega))^n\
  &= #rect()[$ 0.1 * (e^(j Omega))/(1-0.1 * e^(j Omega)) $]\
  $
  
  b) $x[n] = (10)^n u[-(n+1)]$.
  $
  X[Omega]
  &= sum_(n = -oo)^oo x[n]e^(j Omega n)\
  &= sum_(n = -oo)^oo (10)^n u[-(n+1)] * e^(j Omega n)\
  &= sum_(n = -oo)^1 (10)^n * e^(j Omega n) quad ;m = -n\
  &= sum_(m = 1)^oo (10)^(-m) * e^(j Omega * (-m))\
  &= sum_(m = 1)^oo (10^(-1) * e^(j Omega * (-1)))^(m)\
  &= sum_(m = 1)^oo (0.1 * e^(-j Omega))^(m)\
  &= #rect()[$ 0.1 (e^(-j Omega))/(1-0.1 * e^(-j Omega)) $]
  $

#pagebreak()
    
2. Usando a propriedade do deslocamento e sabendo que a _TFTD_ de $a^n u[n]$ é $e^(j Omega)/(e^(j Omega)-a)$ obtenha a tranformada de Fourier dos sinais a seguir.
  
  $
  n * x[n] <==> j * dif / (dif Omega) (X[Omega])
  $

  a) $x[n] = n a^n u[n]$.

  $
  X[Omega]
  &= j * dif / (dif Omega) (X[Omega])\
  &= j * dif / (dif Omega) (e^(j Omega)/(e^(j Omega)-a))\
  &= j * dif / (dif Omega) (e^(j Omega)/(e^(j Omega)-a)) \ \
  
  (f/g)' &= (f' g - f g') /g^2 \ \

  f &= e^(j Omega) quad ; quad f' = j e^(j Omega)\
  g &= e^(j Omega) - a quad ; quad g' = j e^(j Omega)\ \

  &= j * (j e^(j Omega) * (e^(j Omega) - a) - e^(j Omega) * j e^(j Omega)) / (e^(j Omega) - a)^2\
  &= j^2 * (e^(j Omega) * (e^(j Omega) - a) - e^(j Omega) * e^(j Omega)) / (e^(j Omega) - a)^2\
  &= (-1) * (e^(j 2 Omega) - a * e^(j Omega)  - e^(j 2 Omega) ) / (e^(j Omega) - a)^2\
  &= (-1) * (- a * e^(j Omega)) / (e^(j Omega) - a)^2\
  &= #rect()[$ (a * e^(j Omega)) / (e^(j Omega) - a)^2 $]\
  $

  b) $x[n] = (n-1) a^(2n) u[n-4]$.

  $
  x[n] 
  &= (n - 1) a^(2n) u[n-4]\
  &= (n - 1) (a^(2))^n u[n-4] quad ; a^2 = b\
  &= (n - 1 - 3 + 3) (b)^(n-4+4) u[n-4]\
  &= (n - 4 + 3) (b)^((n-4)+4) u[n-4]\
  &= (n - 4 + 3) (b)^(n-4) (b)^(4) u[n-4]\
  &= (b^4) (n - 4 + 3) (b)^(n-4) u[n-4]\
  &= (b^4) [(n - 4) (b)^(n-4) u[n-4] + 3 (b)^(n-4) u[n-4]]\
  &arrow.t.b.double\
  X[Omega]
  &= b^4 [ (b * e^(j Omega)) / (e^(j Omega) - b)^2 + 3 * e^(j Omega)/(e^(j Omega)-b) ]\
  &= b^4 * (b * e^(j Omega)) / (e^(j Omega) - b)^2 + 3 * b^4 * e^(j Omega)/(e^(j Omega)-b) quad ;b = a^2\
  &= (a^2)^4 * (a^2 * e^(j Omega)) / (e^(j Omega) - a^2)^2 + 3 * (a^2)^4 * e^(j Omega)/(e^(j Omega)-b) \
  &= a^8 * (a^2 * e^(j Omega)) / (e^(j Omega) - a^2)^2 + 3 * a^8 * e^(j Omega)/(e^(j Omega)-a^2) \
  &= #rect()[$ a^10 * (e^(j Omega)) / (e^(j Omega) - a^2)^2 + 3 * a^8 * e^(j Omega)/(e^(j Omega)-a^2) $]
  $

3. Considere um sistema caracterizado pela equação de diferença 

  $ y[n] + 0.8 y[n-1] + 0.12 y[n-2] = 2 x[n] $ 

  a) Determine a resposta em frequência de $H(Omega)$.
  $
  H[Omega] &= Y[Omega] / X[Omega]
  $

  $
  y[n] + 0.8 y[n-1] &+ 0.12 y[n-2] = 2 x[n]\
  &arrow.double.t.b\
  Y[Omega] + 0.8 Y[Omega-1] &+ 0.12 Y[Omega-2] = 2 X[Omega]
  $

  $
  Y[Omega] &(1 + 0.8 e^(-j Omega) + 0.12 e^(-j 2 Omega)) = 2 X[Omega]\
  Y[Omega] / X[Omega] &=  2/(1 + 0.8 e^(-j Omega) + 0.12 e^(-j 2 Omega)) \    
  Y[Omega] / X[Omega] &=  2/(1 + 0.8 e^(-j Omega) + 0.12 e^(-j 2 Omega)) * e^(j 2 Omega)/e^(j 2 Omega)\    
  H[Omega] = Y[Omega] / X[Omega] &=  #rect()[$ (2 * e^(j 2 Omega))/(e^(j 2 Omega) + 0.8 e^(j Omega) + 0.12) $]\    
  $
  \ \
  b) Determine $y[n]$ para $x[n] = (0.1)^n u[n]$.

  $
  x[n] &= (0.1)^n u[n] <==>  X[Omega] &= e^(j Omega)/(e^(j Omega) - 0.1)
  $

  $
  Y[Omega] 
  &= H[Omega] * X[Omega]\
  &= (2 * e^(j 2 Omega))/(e^(j 2 Omega) + 0.8 e^(j Omega) + 0.12) * e^(j Omega)/(e^(j Omega) - 0.1)\
  Y[Omega]/e^(j Omega)&= (2 * e^(j 2 Omega))/(e^(j 2 Omega) + 0.8 e^(j Omega) + 0.12) * 1/(e^(j Omega) - 0.1)\
  
  Y[Omega]/e^(j Omega)
  &= (2 * e^(j 2 Omega))/((e^(j Omega)+0.2)(e^(j Omega)+0.6)) * 1/(e^(j Omega) - 0.1)\
  &= A/(e^(j Omega)+0.2) + C/(e^(j Omega)+0.6) + C/(e^(j Omega)-0.1)\ 
  $
  
  $
  A 
  &= [(e^(j Omega)+0.2) *(2 * e^(j 2 Omega))/((e^(j Omega)+0.2)(e^(j Omega)+0.6)) * 1/(e^(j Omega) - 0.1)]_(e^(j Omega) = -0.2) \
  &= [(2 * e^(j 2 Omega))/((e^(j Omega)+0.6)) * 1/(e^(j Omega) - 0.1)]_(e^(j Omega) = -0.2)\
  &= (2 * (-0.2)^2)/((-0.2+0.6)) * 1/(-0.2 - 0.1)\
  &= (2 * 0.04)/(0.4) * 1/(-0.3)\
  &= (0.08)/(0.4) * 1/(-3/10)\
  &= (8/100)/(40/100) * (-10/3)\
  &= (8)/(40) * (-10/3)\
  &= 0,2 * (-10/3)\
  &= -2/3\ 
  $
  $
  B
  &= [(e^(j Omega)+0.6) *(2 * e^(j 2 Omega))/((e^(j Omega)+0.2)(e^(j Omega)+0.6)) * 1/(e^(j Omega) - 0.1)]_(e^(j Omega) = -0.6)\
  &= [(2 * e^(j 2 Omega))/((e^(j Omega)+0.2)) * 1/(e^(j Omega) - 0.1)]_(e^(j Omega) = -0.6)\
  &= (2 * (-0.6)^2)/(((-0.6)+0.2)) * 1/((-0.6) - 0.1)\
  &= (2 * (0.36))/(((-0.6)+0.2)) * 1/((-0.6) - 0.1)\
  &= (0.72)/(-0.4) * 1/(-0.7)\
  &= (72/100)/(-40/100) * 1/(-7/10)\
  &= (72)/(-40) * (-10/7)\
  &= (72)/(4) * 1/7\
  &= (72)/(28) \
  &= (36)/(14) \
  &= (18)/(7) \
  $

  $
  C
  &=[(e^(j Omega)-0.1) *(2 * e^(j 2 Omega))/((e^(j Omega)+0.2)(e^(j Omega)+0.6)) * 1/(e^(j Omega) - 0.1)]_(e^(j Omega) = 0.1) \
  &=[(2 * e^(j 2 Omega))/((e^(j Omega)+0.2)(e^(j Omega)+0.6)) ]_(e^(j Omega) = 0.1) \
  &=(2 * (0.1)^2)/(((0.1)+0.2)((0.1)+0.6)) \
  &=(2 * 0.01)/((0.3)(0.7)) \
  &=(0.02)/(0.21) \
  &=(2/100)/(21/100) \
  &=2/21 \
  $
  
  $
  Y[Omega]/e^(j Omega) &= - 2/3 * 1/(e^(j Omega)+0.2) + 18/7 * 1/(e^(j Omega)+0.6) + 2/21 * 1/(e^(j Omega)-0.1)\
  Y[Omega] &= - 2/3 * e^(j Omega)/(e^(j Omega)+0.2) + 18/7 * e^(j Omega)/(e^(j Omega)+0.6) + 2/21 * e^(j Omega)/(e^(j Omega)-0.1)\
  &arrow.t.b.double\
  y[n] &= #rect()[$ - 2/3 * (-0.2)^n u[n] + 18/7 (-0.6)^n u[n] + 2/21 * (0.1)^n u[n] $]
  $

4. Considere um sistema linear invariante ao deslocamento com resposta à amostra unitária $h[n] = delta[n] + delta[n-1]$. Encontre a saída do sistema quando a entrada é $x[n] = 1 + cos(pi n "/" 10) $.

  $
  y[n] 
  &= h[n] star x[n]\
  &= (delta[n] + delta[n-1]) star (1 + cos(pi n "/" 10))\
  &= (1 + cos(pi n "/" 10) + (1 + cos(pi (n-1) "/" 10) )\
  &= #rect()[$ 2 + cos(pi n "/" 10) + cos(pi (n-1) "/" 10) $]
  $

5. Sabendo que a resposta ao impulso de um sistema linear invariante ao deslocamento é $h[n] = a^n u[n]$ com $|a| < 1$. Encontre a resposta à entrada $x[n] = 1$.

  $
  h[n] &<==> H[Omega]\
  a^n u[n] &<==> e^(j Omega)/(e^(j Omega) - a) \ \

  x[n] &<==> X[Omega]\
  a &<==> a * pi 2 delta[Omega]\
  1 &<==> 1 * pi 2 delta[Omega]\
  $

  $
  Y[Omega] 
  &= H[Omega] * X[Omega]\
  &= e^(j Omega)/(e^(j Omega) - a) * 1 * pi 2 delta[Omega]\
  &arrow.t.b.double\
  &= #rect()[$ a^n u[n] $]
  $

#pagebreak()

6. Considere o sistema da figura a seguir com entrada $x[n]$ e saída $y[n]$. Os sistemas _LIT_ com resposta $H_(l p) (e^(j omega))$ são filtros passa-baixas ideais, com frequências de corte $pi "/" 4$ e ganho unitário na banda de passagem. Determine a resposta em frequência do sistema. Qual o tipo de filtro?

#align(center)[
   #image("./assets/image.png", width: 80%)
]
  
  $
  w_1(e^(j Omega)) &= X(e^(j(Omega-pi)))\
  w_2(e^(j Omega)) &= H_(l p)(e^(j (Omega- pi)))X(e^(j(Omega-pi)))\
  w_3(e^(j Omega)) &= H_(l p)(e^(j (Omega- pi)))X(e^(j(Omega)))\
  w_4(e^(j Omega)) &= H_(l p)(e^(j Omega))X(e^(j Omega))\
  Y(Omega) 
  &= w_3(e^(j Omega)) + w_4(e^(j Omega))\
  &= H_(l p)(e^(j (Omega- pi)))X(e^(j(Omega))) + H_(l p)(e^(j Omega))X(e^(j Omega))\
  &= [H_(l p)(e^(j (Omega- pi))) + H_(l p)(e^(j Omega))]X(e^(j Omega))\
  H(e^(j Omega)) &= #rect()[$ H_(l p)(e^(j (Omega- pi))) + H_(l p)(e^(j Omega)) $] therefore " Filtro passa faixa" 
  $

  