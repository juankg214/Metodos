function msd = minimunsqareddiff()
  points = recivepoints(); # get the points 
  y=0;
  x=0;
  xy=0;
  x2 =0;
  n = size(points)(1);
  xs=[];
  ys=[];
  #calculate the summation
  for i=1:size(points)(1)
    y = y + points(i,2);
    x = x + points(i,1);
    x2 = x2 + (points(i,1)^2);
    xy = xy + points(i,2)*points(i,1);
    xs = [xs,points(i,1)];
    ys = [ys,points(i,2)];
  endfor
  disp(xs)
  # create and solve the system
  m = [x2,x;x,n];
  b =[xy,y];
  disp(m);
  disp(b);
  coefficients = Factorizacion_Triangular(m,b);
  #calculate the error
  error=0;
  for i=1:size(points)(1)
    fy = coefficients(1)*points(i,1) + coefficients(2);
    error = error + (((points(i,2)-fy)^2)/n);
  endfor
  #print the answer
  error = sqrt(error);
  disp(strcat("error = ", mat2str(error)));
  fun = cstrcat(mat2str(coefficients(1)),"*x +",mat2str(coefficients(2))); 
  f= inline(fun,"x");
  fxs = xs(1):0.1:xs(end);
  fys = arrayfun(f,fxs);
  plot(fxs,fys,"-b",xs,ys,"-r",xs,ys,"*g");
  msd = fun;
endfunction

