addpath(pwd)
fprintf('Laboratorio 2\n Integrantes: \n Juan Camilo Gomez \n Luis Eduardo Otalora \nSantiago Mahecha Pinzon \n \n');
fprintf('Ingrese el metodo numerico a usar: \n 0 = Metodo de Factorizacion Triangular\n 1 = Metodo de Jacobi\n ');
metodo = input("numero:")
n = input('Ingrese n: ');
matriz = recivematrix(n, "a");
printf("\n");
b = recivematrix(n, "b");
printf("\n");
showMatrix(matriz,b,n);
if metodo == 0
  Factorizacion_Triangular(matriz,b);
elseif metodo == 1
  printf("Ingrese el punto cercano: \n");
  x = recivematrix(n, "x");
  printf("\n");
  jacobi(matriz,b,x);
 endif
