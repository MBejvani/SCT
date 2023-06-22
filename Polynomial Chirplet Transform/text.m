clc,clear

t = 0:.2:10-.2;
tt = 0:.05:10-.05;
x = sin(2*pi*.2*t) + cos(2*pi*.5*t);


% p(end+1) = 0;
[p, S, mu] = polyfit(t,x,10);
% [y,delta]= polyval(p,t,S,mu);
[y,delta] = polyval(p,tt,S,mu);
plot(t,x,tt,y)