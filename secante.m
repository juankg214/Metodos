function secante = sec(funcion,a,b ,iter)
  f = inline(funcion,"x")
  p0 = a;
  p1 = b;
  for i = 1:iter
    aux = p1;
    p1 = p1 - (f(p1)*(p1-p0))/(f(p1)-f(p0));
    p0 = aux;
  endfor
  secante = p1
endfunction
