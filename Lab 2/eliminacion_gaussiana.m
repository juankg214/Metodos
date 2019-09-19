addpath(pwd)
function c = eliminacion_gaussiana(a)
 
n = size(a)(1);
for i = 1:n
	fila_pivote = zeros(1,n);
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
		fila_pivote_transformada= fila_pivote.*(fila_a_transformar(i)/fila_pivote(i));
		aux = fila_a_transformar .- fila_pivote_transformada;
		a(j,1:end) = aux;
  endfor
 endfor
c = a;
disp(a)
endfunction
a = [2,0,-1,1,0,2;4,1,-3,4,1,4;0,-1,2,-1,-3,-1;2,-1,0,0,0,0;-2,0,2,-2,-3,0;-2,0,-1,-3,-3,0];
eliminacion_gaussiana(a);