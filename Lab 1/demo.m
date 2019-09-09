addpath(pwd);
function [c] = bolzano(fx, a, b, itermax)
  #fx, Funcion objetivo
  #a, Limite inferior
  #b, Limite Superior
  #epsilon, valor que tiende a cero
  #itermax, iteracion maxima.
  f = inline(fx,"x"); #Crea la funcion
  epsilon = 10^-8;
  c = (a+b)/2; # Se calcula el valor medio de los limites
  up = a-5; # Se guarda el valor superior para graficar posteriormente, y se le suma 5 para poder mostrar mayor parte de la funcion
  down= b+5; # Se guarda el valor inferior para graficar posteriormente, y se le suma 5 para poder mostrar mayor parte de la funcion
  K = []; #Matriz que imprime.
  iter = 0; #Contador de iteracion
  if (f(a)*f(b) >= 0) disp("No hay solucion"); # Si los valores evaluados en la funcion de los limites es del mismo signo, terminar la funcion
  else # Si no lo es
    while(abs(f(c)) > epsilon && iter < itermax)# Mientras el valor evualuado en la funcion sea mayor a epsilon, y no haya pasado el limite de iteraciones
      c = (a+b)/2; #Calcular el valor medio
      K = vertcat(K,[iter a b c f(a) f(b) f(c)]); #Añadir nuevos valores al vector
        if (f(a)*f(c) < 0) b = c; #Si f(a) y f(c) tienen signos opuestos entonces c sera el nuevo limite inferior
        elseif (f(b)*f(c) < 0) a = c; end #Si f(b) y f(c) tienen signos opuestos entonces c sera el nuevo limite superior
      iter = iter+1; # Se suma el contador de iteraciones
    endwhile
    disp("    Iteracion      a           b            c         f(a)        f(b)         f(c)")
    disp(K); # Se muestra en pantalla los valores
    x = up:0.01:down; # Se crea un vector desde el limite inicial superior hasta el limite inicial inferior en pasos de 0.01
    z = arrayfun(f,x); # Se le aplica la funcion f(x) a cada valor del vector
    plot(x,z); #Se grafican los valores
    hold on; #Se va a agregar algo mas al plot
    grid on; #add grid
    plot(c,f(c),"+r"); #Se grafica el punto c,f(c) de color red.
    
  end
endfunction
function [c] = falsepos(fx, a, b, error, itermax)
  #fx, Funcion objetivo
  #a, Limite inferior
  #b, Limite Superior
  #error, error maximo, epsilon de la funcion 
  #itermax, numero de iteraciones maximas.
  f = inline(fx,"x"); #define la funcion
  c = b - ((f(b)*(b-a))/(f(b)-f(a))); #calculamos el valor de c basados en la recta entre los puntos 
  K = []; #definimos el vector con las respuestas 
  iter = 0; #defnimos la variable iteradora 
  if (f(a)*f(b) >= 0) disp("No hay solucion"); #evitamos utilizar la funcion en valores con el mismo signo
  else
    while(abs(f(c)) > error && iter < itermax)
      c = b - ((f(b)*(b-a))/(f(b)-f(a))); #calculamos el valor c
      K = vertcat(K,[iter a b c f(a) f(b) f(c)]); #concatenamos el vector de soluciones con la nueva iteracion 
        if (f(a)*f(c) < 0) b = c; # tomamos la decicion segun el signo
        elseif (f(b)*f(c) < 0) a = c; end
      iter = iter+1; #aumentamos en uno la iteracion
    endwhile
    #imprimimos la cabecera de los resultados
    disp("    Iteracion      a           b            c         f(a)        f(b)         f(c)")
    #mostramos los resultados
    disp(K);
    #graficamos la solucion
    x = a-16:0.01:a+10;#Se toma el rango de valores de x respecto al punto inciial
    y = arrayfun(f,x); # Se le aplica la funcion f(x) a cada valor del vector
    plot(x,y); #Se grafican los valores
    hold on; #Se va a agregar algo mas al plot
    grid on;
    plot(c,f(c),"+r");#Se grafica el punto findZero,f(findZero) de color red.
  end
endfunction
function deriv = fprima(x,funcion)#Funcion Derivada, devuelve el valor de la derivada de la funcion evaluada en x
  f = inline(funcion, "x"); # Se crea la funcion
  epsilon = 10^-8;#Epsilon
  deriv = (f(x+epsilon)-f(x))/epsilon#Definicion de derivada
endfunction
function findZero = newton(funcion,a,itermax)
  findZero = a #Se inicia con el punto inicial
  epsilon = 10^-10;#Valor de epsilon
  iter = 0;#Contador de iteraciones
  f = inline(funcion, "x"); #Se crea la funcion
  K = [];
   while(abs(f(findZero)) > epsilon && iter < itermax)# Mientras el valor evualuado en la funcion sea mayor a epsilon, y no haya pasado el limite de iteraciones
    derivada = fprima(findZero,funcion);
    K = vertcat(K,[iter findZero f(findZero) derivada]); #Añadir nuevos valores al vector
    findZero = findZero - (f(findZero)/derivada);#El valor actual menos la division de la funcion evaluada en ese punto sobre la derivada
    iter = iter+1;#Se suma la iteracion
  endwhile
    disp("    Iteracion     C      f(C)       f'(C)")
    disp(K);
    x = a-16:0.01:a+10;#Se toma el rango de valores de x respecto al punto inciial
    y = arrayfun(f,x); # Se le aplica la funcion f(x) a cada valor del vector
    plot(x,y); #Se grafican los valores
    hold on; #Se va a agregar algo mas al plot
    grid on; #add grid
    plot(findZero,f(findZero),"+r");#Se grafica el punto findZero,f(findZero) de color red.
endfunction

fprintf('\Laboratorio 1\n Integrantes: \n Juan Camilo Gomez \n Luis Eduardo Otalora \nSantiago Mahecha Pinzon');
metodo = input('Ingrese el metodo numerico a usar: \n 0 = Metodo de Bolzano\n 1 = Metodo de Newton Rhapson\n 2 = Metodo de la secante\n 3 = Metodo de la posicion falsa')
fun = input('ingrese la funcion f(x) = ','s');
if metodo == 0
  a = input("Ingrese a: ");
  b = input("Ingrese b: ");
  itermax = input("Ingrese el numero maximo de iteraciones: ");
  bolzano(fun,a,b,itermax);
elseif metodo == 1
   a = input("Ingrese a: ");
   itermax = input("Ingrese el numero maximo de iteraciones: ");
   newton(fun,a,itermax);
elseif metodo == 2
   
elseif metodo == 30
  a = input("Ingrese a: ");
  b = input("Ingrese b: ");
  itermax = input("Ingrese el numero maximo de iteraciones: ");
  falsepos(fun,a,b,itermax);
 endif