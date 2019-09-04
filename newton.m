function deriv = fprima(x,funcion)
  f = inline(funcion, "x");
  epsilon = 10^-10;
  deriv = (f(x+epsilon)-f(x))/epsilon
endfunction

function findZero = newton(funcion,a,iter)
  findZero = a
  f = inline(funcion, "x");
  for i=1:iter
    findZero = findZero - (f(findZero)/fprima(findZero,funcion));
  endfor
endfunction
