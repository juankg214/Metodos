pkg load symbolic; # Load the package symbolic

function fk = factorial(k)
  if(k==1 || k==0)
    fk = 1;
  endif
  if(k>1)
    fk = factorial(k-1)*k;
  endif
endfunction
function cf = createpolinomyal(vector,puntosIniciales)
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  n = size(vector)(2);
  syms x;
  f =0;
  for i = 1:n
    faux = vector(i);
    if(i == 1)
      f += faux;
    else
       for j = 1:i-1
          faux *= (x-puntosIniciales(j));
       endfor
       faux = simplify(faux);
       f += faux;
       f = simplify(f);
    endif
  endfor
  ff = function_handle(f);
  cf = f;
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
  n = size(x)(2);
  f = inline(fun,"x");
  matrix = zeros(n,n);
  for j = 1:n
    matrix(j,1) = f(x(j));
  endfor
  for j=2:n
    for i=1:n-j+1
      #rintf("row %i column %i\n",i,j);
      differenceIndex = x(i+j-1)-x(i);
      differenceMatrix = matrix(i+1,j-1)-matrix(i,j-1);
      #sprintf("diff index = %i, diff matr = %i \n",differenceIndex,differenceMatrix)
      matrix(i,j) =  differenceMatrix/differenceIndex;
    endfor
  endfor 
  disp(matrix);
  printf("---------------------- \n")
  difft = matrix(1,1:end);
endfunction

function difftv = difftablevector(x,y)
  n = size(x)(2);
  matrix = zeros(n,n);
  for j = 1:n
    matrix(j,1) = y(j);
  endfor
  for j=2:n
    for i=1:n-j+1
      #rintf("row %i column %i\n",i,j);
      differenceIndex = x(i+j-1)-x(i);
      differenceMatrix = matrix(i+1,j-1)-matrix(i,j-1);
      #sprintf("diff index = %i, diff matr = %i \n",differenceIndex,differenceMatrix)
      matrix(i,j) =  differenceMatrix/differenceIndex;
    endfor
  endfor 
  disp(matrix);
  printf("---------------------- \n")
  difftv = matrix(1,1:end);
endfunction


function dd = DividedDifferences(x,fun)
  difvector = difftable(x,fun);
  disp(difvector);
  printf("---------------------- \n")
  disp(createpolinomyal(difvector,x));
endfunction

function dd = DividedDifferencesVector(x,y)
  difvector = difftablevector(x,y);
  disp(difvector);
  printf("---------------------- \n")
  disp(createpolinomyal(difvector,x));
endfunction
