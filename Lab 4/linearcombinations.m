function linearcombinations
  points = recivepoints();
  n = size(points)(1);
  xs=[];
  ys=[];
  for i=1:n
    xs = [xs,points(i,1)];
    ys = [ys,points(i,2)];
  endfor
  funs = recivefunctions();
  disp(funs);
  m = size(funs)(2);
  disp(m);
  f = [];
  for i=1:n
    for j=1:m
      disp(funs{j});
      fun = inline(funs{j},"x");
      f(i,j) = fun(xs(j));
    endfor
  endfor
  m = (f')*f;
  b = (f')/ys;  
  coefficients=Factorizacion_Triangular(m,b);
endfunction
