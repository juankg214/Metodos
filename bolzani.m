addpath(pwd);
 function [c] = bolzani(f, a, b, error, itermax)
  c = (a+b)/2
  disp("Iteracion    a         b       c     f(a)      f(b)     f(c)")
  iter = 0;
  if f(a)*f(b) >= 0
    disp("No hay solucion")
  else
    while(abs(f(c)) > error)
    c = (a+b)/2;
    K = [iter a b c f(a) f(b) f(c)];
    disp(k)
      if f(a)*f(c) < 0
        b = c;
       elseif f(b)*f(c) < 0
        a = c;
        end
      if iter >= itermax
        disp("failed")
        break
        end
 iter = iter+1;
endwhile
end
endfunction
disp("entered")
f = @(x)2*x^3-x^2+5;
bolzani(f,-4,-1,0.01)

