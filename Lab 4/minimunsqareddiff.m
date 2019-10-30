function msd = minimunsqareddiff()
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  points = recivepoints(); # get the points 
  y=0; # sumation of ys
  x=0; # sumation of x
  xy=0; # sumation of xy
  x2 =0; # sumation of x^2
  n = size(points)(1); #size of points
  xs=[]; #x points
  ys=[]; #y points
  #calculate the summation
  for i=1:size(points)(1)
    y = y + points(i,2); 
    x = x + points(i,1);
    x2 = x2 + (points(i,1)^2);
    xy = xy + points(i,2)*points(i,1);
    xs = [xs,points(i,1)];
    ys = [ys,points(i,2)];
  endfor
  # create and solve the system
  m = [x2,x;x,n]; #gauss m matrix
  b =[xy,y]; #gauss b values
  coefficients = Factorizacion_Triangular_Vec(m,b); #solve the system with triangular factorization
  #calculate the error
  error=0; #error start at 0
  for i=1:size(points)(1)
    fy = coefficients(1)*points(i,1) + coefficients(2); #calculate the error of every point 
    error = error + (((points(i,2)-fy)^2)/n); #sum the error
  endfor
  #print the answer
  error = sqrt(error); #sqare root of the error 
  disp(strcat("error cuadratico medio = ", mat2str(error))); #show the error 
  fun = cstrcat(mat2str(coefficients(1)),"*x +",mat2str(coefficients(2)));  #create the funtion string
  f= inline(fun,"x"); #create the function to make the plot
  fxs = xs(1):0.1:xs(end); #calculate the x´s for the plot of the function
  fys = arrayfun(f,fxs); #caluclate the y´s of the function
  plot(fxs,fys,"-b",xs,ys,"-r",xs,ys,"*g"); #plot the function, the original line and the points
  title("Diferencia de minimos cuadrados");
  legend("Función final","Linea original","puntos originales","location","northwest");
  msd = fun; #return the value of the function 
endfunction

