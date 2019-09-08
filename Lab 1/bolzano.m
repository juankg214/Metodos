addpath(pwd)
function [c] = bolzano(fx, a, b, epsilon, itermax)
  #fx, Funcion objetivo
  #a, Limite inferior
  #b, Limite Superior
  #epsilon, valor que tiende a cero
  #itermax, iteracion maxima.
  f = inline(fx,"x"); #Crea la funcion
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
bolzano("x^3",-1,2,10^-20,100)
