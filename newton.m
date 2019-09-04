addpath(pwd)
function findZero = newton(f,ff,a,iter)
  aux = a;
  for i=1:iter
    findZero = a - (f(a)/ff(a));
    a = findZero;
  endfor
endfunction
f = @(x)cos(x)-x^3;
ff = @(x)-sin(x)-3*x^2;
newton(f,ff,0.5,10)