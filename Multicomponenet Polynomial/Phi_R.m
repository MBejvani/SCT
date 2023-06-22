function [ Q_R,d ] = Phi_R( p,t,N )

%PHI_R Summary of this function goes here
%   Detailed explanation goes here

p = polyint(p);
[d] = polyval(p,t);
Q_R = conv2(exp(-1j*2*pi * d).',ones(1,N)); %2*pi coef on exp(j...)

end

