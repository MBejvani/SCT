function [C] = high_pass(v,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = size(v);
n = -m/2:m/2-1;
[X,Y] = meshgrid(n,n);                                
Z = 1-exp(-(X.^2+Y.^2)/(2*sigma.^2));
C = ifft2(fftshift(Z) .* fft2(v));
end