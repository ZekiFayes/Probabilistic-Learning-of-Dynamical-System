function y = RungeKutta(afun, x, dt, d)
y = x + afun(x, d) * dt;