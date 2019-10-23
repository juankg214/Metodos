function f=min_cua(t,y)
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  n = 1;#Polynome's grade
  for i = (n+1):-1:1
    A(:,n+2-i)=[t.^(i-1)]';#Each vector is asigned to A columns
  endfor
  
  M = A' * A;
  M_i = inv(M);
  x0 = M_i * A' * y';
  
  EQ = fopen("polynome.m","w");
  fprintf(EQ,"polynome=");
  printf("p(x)=");

	for i = 1:(n+1)
    
		printf("%+fx^%i",x0(i),n+1-i);
    
		fprintf(EQ,"%+f.*x.^%i",x0(i),n+1-i);
    
	endfor

	printf("\n");
  
	fprintf(EQ,";");
	fclose(EQ);

	x = linspace(min(t)-3,max(t)+3,1000);
	polynome

	plot(x,polynome,t,y,"*r");

endfunction
