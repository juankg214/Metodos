addpath(pwd)
function [L,U] = eliminacion_gaussiana(a)
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
    b(j,i) = round(coef);
  endfor
 endfor
U = a;
L = b;
disp(a)
disp(b)
endfunction

function triangular = factorizar(L,U)
  
endfunction
a = [1,2,3;-2,-3,6;4,1,3];
eliminacion_gaussiana(a);