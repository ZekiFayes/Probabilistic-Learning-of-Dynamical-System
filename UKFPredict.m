function d = UKFPredict( d )
pS = chol(d.p)'; % square root of covariance
nS = length(d.m);
nSig = 2*nS + 1;
mM = repmat(d.m,1,nSig);
x = mM + d.c*[zeros(nS,1) pS -pS];
xH = Propagate( x, d );
d.m = xH*d.wM;
d.p = xH*d.w*xH' + d.q;
d.p = 0.5*(d.p + d.p'); % Force symmetry

%% Propagate each sigma point state vector
function x = Propagate( x, d )

for j = 1:size(x,2)
    x(:,j) = RungeKutta(d.f, x(:, j), d.dT, d.fData);
end