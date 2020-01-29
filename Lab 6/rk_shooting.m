function u = rk_shooting(p,q,r,u1,u2,h,a,b)
  #define the funtions
  p = inline(p,"t");
  q = inline(q,"t");
  r = inline(r,"t");
  #numeber of intervals
  m = (b-a)/h;
  #start t
  t = a;
  u = [];
  # apply the method and operations
  for i = 1:m
    k11 = h*u2;
    k12 = h*(p(t)*u2+q(t)*u1+r(t));
    k21 = h*(u2+1/2*k12);
    k22 = h*(p(t+h/2)*(u2+1/2*k12) + q(t+h/2)*(u1+1/2*k11)+ r(t+h/2));
    k31 = h*(u2+1/2*k22);
    k32 = h*(p(t+h/2)*(u2+1/2*k22) + q(t+h/2)*(u1+1/2*k21) + r(t+h/2));
    k41 = h*(u2+k32);
    k42 = h*(p(t+h)*(u2+k32) + q(t+h)*(u1+k31) + r(t+h));
    u1 = u1 + 1/6*(k11+2*k21+2*k31+k41);
    u2 = u2 + 1/6*(k12+2*k22+2*k32+k42);
    #save the answer
    u(i) = u1;
    vtemp(i) = u2;
    # do the step
    t+= h;
  endfor
endfunction
