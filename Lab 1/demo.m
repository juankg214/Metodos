addpath(pwd)
fprintf('Laboratorio 1\n Integrantes: \n Juan Camilo Gomez \n Luis Eduardo Otalora \nSantiago Mahecha Pinzon \n \n');
fprintf('Ingrese el metodo numerico a usar: \n 0 = Metodo de Bolzano\n 1 = Metodo de Newton Rhapson\n 2 = Metodo de la secante\n 3 = Metodo de la posicion falsa \n')
metodo = input("numero:")
fun = input('ingrese la funcion f(x) = ','s');
if metodo == 0
  a = input("Ingrese a: ");
  b = input("Ingrese b: ");
  itermax = input("Ingrese el numero maximo de iteraciones: ");
  bolzano(fun,a,b,10^-5,itermax);
  
elseif metodo == 1
  a = input("Ingrese a: ");
  itermax = input("Ingrese el numero maximo de iteraciones: ");
  newton(fun,a,itermax);
  
elseif metodo == 2
  p0 = input('Ingrese la aproximación inicial: ');
  p1 = input('Ingrese la aproximación final: ');
  itermax = input('Ingrese el numero maximo de iteraciones: ');
  secante(fun,p0,p1,10^-5,itermax);
   
elseif metodo == 3
  a = input("Ingrese a: ");
  b = input("Ingrese b: ");
  itermax = input("Ingrese el numero maximo de iteraciones: ");
  falsepos(fun,a,b,10^-5,itermax);
 endif
