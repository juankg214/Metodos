addpath(pwd)
function [c] = bolzani(fx, a, b, error, itermax)
  f = inline(fx,"x");
  c = (a+b)/2;
  K = [];
  iter = 0;
  if (f(a)*f(b) >= 0) disp("No hay solucion");
  else
    while(abs(f(c)) > error && iter < itermax)
      c = (a+b)/2;
      K = vertcat(K,[iter a b c f(a) f(b) f(c)]);
        if (f(a)*f(c) < 0) b = c;
        elseif (f(b)*f(c) < 0) a = c; end
      iter = iter+1;
    endwhile
    disp("    Iteracion      a           b            c         f(a)        f(b)         f(c)")
    disp(K);
  end
endfunction
bolzani("x^3",-1,2,10^-20,100)
