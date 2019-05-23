function d = KFPredict( d )
% The first path is if there is no input matrix b
if( isempty(d.b) )
    d.m = d.a*d.m;
else
    d.m = d.a*d.m + d.b*d.u;
end
d.p = d.a*d.p*d.a' + d.q;