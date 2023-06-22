function [ g ] = gama( scs,dt )

% gama is a function for obtaning integral constant of local polynomial.
%   inputs : scs : Smoothing cube spline structure
%             dt : sampling rate
%   output : g : vector of integral constant of local polynomial.

k = 1:scs.order;
cg = fliplr(scs.coefs(2:end,:)) * ((-dt).^k./k)';
g(1) = 0;
for i = 1:scs.pieces-1  
    g(i+1) = g(i) - cg(i);
end

end

