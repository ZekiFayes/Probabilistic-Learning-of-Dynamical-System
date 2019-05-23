function xDot = RHSOscillator(x, d )
if( nargin <1)
    xDot = struct('a',0,'omega',0.1,'zeta',0);
    return
end
xDot = [x(2); d.a-2*d.zeta*d.omega*x(2)-d.omega^2*x(1)];