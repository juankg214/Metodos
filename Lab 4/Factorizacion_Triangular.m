#funcion para factorizacion triangular 
function xvec = Factorizacion_Triangular(a,bv)
#creamos e inicializamos las variables con las dimensiones adecuadas 
n = size(a)(1);
m = size(a)(2);
b = eye(n,n);
# recorremos las filas 
for i = 1:n
	fila_pivote = a(i,1:end);
  counter = i;
  
  if fila_pivote(i) == 0
    printf("Not worked\n");
   endif
  #usamos las filas pivote para evaluar u hacer los calculos 
	for j = i+1:n
    #hacemos los calculos para la nueva fila 
		fila_a_transformar = a(j,1:end);
    #dividimos la fila a transformar entre la pivote para allar el factor de transformacion
    coef = (fila_a_transformar(i)/fila_pivote(i));
    #transformamsos la fila usando el coeficioente
		fila_pivote_transformada= fila_pivote.*coef;
    #guardamos el valor transformado y remplazamos
		aux = fila_a_transformar .- fila_pivote_transformada;
		a(j,1:end) = aux;
    b(j,i) = coef;
  endfor
 endfor
#Asignamos las matrices para las factorizaciones
U = a;
L = b;
y = factorizarInferior(L,bv);
x = factorizarSuperior(U,y);
#imprimimos la solucion
printf("\n")
printf("Solucion: \n");
for i = 1:n
  printf("x%i = %i  ",i,x(i))
endfor
  xvec = x;
endfunction
#funcion de factorizacion inferior
function y1 = factorizarInferior(L,b)
  #optenemos los tamaños e inicializamos la variable respuesta
  n = size(L)(1);
  y = zeros(1,n);
  #recorremos por filas 
  for i = 1:n
    #caso inicial 
    if i == 1
      #la divicion inicial
      y(i) = b(i)/L(i);
    #el resto de los casos
    else
      #realizamos el producto punto hasta el punto que esta el ciclo
      s1 = dot(L(i,1:i-1),y(1:i-1));
      #realizamos la resta con el elemento en b en la fila i
      y(i) = -s1+b(i);
    endif
  endfor
  #retornamos el valor de la factorizacion
  y1 = y;
endfunction
#funcion de factorizacion Superior
function x1 = factorizarSuperior(U,b);
  #optenemos los tamaños e inicializamos la variable respuesta
  n = size(U)(1);
  x = zeros(1,n);
  #recorremos por filas inversamente
  for i = fliplr(1:n)
    #caso inicial 
    if i == n
      #la divicion inicial
      x(i) = b(i)/U(n,n);
    else
      #realizamos el producto punto hasta el punto que esta el ciclo
      s1 = dot(U(i,end:-1:i+1),x(end:-1:i+1));
      #realizamos la resta con el elemento en b en la fila i
      x(i) = (-s1+b(i))/U(i,i);
    endif
  endfor
  #retornamos el valor de la factorizacion
  x1 = x;
endfunction


a = [1,4,-2;3,-2,5;2,3,1];
b = [3,14,11];


