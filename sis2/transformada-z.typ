#show math.ast : math.dot.op
#set math.vec(delim: "[")

= Trabalho de Sinais e Sistema II - Transformada Z
=== Gabriel Luiz Espindola Pedro
Considere um sistema linear e invariante no tempo com as condições inicias $y[-1] = 1$ e $y[-2] = 1$ e descrito pela equação diferença

$
y[n] - y[n-1] + 0.21 y[n-2] = x[n]
$

e sinal de entrada $x[n] = (1 - 0.9^n)u[n]$

#[
  #set enum(numbering: "a)", number-align: left)
  
  + Determine a expressão da função de transferência do sistema (cálculo)
  + Represente graficamente o sistema no plano z. Verifique e justifique a estabilidade do sistema.
  + Determine a expressão da resposta ao impulso do sistema (cálculo e via simulação).
  + Represente graficamente a resposta ao impulso do sistema.
  + Determine a expressão da resposta em frequência do sistema (módulo e fase).
  + Represente graficamente a resposta em frequência do sistema (módulo e fase).
  + Represente graficamente o sinal de entrada.
  + Determine a transformada z do sinal de entrada (via tabela/propriedades/definição e via simulação).
  + Represente o sinal de entrada no plano z.
  + Determine a TZ da resposta do sistema ao sinal de entrada, admitindo condições iniciais nulas. Represente-a no plano z.
  + Determine a expressão da resposta do sistema ao sinal de entrada.
  + Identifique a componente homogênea e a componente particular na expressão da resposta do sistema.
  + Identifique a componente transitória e a componente estacionária na expressão da resposta do sistema.
  + Represente a resposta do sistema ao sinal de entrada.
  + Represente a resposta do sistema ao sinal de entrada utilizando a função filter.
  + Admita agora as condições iniciais não nulas. Determine o sinal $x_(C I)[n]$ que, colocado na entrada do sistema com condições iniciais nulas, provoca uma resposta equivalente à existência das condições iniciais.
  + Determine a TZ da resposta do sistema às condições iniciais.
  + Determine a expressão da resposta do sistema às condições iniciais.
  + Determine a resposta complete do sistema admitindo condições iniciais não nulas.
  + Represente a resposta do sistema ao sinal de entrada, admitindo condições iniciais não nulas.
  + Represente a resposta do sistema ao sinal de entrada utilizando a função filter.  
]

== a) Determine a expressão da função de transferência do sistema (cálculo)

A função de transferência $H[z]$ é definida por:

$
H[Z] = Y[z]/X[z]
$

Para obter a equação nesta forma, primeiro aplicamos a transformada $cal(Z)$ a equação diferença:

$
y[n] - y[n-1] + 0.21 y[n-2] = x[n] arrow.l.r.double.long^cal(Z) Y[z] - Y[z]*z^(-1) + 0.21 Y[z]*z^(-2) = X[z]
$

Isolando $Y[z]$ e $X[z]$:

$
&Y[z] - Y[z]*z^(-1) + 0.21 Y[z]*z^(-2) = X[z]\
&Y[z]*(1 - z^(-1) + 0.21 z^(-2)) = X[z]\
H[z]=&Y[z]/X[z] = 1/(1 - z^(-1) + 0.21 z^(-2))
$

== b) Represente graficamente o sistema no plano z. Verifique e justifique a estabilidade do sistema.

Utilizando o software MATLAB, utilizo a função informo os valores obtidos para dos coeficientes da minha função de transferência antes de executar as frações parciais e utilizo a função `zplane` para gerar o gráfico do plano Z.

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
b = 1;
a = [1 -1 0.21];

zplane(b,a);
```
],[
#image("./assets/zplane.png", height: 13em)])

Como podemos analisar no gráfico gerado os polos do sistema estão dentro do circulo unitário portanto é estável.

== c) Determine a expressão da resposta ao impulso do sistema (cálculo e via simulação).

Multiplicamos equação por $z^2/z^2$, desta maneira podemos fatorar a equação linear no divisor e separar em frações parciais:

$
H[z] 
&= z^2/(z^2 - z^1 + 0.21)\
&= z^2/((z-0.7)(z-0.3))\
H[z]/z &= z/((z-0.7)(z-0.3))\
&= A/(z-0.7) + B/(z-0.3)
$

Calculando os valores das contantes para as frações parciais:

#grid(
  columns: (1fr, 1fr),
  [$
  A 
  &= [(z-0.7) (z/((z-0.7)(z-0.3)))]_(z=0.7)\
  &= [z/(z-0.3)]_(z=0.7)\
  &= 0.7/((0.7)-0.3)\
  &= 0.7/0.4 = 7/4 = 1.75
  $],
  [$
  B 
  &= [(z-0.3) (z/((z-0.7)(z-0.3)))]_(z=0.3)\
  &= [z/(z-0.7)]_(z=0.3)\
  &= 0.3/((0.3)-0.7)\
  &= 0.3/(-0.4) = -3/4 = -0.75
  $]
)

Aplicando os  valores obtidos, obtemos:

$
H[z]/z &= 7/4 * 1/(z-0.7) - 3/4 * 1/(z-0.3)\ 

H[z] &= 7/4 * z/(z-0.7) - 3/4 * z/(z-0.3)
$

Para calcular a resposta ao impulso do sistema aplicamos a transformada inversa a função de transferência, portanto:

$
H[z] &= 7/4 * z/(z-0.7) + 3/4 * z/(z-0.3) arrow.l.r.double.long^cal(Z^(-1)) 
h[n] = 7/4 0.7^n u[n] - 3/4 0.3^n u[n]
$

Utilizando o MATLAB para validar o resultado obtido, temos:

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
[r p k] = residuez(b, a)

syms z
iztrans(z^2/((z-0.7)*(z-0.3)))
```
],[
  $  r = vec(1.75, -0.75)\
  p = vec(0.7)\ 
  k = vec()$
  \
  `ans =` $(7(7/10)^n)/4 - (3(3/10)^n)/4 $
])



== d) Represente graficamente a resposta ao impulso do sistema.

Utilizando o MATLAB é possível representar a reposta ao impulso do sistema utilizando a função `impz`:

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
n = 20;

h = impz(b, a, n);

stem(0:n-1, h, 'filled', 
     'LineWidth', 1.5);
```
],[#image("./assets/impulse-response.png", height: 13em)])

== e) Determine a expressão da resposta em frequência do sistema (módulo e fase).

$
H[Omega] = H[z]|_(z=e^(j Omega)) 
&= 7/4 * e^(j Omega)/(e^(j Omega)-0.7) + 3/4 * e^(j Omega)/(e^(j Omega)-0.3) 
$

== f) Represente graficamente a resposta em frequência do sistema (módulo e fase).

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
w = 0 : pi/100 : pi;
[H w] = freqz(b,a,w);

plot(w,abs(H));grid on;

axis([min(w) max(w) 0 max(abs(H))])
```
],[#image("./assets/frequency-response.png", height: 13em)])

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
plot(w,angle(H)); grid on
axis([min(w) max(w) -pi/2 pi/2])
```
],[#image("./assets/frequency-response-2.png", height: 13em)])


== g) Represente graficamente o sinal de entrada.

O enunciado informa que o sinal de entrada é dado por:

$
x[n] = (1-0.9^n)u[n]
$

Utilizando o MATLAB para desenhar o gráfico deste sinal obtemos:

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
n = 0 : 20;
x=(1-0.9.^(n));
figure(5);
stem(n,x,'filled'); grid on
```
],[#image("./assets/x.png", height: 13em)])

== h) Determine a transformada z do sinal de entrada (via tabela/propriedades/definição e via simulação).

Sabendo que:

$
u[n] &arrow.r.l.double.long^cal(Z) z/(z-1)\
alpha^n u[n] &arrow.r.l.double.long^cal(Z) z/(z-alpha)\
$

Portanto desenvolvendo a equação do sinal de entrada obtemos:

$
x[n] 
&= (1-0.9^n)u[n]\
&= 1 u[n] - 0.9^n u[n]\
cal(Z) &arrow.t.b.double\
X[z] &= z/(z-1) - z/(z-0.9)
$

Utilizando a função `ztrans`

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
syms n
X= simplify(ztrans(1-0.9^n))
```
],[`ans =` $z/(z-1) - z/(z-0.9)$])
      
== i) Represente o sinal de entrada no plano z.

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
b=[0 0.1];
a=poly([1 0.9]);

zplane(b,a)
```
],[#image("./assets/x-zplane.png")])

== j) Determine a TZ da resposta do sistema ao sinal de entrada, admitindo condições iniciais nulas. Represente-a no plano z.

$
Y[z] 
&= H[z] * X[z] \
&=  (7/4 * z/(z-0.7) - 3/4 * z/(z-0.3)) * (z/(z-1) - z/(z-0.9))\
&= ((1.75 * z (z-0.3)-0.75 * z(z-0.7))/((z-0.7) * (z-0.3))) *
   ((z(z-0.9) - z(z-1))/((z-1)*(z-0.9)))\
&= (((1.75 * z (z-0.3)-0.75 * z(z-0.7)) * ((z(z-0.9) - z(z-1)))) /
   ((z-0.7) * (z-0.3) * (z-1) * (z-0.9)))\
&= (z((1.75 * (z-0.3)-0.75 * (z-0.7)) * z(((z-0.9) - (z-1)))) /
   ((z-0.7) * (z-0.3) * (z-1) * (z-0.9)))\
Y[z]/z &= (((1.75 * (z-0.3)-0.75 * (z-0.7)) * (((z-0.9) - (z-1)))) /
   ((z-0.7) * (z-0.3) * (z-1) * (z-0.9)))\
&= 2.0417/(z-0.7) - 0.0536/(z-0.3) + 4.7619/(z-1) - 6.5/(z-0.9)\
Y[z] &= 2.0417 * z/(z-0.7) - 0.0536* z/(z-0.3) + 4.7619 * z/(z-1) - 6.5* z/(z-0.9)\
$

#image("./assets/yz-zplane.png")

== k) Determine a expressão da resposta do sistema ao sinal de entrada.

$
Y[z] &= 2.0417 * z/(z-0.7) - 0.0536* z/(z-0.3) + 4.7619 * z/(z-1) - 6.5* z/(z-0.9)\
cal(Z^(-1)) &arrow.t.b.double\
y[n] &= 2.0417 * 0.7^n u[n] - 0.0536 * 0.3^n u[n] + 4.7619 * u[n] - 6.5 * 0.9^n u[n]
$
  
== l) Identifique a componente homogênea e a componente particular na expressão da resposta do sistema.

$
y[n] &= underbrace(2.0417 * 0.7^n u[n] - 0.0536 * 0.3^n u[n], "homogênea") + 
        underbrace(4.7619 * u[n] - 6.5 * 0.9^n u[n], "particular")
$
  
== m) Identifique a componente transitória e a componente estacionária na expressão da resposta do sistema.

$
y[n] &= underbrace(2.0417 * 0.7^n u[n] - 0.0536 * 0.3^n u[n], "transitória") + 
        underbrace(4.7619 * u[n], "estacionária") -
        underbrace(6.5 * 0.9^n u[n], "transitória")
$

== n) Represente a resposta do sistema ao sinal de entrada.

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
n=0:10;
x=2.0417*0.7.^n-0.0536*0.3.^n+4.7619 ...
  -6.5*0.9.^n;

stem(n,x,'filled'); grid on;
```
],[#image("./assets/yz-response.png")])
  
== o) Represente a resposta do sistema ao sinal de entrada utilizando a função filter.

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
n=0:10;
x=2.0417*0.7.^n-0.0536*0.3.^n+4.7619 ...
  -6.5*0.9.^n;

stem(n,x,'filled'); grid on;
```
],[#image("./assets/yz-filter.png")])

== p) Admita agora as condições iniciais não nulas. Determine o sinal $x_(C I)[n]$ que, colocado na entrada do sistema com condições iniciais nulas, provoca uma resposta equivalente à existência das condições iniciais.

$
Y[z] - (y[-1] + z^(-1)Y[z]) + 0.21) + z^(-1) (y[-2]+z^(-1)y[-1] + z^(-2)Y[z] = X[z]
$

Ou seja:

$
Y[z] (1- z^(-1) + 0.21z^(-2)) &= X[z] + y[-1] - 0.21y[-2] - 0.21z^(-1) y[-1]\
Y[z]&=  X[z]/(1- z^(-1) + 0.21z^(-2)) + (y[-1] - 0.21y[-2] - 0.21z^(-1) y[-1])/(1- z^(-1) + 0.21z^(-2))\
&= X[z]/(1- z^(-1) + 0.21z^(-2)) + (1 - 0.21 - 0.21z^(-1))/(1- z^(-1) + 0.21z^(-2))\
&= X[z]/(1- z^(-1) + 0.21z^(-2)) + (0.79 - 0.21z^(-1))/(1- z^(-1) + 0.21z^(-2))
$

Pelo que:

$
X_(C I) [z] = 0.79-0.21z^(-1)
$

Logo:

$
x_(C I) [n] = 0.79delta[n]-0.21delta[n-1]
$

Verificando com a função `filtic`:


#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
y=[1 1];
xic=filtic(b,a,y) 
```
],[$x_(i c) = vec(0.7900, -0.2100)$])

== q) Determine a TZ da resposta do sistema às condições iniciais.

Imediatamente a partir das expressões acima

$
Y_(x_(C I))[z] = (0.79 - 0.21z^(-1))/(1-z^(-1)+0.21z^(-2))
$

== r) Determine a expressão da resposta do sistema às condições iniciais.

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
b=[0.75 -0.21];
a=[1 -1 0.21];

[r p k]=residuez(b,a)
```
],[$
r &= vec(0.7875, -0.0375)\
p &= vec(0.7000, 0.3000)\
k &= vec()
$]
)

$
Y[z] 
&= 0.7875/(1-0.7z^(-1)) - 0.0375/(1-0.3z^(-1))\
&= 0.7875 z/(z-0.7) - 0.0375 z/(z-0.3)\
cal(Z) &arrow.t.b.double\
y[n] &= 0.7875 * 0.7^n u[n] - 0.0375 * 0.3^n u[n]
$

== s) Determine a resposta completa do sistema admitindo condições iniciais não nulas.

$
y[n] &= underbrace(2.0417 * 0.7^n u[n] - 0.0536 * 0.3^n u[n] + 4.7619 * u[n] - 6.5 * 0.9^n u[n],"condições iniciais nulas")\ &+ 
        underbrace(0.7875 * 0.7^n u[n] - 0.0375 * 0.3^n u[n], "condições iniciais")
$
  
== t) Represente a resposta do sistema ao sinal de entrada, admitindo condições iniciais não nulas.

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
n=0:10;
x=2.0417*0.7.^n-0.0536*0.3.^n+4.7619 ...
-6.5*0.9.^n+0.78750*0.7.^n ...
-0.0375*0.3.^n
stem(n,x,'filled'); grid on;
```
],[#image("./assets/full-response-non-null.png")])

== u) Represente a resposta do sistema ao sinal de entrada utilizando a função filter.  

#grid(columns: (1fr, 1fr),
align(horizon + center)[```matlab
n=0:10;
x=1-0.9.^(n);
b=[1];
a=[1 -1 0.21];
y=filter(b,a,x,xic);
stem(n,y,'filled'); grid on; 
```
],[#image("./assets/full-response-non-null-filter.png")])
