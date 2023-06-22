clc ,clear all,close all ;tic
load signal_I
%__________________________________________________________________________
sd = 40;
n = 3;
%__________________________________________________________________________
[ S_sct,Phi_R_IF,Phi_S_IF,STFT,m,estm_IF,y ] = PCT( s,dt,sd,n );
%__________________________________________________________________________
figure(1)
subplot 231,imagesc(flipdim(abs(S_sct(1:round(N/2),:)),1)),title('SCT'),axis square off
subplot 232,imagesc(abs(Phi_R_IF(round(N/2)+1:end,:))),title('IF of \Phi^R'),axis square off
subplot 233,imagesc(flipdim(abs(Phi_S_IF(1:round(N/2),:)),1)),title('IF of \Phi^S'),axis square off
subplot 234,imagesc(flipdim(abs(STFT(1:round(N/2),:)),1)),title('STFT'),axis square off
subplot 235,imagesc(flipdim(abs(STFT(1:round(N/2),:)),1)),hold on,plot(round(N/2)-m,'k'),hold off,title('STFT & IF trajectory'),axis square off
subplot 236,plot(estm_IF,'r'),hold on,plot(y,'k'),hold off,title('IF trajectory'),axis square  
set(gca,'Ytick',[]),set(gca,'Xtick',[])
%__________________________________________________________________________
toc



