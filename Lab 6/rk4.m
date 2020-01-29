function temp = rk4(func,x,pvi,h)
    K1 = h*func(x,pvi);
    K2 = h*func(x+0.5*h,pvi+0.5*K1);
    K3 = h*func(x+0.5*h,pvi+0.5*K2);
    K4 = h*func(x+h,pvi+K3);
    temp = pvi + (K1 + 2*K2 + 2*K3 + K4)/6;
endfunction