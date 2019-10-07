pkg load symbolic; # Load the package symbolic

function fk = factorial(k)
  if(k==1 || k==0)
    fk = 1;
  endif
  if(k>1)
    fk = factorial(k-1)*k;
  endif
endfunction
function cf = createpolinomyal(vector)
  warning('off', 'all'); # We turn off the warnings, because there are warnings about using double numbers with symbolic
  n = size(vector)(2);
  syms x;
  f =0;
  for i = 1:n
    printf("iteracion %i \n",i);
    faux = 1;
    for j=1:i-1
      faux *= x-j;  
      disp(faux);
    endfor
    faux = faux/factorial(i-1);
    if(i!=1)
      faux = simplify(faux);
      f += faux*vector(i);
      f = simplify(f);
    else
      f += faux*vector(i);
    endif
    disp(f);
  endfor
  disp(f);
  cf = f;
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
      matrix(i,j) =  matrix(i+1,j-1)-matrix(i,j-1);
    endfor
  endfor 
  disp(matrix);
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
      matrix(i,j) =  matrix(i+1,j-1)-matrix(i,j-1);
    endfor
  endfor 
  disp(matrix);
  difftv = matrix(1,1:end);
endfunction


function dd = DividedDifferences(x,fun)
  difvector = difftable(x,fun);
  disp(difvector);
  printf("---------------------- \n")
  disp(createpolinomyal(difvector));
endfunction

function dd = DividedDifferencesVector(x,y)
  difvector = difftablevector(x,y);
  disp(difvector);
  printf("---------------------- \n")
  disp(createpolinomyal(difvector));
endfunction
