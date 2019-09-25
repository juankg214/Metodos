#funcion para imprimir la matriz 
function m = showMatrix(a,b,n)
  # recibe la martiz a el vector b y la dimension n
  printf("Sistema de Ecuaciones: \n")
  #recorremos las matrices y las imprimimos como un sistema de ecuaciones
  for i = 1:n
    for j = 1:n
      if j == n
         printf("%i*x%i = ",a(i,j),j);
         printf("%i",b(i));
      else
        printf("%i*x%i + ",a(i,j),j)
      endif
    endfor
    printf("\n");
endfor
endfunction