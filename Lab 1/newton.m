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
newton("1980*(1-exp(-x/10))-98*x",16,100)