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
  #funs = recivefunctions(); #get the functions from user
  #m = size(funs)(2); #get the number of functions 
  m = input("grado del polinomio \n");
  m = m+1;
  msize=m;
  f = []; #matrix f
  for i=1:n
    for j=1:m
      #fun = inline(funs{j},"x"); #conver the string to a octave´s funtion
      f(i,j) = ((xs(i))^(m-j)); # calculate the value in the matrix with the point and the funtion 
    endfor
  endfor
  m = (f')*f; #get the matrix with the transpose
  b = (f')*(ys');  #get the b with the transpose 
  coefficients = Factorizacion_Triangular_Vec(m,b); #solve the system with triangular factorization
  disp("\n -----------------------------coeff--------------------\n");
  poli = "";
  for i=1:msize
    poli = strcat(poli,mat2str(coefficients(i)),"*x^",mat2str(msize-i));
    if(i<msize)
    poli = strcat(poli,"+");
    endif
  endfor
  disp(poli)
  f= inline(poli,"x"); #create the function to make the plot
  fxs = xs(1):0.1:xs(end); #calculate the x´s for the plot of the function
  fys = arrayfun(f,fxs); #caluclate the y´s of the function
  plot(fxs,fys,"-b",xs,ys,"-r",xs,ys,"*g"); #plot the function, the original line and the points
  title("Diferencia de minimos cuadrados");
  legend("Función final","Linea original","puntos originales","location","northwest");
  msd = poli; #return the value of the function 
endfunction
