function [c] = falsepos(fx, a, b, error, itermax)
  f = inline(fx,"x");
  c = b - ((f(b)*(b-a))/(f(b)-f(a)));
  K = [];
  iter = 0;
  if (f(a)*f(b) >= 0) disp("No hay solucion");
  else
    while(abs(f(c)) > error && iter < itermax)
      c = b - ((f(b)*(b-a))/(f(b)-f(a)));
      K = vertcat(K,[iter a b c f(a) f(b) f(c)]);
        if (f(a)*f(c) < 0) b = c;
        elseif (f(b)*f(c) < 0) a = c; end
      iter = iter+1;
    endwhile
    disp("    Iteracion      a           b            c         f(a)        f(b)         f(c)")
    disp(K);
  end
endfunction
