def p(t):
    return 2*t/(1+t**2)
def r(t):
    return 1
h=0.2
t=h
alpha =1.25
m = int(4/h)
beta = -0.95
e0 = (h/2*p(1)+1)*alpha
eN = (-h/2*p(m)+1)*beta
d =[]
d.append(-h/2*1+e0)
for i in range(1,m-1):
    r = -h**2*1
    d.append(r)
    t = t+h
d.append(-h**2*1+eN)
for i in d:
    print(i)