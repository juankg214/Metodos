function x = shooting(p,q,r,alpha,beta,a,b,h)
  t = a;
  m = (b-a)/h;
  all = strcat(p,"+",q,"+",r);  
  uf = inline(all,"t");
  disp(uf)
  all = strcat(p,"+",q);
  vf = inline(all,"t");
  u=1
  for j=0:m
    u = rk4(uf,t,u,h);
    t=t+h
    disp(u);
  endfor
endfunction
