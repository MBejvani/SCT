function [ Q_S ] = Phi_S( scs,t,coff )

%PHI_S Summary of this function goes here
%   Detailed explanation goes here

d = ppval(scs,scs.breaks);
Q_S = exp(1j*coff * conv2(t',d)); %2*pi coef on exp(j...)

end

