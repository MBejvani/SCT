home,clear all,close all

fs = 100; dt = 1/fs;
t = 0:dt:15-dt;
N = length(t);
f = linspace(0,1/dt/2,N/2);

fi_I = 30*t+6*sin(pi*t/6);
fi_II = .35*t.^2+12.5*t+12.5/pi;
omega_I = 30+pi*cos(pi*t/6);
omega_II = .7*t+12.5;

ss = sin(2*pi*fi_I)+sin(2*pi*fi_II);
r = 0 + sqrt(2) * randn(1,N);
s = ss + r;

SNR = 10 * log10(sum(ss.^2)/sum((ss-s).^2));



clear fs ss r N t fi_I fi_II SNR f  
save signal_I