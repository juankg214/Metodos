function deriv = fprima(x,funcion)#Funcion Derivada, devuelve el valor de la derivada de la funcion evaluada en x
  f = inline(funcion, "x"); # Se crea la funcion
  epsilon = 10^-8;#Epsilon
  deriv = (f(x+epsilon)-f(x))/epsilon#Definicion de derivada
endfunction