addpath(pwd);
 function [c] = bolzani(f, a, b, error, itermax)
  c = (a+b)/2
  a1=a;
  b1=b;
  iter = 0;
  if f(a)*f(b) >= 0
    disp("No hay solucion")
  else
    while(abs(f(c)) > error)
    iter = iter+1;
    c = (a1+b1)/2;
      if f(a)*f(c) < 0
        b1 = c;
       elseif f(b)*f(c) < 0
        a1 = c;
        end
      if iter >= itermax
        disp("failed")
        break
        end

endwhile
end
endfunction
disp("entered")
f = @(x)2*x^3-x^2+5;
bolzani(f,-4,-1,0.01)

