function x = finitediff(p,q,r,alpha,beta,a,b,h)
  pvi = "1.25+0.486089652*t-2.25*t^2+2*t*atan(t)+1/2*(t^2-1)*log(1+t^2)"; # objective function 
  pvi = inline(pvi,"t"); #create the function objective object
  p = inline(p,"t"); #create function p
  q = inline(q,"t"); #create function q
  r = inline(r,"t"); #create function r
  m = (b-a)/h; #create the number of interval
  tj = a+h; #first step
  #lists and vectos of the matrix
  a = []; # create subdiagonal
  b = []; # main diagonal
  c = []; # create supdiagonal
  d = []; # vector final
  pv = []; #value of the function
  t = []; # actual number
  #constans
  e0 = (h/2*p(tj)+1)*alpha;
  eN = (-h/2*p(m-h)+1)*beta;
  K = [1:m];
  a(1)=0;
  #create the matrix
  for j = 1:m
    #do the step
    t(j)=tj;
    #original value
    pv(j)=pvi(tj);
    #every element of main diagonal
    b(j) =  2 + h^2*q(tj);
    #fisrt elements of the diagonal
    if(j!=m)
      a(j+1)= (-h/2)*p(tj+h)-1;
      c(j) = (h/2)*p(tj)-1;
    else
      #last element
      c(j)=0;
    endif
    #first element to the final vector
    if(j==1)
      d(j) = -h^2*r(tj)+e0;
    #last element to the final vector
    elseif(j==m)
      d(j) = -h^2*r(tj)+eN;
    #middle elements to the final vector      
    else
      d(j) = -h^2*r(tj);
    endif
    #make a step
    tj += h;
  endfor
  #print solution
  disp("Solution")
  #solve the matrix
  xs = TDMAsolver(a,b,c,d);
  #print results
  disp("        K          t          xs          pv         Error");
  x = horzcat(K',t',xs',pv',abs(pv'-xs'));
  #create the funtion to the graph
  y = arrayfun(pvi,t); # we apply the function ff to every value in x, and we get the y-axis 
  plot(t,xs,"-b",t,y,"-r");#We plot the x,y
  hold on;#We are going to add more things to the plot
  grid on;#We add a grid
  #info of the graphic
  title("Combinaciones lineales de minimos cuadrados"); #title
  legend("Función Aproximada","Función Exacta"); #legends
  #labels
  ylabel("eje y"); 
  xlabel("eje x");
endfunction

function x = TDMAsolver(a,b,c,d)
%a, b, c are the column vectors for the compressed tridiagonal matrix, d is the right vector
% N is the number of rows
N = length(d);
 
% Modify the first-row coefficients
c(1) = c(1) / b(1); % Division by zero risk.
d(1) = d(1) / b(1); 
 
for n = 2:1:N
    temp = b(n) - a(n) * c(n - 1);
    if (n<N)
        c(n) = c(n) / temp;
    end
    d(n) = (d(n) - a(n) * d(n - 1)) / temp;
end
 
% Now back substitute.
x(N) = d(N);
for n = (N - 1):-1:1
    x(n) = d(n) - c(n) * x(n + 1);
end
end
