function [c] = bolzani(f, a, b, error, itermax)
  c = (a+b)/2;
   K = [];
  iter = 0;
  if f(a)*f(b) >= 0
    disp("No hay solucion")
  else
    while(abs(f(c)) > error && iter < itermax)
    c = (a+b)/2;
     K = vertcat(K,[iter a b c f(a) f(b) f(c)]);
      if f(a)*f(c) < 0
        b = c;
       elseif f(b)*f(c) < 0
        a = c;
      end
 iter = iter+1;
endwhile
disp("    Iteracion      a           b            c         f(a)        f(b)         f(c)")
disp(K);
end
endfunction
f = @(x)x*sin(x)-1;
bolzani(f,0,2,10^-20,100)
