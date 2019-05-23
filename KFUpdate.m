function d = KFUpdate( d )

s = d.h*d.p*d.h' + d.r; % Intermediate value
k = d.p*d.h'/s; % Kalman gain
v = d.y - d.h*d.m; % Residual
d.m = d.m + k*v; % Mean update
d.p = d.p - k*s*k'; % Covariance update