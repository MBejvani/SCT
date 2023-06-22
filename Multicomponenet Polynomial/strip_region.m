function [Q] = strip_region(N,p,w,l)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
q = zeros(2*N);
t = 0:2*N-1;
x = 0:2*N-1;
for i = 1:2*N
     xx = (fix(N/2)+p) + l * x(i);
     [c,d] = min(abs(t-xx));
     if c < 1
         q(d,i) = 1;
     end
end
Q = conv2(ones(w,1),q);Q = Q(fix(w/2)+fix(N/2):N+fix(N/2)+fix(w/2)-1,1:N);
end
