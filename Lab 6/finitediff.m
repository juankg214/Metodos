function x = finitediff(p,q,r,alpha,beta,a,b,h)
  pvi = "1.25+0.486089652*t-2.25*t^2+2*t*atan(t)+1/2*(t^2-1)*log(1+t^2)";
  pvi = inline(pvi,"t");
  p = inline(p,"t");
  q = inline(q,"t");
  r = inline(r,"t");
  m = (b-a)/h;
  t = 0;
  a = [];
  b = [];
  c = [];
  d = [];
  pv = [];
  t = [];
  e0 = (h/2*p(1)+1)*alpha;
  eN = (-h/2*p(m)+1)*beta;
  K = [1:m];
  tj = h;
  a(1)=0;
  for j = 1:m
    t(j)=tj;
    pv(j)=pvi(tj);
    if(j!=m)
      s = p(tj+h)-1;
      a(j+1)= (-h./2).*s;
    endif
    b(j) =  2 + h^2*q(tj);
    if(j!=m)
      c(j) = (h/2)*p(tj)-1;
    else
      c(j)=0;
    endif
    
    if(j==1)
      d(j) = -h^2*r(tj)+e0;
    elseif(j==m)
      d(j) = -h^2*r(tj)+eN;
    else
      d(j) = -h^2*r(tj);
    endif
    tj += h;
    
  endfor
  disp("Solution")
  x = TDMAsolver(a,b,c,d);
  x = horzcat(K',t',x',pv');
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
