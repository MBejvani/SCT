home,clear all,close all

fs = 100; dt = 1/fs;
t = 0:dt:15-dt;
N = length(t);
f = linspace(0,1/dt/2,N/2);

fi_I = 5/4*t.^2;
fi_II = 5*sin(pi*t/4+pi)+20*t-0.4*t.^2;
omega_I = 5/2*t;
omega_II = 5/4*pi*cos(pi*t/4+pi)+20-0.8*t;

ss = sin(2*pi*fi_I)+sin(2*pi*fi_II);
r = 0 + sqrt(2) * randn(1,N);
s = ss ;

SNR = 10 * log10(sum(ss.^2)/sum((ss-s).^2));



clear fs ss r N t fi_I fi_II SNR f  
save signal_II