function f=min_cua(t,y)
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  n = input("Ingrese el grado del polinomio,n=");#We ask user to define de polynome grade
  #n = 1;#Polynome's grade
	for i = (n+1):-1:1
		A(:,n+2-i)=[t.^(i-1)]';#Each vector is asigned to A columns
	endfor

	M = A' * A;
	M_i = inv(M);#inv(M) is the invertible matrix of M
	x0 = M_i * A' * y';#x0 is the vector with (n+1) polynome coeficients

	EQ = fopen("polynome.m","w");#We save polynome's expression in polynome.m with octave syntax in order to execute it as a script
  	fprintf(EQ,"polynome=");#With fprintf we print that expression in console
  
	printf("p(x)=");

	for i = 1:(n+1)
    
		printf("%+fx^%i",x0(i),n+1-i); #Define the polynome until grade n
    
		fprintf(EQ,"%+f.*x.^%i",x0(i),n+1-i);#Save polynome un polynome.m
    
	endfor

	printf("\n");
  
	fprintf(EQ,";");
	fclose(EQ);

	x = linspace(min(t)-3,max(t)+3,1000);# linspace() returns a row vector with 1000 linearly spaced elements between min(t)-3 and max(t)+3.
	polynome #We call polynome value from de .m file

	plot(x,polynome,t,y,"*r");

endfunction
