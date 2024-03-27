#import "@preview/codelst:2.0.0" : *
#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Análise de Algoritmos de DFT",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Gabriel Luiz Espindola Pedro",),
  date: "13 de Setembro de 2023",
  doc,
)

= Algoritmos

== Sobreposição e soma

#sourcecode[
```matlab
function [yconv,yfft]=sobreposicao_soma(x,h,N)

  t_x = length(x);
  t_h = length(h);
  blocos = t_x/N;

  for i = 1:blocos
      X(i,:) = [x(1+(i-1)*N:i*N) zeros(1,t_h-1)];
  end

  hm = [h zeros(1,N-1)];

  for i = 1:blocos
      Y(i,:) = [zeros(1,(i-1)*N) cconv(X(i,:),hm,N+t_h-1) zeros(1,t_x-(i)*N)];
      YY(i,:) = [zeros(1,(i-1)*N) ifft(fft(X(i,:)).*fft(hm)) zeros(1,t_x-(i)*N)];
  end


  yconv = zeros(1,t_x+t_h-1);
  yfft = zeros(1,t_x+t_h-1);

  for i = 1:blocos
      yconv = yconv+Y(i,:);
      yfft = yfft+YY(i,:);
  end
```
]


== Sobreposição e armazenamento

#sourcecode[
```matlab
function y=sobreposicao_armazena(x,h,N)

  L = length(x)
  K = length(h)
  B = ceil((L + K - 1)/(N - K + 1))

  x=[zeros(1,K-1) x zeros(1,B*(N-K+1))]

  hm = [h zeros(1,N-K)]

  for i = 1:B
      X(i,:) = [x(1+(i-1)*(N-(K-1)):i*N-(i-1)*(K-1))];
  end

  y = cconv(X(1,:),hm,N)
  y = y(K:N)

  for i = 2:B
      y_aux = cconv(X(i,:),hm,N)
      y = [y y_aux(K:N)]
  end
```
]