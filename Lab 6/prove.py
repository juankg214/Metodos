def rk4 ( t0, u0, dt, f ):
  f1 = f ( t0,            u0 )
  f2 = f ( t0 + dt / 2.0, u0 + dt * f1 / 2.0 )
  f3 = f ( t0 + dt / 2.0, u0 + dt * f2 / 2.0 )
  f4 = f ( t0 + dt,       u0 + dt * f3 )
  u1 = u0 + dt * ( f1 + 2.0 * f2 + 2.0 * f3 + f4 ) / 6.0

  return u1