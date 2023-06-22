clc ,clear all,close all ;tic
load sig_I
%__________________________________________________________________________
N = length(s);
L = 300;
delta = 15;
landa = .85;
iter = 3;
coff = 2*pi;
%__________________________________________________________________________
run picking
for i = 1:iter
[l, m] = max(abs(S_sct(1:fix(N/2),:)));
run SCT
end
%__________________________________________________________________________
figure(1)
subplot 231,imagesc(flipdim(abs(S_sct(1:round(N/2),:)),1)),title('SCT'),axis square off
subplot 232,imagesc(flipdim(abs(Phi_R_IF(round(N/2)+1:end,:)),1)),title('IF of \Phi^R'),axis square off
subplot 233,imagesc(flipdim(abs(Phi_S_IF(1:round(N/2),:)),1)),title('IF of \Phi^S'),axis square off
subplot 234,imagesc(flipdim(abs(STFT(1:round(N/2),:)),1)),title('STFT'),axis square off
subplot 235,imagesc(flipdim(abs(STFT(1:round(N/2),:)),1)),hold on,plot(round(N/2)-m,'k'),hold off,title('STFT & IF'),axis square off
subplot 236,plot(estm_IF,'r'),hold on,plot(smooth_s,'k'),plot(omega,'b'),hold off,title('IF trajectory'),axis square  
set(gca,'Ytick',[]),set(gca,'Xtick',[])
%__________________________________________________________________________
toc



