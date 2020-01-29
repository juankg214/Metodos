import math
def f(x):
    return (2/x**2)+(math.sin(math.log1p(x))/x**2)
print(f(1.1))