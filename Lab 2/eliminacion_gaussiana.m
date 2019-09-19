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
a = [6,-2,2,4;12,-8,6,10;3,-13,9,3;-6,4,1,-18]
eliminacion_gaussiana(a);