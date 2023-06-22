clc,clear all,close all

fs = 150; dt = 1/fs;
t = 0:dt:10-dt;
N = length(t);
f = linspace(0,1/dt/2,N/2);

fi = 50*t+9/4*t.^2+1/9*t.^3-1/40*t.^4;
omega = 50+9/2*t+1/3*t.^2-1/10*t.^3;

ss = sin(2*pi*fi);
r = 0 + .6 * randn(1,N);
s = ss + r;

SNR = 10 * log10(sum(ss.^2)/sum((ss-s).^2));

zs = hilbert(ss);
theta = diff(angle(zs));
theta1 = diff(atan2(imag(zs),real(zs)));


% clear fs ss r
% save signal_I