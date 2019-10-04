addpath(pwd)
pkg load symbolic; # Load the package symbolic
function L = lfunction(k,v)
  syms x #Creates variable X
  L = 1; #Initialize L with 1, because its a product.
  xk = v(k)# The K value of X
  for j = 1:size(v)(2) #For, 1 to N
	  if (j!=k) #Only if j and k are different
		  L *= (x-v(j))/ (xk - v(j));# Product. If j and k are the same we would have a 0 in the denominator.
    endif
  endfor
  L=sym(L);# Cast L to sym, so we can apply symbolic methods to it.
  L= simplify(L);# Simplify L
endfunction

function lagrange = lagrangeInterpolation(x,fun)
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  f = inline(fun,"x") # Create function 
  lagrange = 0; #Initialize with 0
  for k = 1:size(x)(2) #For i to N
    lagrange += lfunction(k,x)*f(x(k));# The sumatory of the product of l and y
  endfor
  lagrange = sym(lagrange); # We cast lagrange to symbolic.
  ff = function_handle(lagrange); #With this we cast symbolic function to octave function
  disp(simplify(lagrange)); # We display lagrange interpolation function simplified
  xin = x(1)-1:0.001:x(end)+1; # The x-axis points we are going to display
  y = arrayfun(ff,xin); # we apply the function ff to every value in x, and we get the y-axis 
  plot(xin,y);#We plot the x,y
  hold on;#We are going to add more things to the plot
  grid on;#We add a grid
  for i = 1:size(x)(2)#for every value in the vector 
    plot(x(i),ff(x(i)),"+r");#We plot the point and its image.
  endfor
endfunction

 f=lagrangeInterpolation([0,0.4,0.8,1.2],"cos(x)");
