function [f, g] = CToDZOH( a, b, T )
if( nargin < 1 )
    Demo;
    return
end
[n,m] = size(b);
q = expm([a*T b*T;zeros(m,n+m)]);
f = q(1:n,1:n);
g = q(1:n,n+1:n+m);


%% Demo
function Demo
T = 0.5;
fprintf(1,'Double integrator with a %4.1f second time step.\n',T);
a = [0 1;0 0]
b = [0;1]
[f, g] = CToDZOH( a, b, T );
f
g