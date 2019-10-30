function linearcombinations
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  points = recivepoints(); #recive the pairs of points 
  n = size(points)(1); #get the number of points 
  xs=[]; #x coordinates
  ys=[]; #y coordinates 
  #asing the coordenates 
  for i=1:n 
    xs = [xs,points(i,1)];
    ys = [ys,points(i,2)];
  endfor
  #recive the funtions 
  funs = recivefunctions(); #get the functions from user
  m = size(funs)(2); #get the number of functions 
  f = []; #matrix f
  for i=1:n
    for j=1:m
      fun = inline(funs{j},"x"); #conver the string to a octave´s funtion
      f(i,j) = fun(xs(j)); # calculate the value in the matrix with the point and the funtion 
    endfor
  endfor
  m = (f')*f; #get the matrix with the transpose
  b = (f')*(ys');  #get the b with the transpose 
  disp("---------------f---------------")
  disp(f);
  disp(f')
  disp("---------------m---------------")
  disp(m);
  disp("---------------b---------------")
  disp(b);
  coefficients=Factorizacion_Triangular(m,b); #get the coefficients with the factorization
  poli = ""
  for i=1:size(coefficients)(1)
    poli = poli + "x^" + mat2str(i);
    if(i<size(coefficients)(1))
      poli = poli + "+";
    endif
  endfor
  disp(poli);
  disp(coefficients);
endfunction
