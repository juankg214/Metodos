function x= shooting(p,q,r,alpha,beta,a,b,h)
  u,= rk_shooting(p,q,r,1,0,h,a,b)
  uf = inline(strcat(p,"+",q,"+",r),"t")
  v = rk_shooting(p,q,"0",0,1,h,a,b)
  vf = inline(strcat(p,"+",q),"t")
  m = (b-a)/h;
  w=[];
  k=[];
  t =a;
  for i=1:m
    w(i) =(beta - u(i))/v(i)
    t=t+h;
    k(i)=i;
  endfor
  disp("        K          u          v          w         Error");
  x = horzcat(k',u',v',w');
endfunction

