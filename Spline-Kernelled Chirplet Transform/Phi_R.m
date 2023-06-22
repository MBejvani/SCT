function [ Q_R ] = Phi_R( scs,dt,N,coff  )

%PHI_R Summary of this function goes here
%   Detailed explanation goes here

k = 1./[scs.order:-1:1];
K = conv2(ones(scs.pieces,1),k);
g = gama( scs,dt );
q = scs.coefs .* K;
q = [q g'];
d = mkpp(scs.breaks,q);
d = ppval(d,scs.breaks);
Q_R = conv2(exp(-1j*coff * d).',ones(1,N)); %2*pi coef on exp(j...)

end

