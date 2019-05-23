function d = UKFWeight( d )

% Compute the fundamental constants
n = length(d.m);
a2 = d.alpha^2;
d.lambda = a2*(n + d.kappa) - n;
nL = n + d.lambda;
wMP = 0.5*ones(1,2*n)/nL;
d.wM = [d.lambda/nL, wMP]';
d.wC = [d.lambda/nL+(1-a2+d.beta), wMP];
d.c = sqrt(nL);
% Build the matrix
f = eye(2*n+1) - repmat(d.wM,1,2*n+1);
d.w = f*diag(d.wC)*f';