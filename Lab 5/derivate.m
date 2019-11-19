pkg load symbolic; # Load the package symbolic

function cf = createpolinomyal(vector,puntosIniciales,xp)
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  n = size(vector)(2); #Create vector size
  syms x; #Create x variable
  f =0;
  for i = 1:n
    faux = vector(i); # get the number from vector
    if(i == 1)
      f += faux; # the first case, the number place alone 
    else
      faux=0;
      syms x; #Create x variable
       for k = 1:i # other cases 
          ele = 1;
          for j = 1:i
            if(j != k)
              ele *= (x-puntosIniciales(j));
            endif            
          endfor
          #ele = simplify(ele); 
          faux += (ele); # create the numerator with x on symbolic and the vector from the matrix 
       endfor
       faux = vector(i)*faux;
       #faux = simplify(faux); # simplify the numerator
       f += faux; #add the element to the polynomial
       #f = simplify(f); # simplify the polynomial
       disp(f)
    endif
  endfor  
  ff = function_handle(f); # transform to octave function 
  cf = ff; # return the function 
  xin = puntosIniciales(1)-1:0.001:puntosIniciales(end)+1; # The x-axis points we are going to display
  y = arrayfun(ff,xin); # we apply the function ff to every value in x, and we get the y-axis 
  plot(xin,y,"-k");#We plot the x,y
  hold on;#We are going to add more things to the plot
  grid on;#We add a grid
  for i = 1:n#for every value in the vector 
    plot(puntosIniciales(i),ff(puntosIniciales(i)),"+r");#We plot the point and its image.
  endfor
endfunction

function difft = difftable(x,fun)
  n = size(x)(2); #Create vector size
  f = inline(fun,"x"); #Create function defined
  matrix = zeros(n,n); #Diagonal matrix (0)
  for j = 1:n
    matrix(j,1) = f(x(j)); #Vector points in (j,1:n) will take values of f(x(j))
  endfor
  for j = 2:n
    for i = 1:n-j+1
      #printf("row %i column %i\n",i,j);
      differenceIndex = x(i+j-1)-x(i);#Make index difference
      differenceMatrix = matrix(i+1,j-1)-matrix(i,j-1); #make numerator with the previous positions in the matrix 
      #printf("diff index = %i, diff matr = %i \n",differenceIndex,differenceMatrix)
      matrix(i,j) =  differenceMatrix/differenceIndex; # make the division 
    endfor
  endfor 
  disp(matrix); # show the matrix
  printf("---------------------- \n")
  difft = matrix(1,1:end); #return the fisrt row
endfunction


function dd = Derivate(xp,n,h,fun)
  vector=zeros(1,n);
  vector(1,1) = xp;
  for i=1:n-1
     vector(1,(i+1)) = xp+(i*h);
  endfor
  difvector = difftable(vector,fun);
  difvector = difvector(2:end);
  disp(difvector);
  disp(vector);
  printf("---------------------- \n")
  f = createpolinomyal(difvector,vector,xp);
  disp(f(xp));
endfunction


