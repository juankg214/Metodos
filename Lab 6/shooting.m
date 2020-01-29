function x= shooting(p,q,r,alpha,beta,a,b,h)
  pvi = "1.25+0.486089652*t-2.25*t^2+2*t*atan(t)+1/2*(t^2-1)*log(1+t^2)";
  pvi = inline(pvi,"t");
  u1= rk_shooting(p,q,r,1,0,h,a,b);
  uf = inline(strcat(p,"+",q,"+",r),"t");
  v1 = rk_shooting(p,q,"0",0,1,h,a,b);
  vf = inline(strcat(p,"+",q),"t");
  m = (b-a)/h;
  w=[];
  pv=[];
  w2 =[];
  k=[];
  tvec = []
  t =a;
  const = ((beta - u1(m))/v1(m));
  for i=1:m
    tvec(i) = t;
    pv(i) = pvi(t);
    w(i) = u1(i) + const*v1(i);
    t=t+h;
  endfor
  disp("        K          u          v          w         Error");
  disp(horzcat([1:m]',u1',v1',w',abs(pv'-w')))
  
 
endfunction
#shooting("2*t/(1+t^2)","-2/(1+t^2)","1",1.25,-0.95,0,4,0.2) ejercicio
#shooting("-2/t","2/t^2","sin(log(t))/t^2",1,2,1,2,0.1) la que vimos en el pdf