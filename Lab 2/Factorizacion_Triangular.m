function [L,U] = Factorizacion_Triangular(a,bv)
n = size(a)(1);
m = size(a)(2);
b = eye(n,n);
for i = 1:n
	fila_pivote = zeros(1,m);
  counter = i;
  
  while fila_pivote(i) == 0
    if counter <= n
      fila_pivote = a(counter,1:end);  
      aux_fila =  a(i,1:end);
      a(i,1:end) = a(counter,1:end);
      a(counter,1:end) = aux_fila;
      counter += 1;
    endif
  endwhile
	for j = i+1:n
		fila_a_transformar = a(j,1:end);
    coef = (fila_a_transformar(i)/fila_pivote(i));
		fila_pivote_transformada= fila_pivote.*coef;
		aux = fila_a_transformar .- fila_pivote_transformada;
		a(j,1:end) = aux;
    b(j,i) = coef;
  endfor
 endfor
U = a;
L = b;
y = factorizarInferior(L,bv);
x = factorizarSuperior(U,y);
printf("Solucion: \n");
for i = 1:n
  printf("x%i = %i  ",i,x(i))
endfor

endfunction

function y1 = factorizarInferior(L,b)
  n = size(L)(1);
  y = zeros(1,n);
  for i = 1:n
    if i == 1
      y(i) = b(i)/L(i);
    else
      s1 = dot(L(i,1:i-1),y(1:i-1));
      y(i) = -s1+b(i);
    endif
  endfor
  y1 = y;
endfunction

function x1 = factorizarSuperior(U,b);
  n = size(U)(1);
  x = zeros(1,n);
  for i = fliplr(1:n)
    if i == n
      x(i) = b(i)/U(n,n);
    else
      s1 = dot(U(i,end:-1:i+1),x(end:-1:i+1));
      x(i) = (-s1+b(i))/U(i,i);
    endif
  endfor
  x1 = x;
endfunction


a = [1,4,-2;3,-2,5;2,3,1];
b = [3,14,11];


