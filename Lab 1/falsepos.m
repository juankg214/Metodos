function [c] = falsepos(fx, a, b, error, itermax)
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
