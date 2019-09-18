function c = jacobi(a,b,x)
  max_iter = 20;
  n = size(a)(1);
  x_aux = zeros(1,n);
   K = []; #Matriz que imprime.
   printf("Current solution K = 0 : ");
   disp(x);
  for count = 1:max_iter
	  for i = 1:n
     		aux1 = 0;
      		aux2 = 0;
      		if i != 1
		    aux1 = dot(a(i,1:i-1),x(1:i-1));
       		endif
       		if i != n
		    aux2 = dot(a(i,i+1:end),x(i+1:end));
        	endif
		  x_aux(i) = (b(i) - aux1 - aux2)/a(i,i);
    endfor
  if difference_vectors(x,x_aux)
    break
   endif
  x = x_aux;
  printf("Current solution K = %i", count);
  disp(x);
  endfor
c = x;
fprintf("Solucion");
disp(x)
endfunction

a = [4,-1,1;4,-8,1;-2,1,5];
b = [7,-21,15];
x = [1,2,2];
jacobi(a,b,x)
