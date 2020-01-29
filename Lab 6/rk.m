function [x,y] = rk(f,g,h,xk,yk,a,b)
  f = inline(f,"t","x","y");
  g = inline(g,"t","x","y");
  m = (b-a)/h;
  tk = 0;
  K = [];
  for k = 1:m
    f1 = f(tk,xk,yk);
    g1 = g(tk,xk,yk);
    f2 = f(tk+(h/2),xk+(h/2*f1),yk+(h/2*g1));
    g2 = g(tk+(h/2),xk+(h/2*f1),yk+(h/2*g1));
    f3 = f(tk+(h/2),xk+(h/2*f2),yk+(h/2*g2));
    g3 = g(tk+(h/2),xk+(h/2*f2),yk+(h/2*g2));
    f4 = f(tk+h,xk+h*f3,yk+h*g3);
    g4 = g(tk+h,xk+h*f3,yk+h*g3);
    xk = xk + h*(f1+2*f2+2*f3+f4)/6;
    yk = yk + h*(g1+2*g2+2*g3+g4)/6;
    tk += h;
    K = vertcat(K,[k tk xk yk]);
  endfor
  disp("");
  disp("**************************************");
  disp("       k         t             xk          yk");
  disp(K);
  disp("**************************************");
  disp("");
  printf("RESPUESTA: x =  %.*f ; y =  %.*f",10,xk,10,yk);
  disp("");
endfunction


