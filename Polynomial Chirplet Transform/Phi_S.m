function [ Q_S,d ] = Phi_S( p,t )

%PHI_S Summary of this function goes here
%   Detailed explanation goes here

[d] = polyval(p,t);
Q_S = exp(1j*2*pi* conv2(t',d)); %2*pi coef on exp(j...)

end

