function s = simpson(fun, a, b, M)
  pkg load symbolic;
  h = (b-a)/(2*M); %H esta dividido en 2*M subintervalos
  f = inline(fun,"x");% Se crea la funcion
  s = (h/3)*(f(a)+f(b)); %Primera parte de la ecuacion
  for i = 1:2*M
    xk(i)=a+i*h; %Se crean los puntos
  endfor
  for k = 1:M-1
    s += (2*h/3)*f(xk(2*k)); %Segunda parte de la ecuacion
  endfor
  for k = 1:M
    s += (4*h/3)*f(xk(2*k-1)); %Tercera parte de la ecuacion
  endfor
  syms x;
  ff = function_handle(diff(e^(x^2),4)); %Se calcula la cuarta derivada de la funcion
  error = ff(1)*(b-a)^5/(180*M^4); %Formula del error
  printf("Solución: f(x) = %f  E(x)= %f\n",s,error );
endfunction
