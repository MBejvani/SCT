home ,clear all,close all ;tic
s = MakeChirps('Chirps',300);
dt = 0.004;
%__________________________________________________________________________
N = length(s);
sd = 10;
sr = [2 10 .3;110 20 -.4];      % [n p w l]
delta = 20;
landa = .7;
coff = 2*pi;
MC = zeros(N);
for c = 1:2
    p = sr(c,1);
    ww = sr(c,2);
    l = sr(c,3);
[ S_sct,Phi_R_IF,Phi_S_IF,STFT,stft,m,estm_IF,smooth_s ] = PCT( s,dt,sd,landa,delta,coff,p,ww,l );
%__________________________________________________________________________
HPS_sct = high_pass(abs(S_sct),20);
tr = HPS_sct>.05;
HPS_sctf = HPS_sct .* tr;
MC = MC+HPS_sctf;
end
%__________________________________________________________________________
figure(1)
subplot 246,imagesc(flipdim(abs(HPS_sct(1:round(N/2),:)),1)),title('HPS_sct'),axis square off
subplot 245,imagesc(flipdim(abs(S_sct(1:round(N/2),:)),1)),title('SCT'),axis square off
subplot 243,imagesc(abs(Phi_R_IF(round(N/2)+1:end,:))),title('IF of \Phi^R'),axis square off
subplot 244,imagesc(flipdim(abs(Phi_S_IF(1:round(N/2),:)),1)),title('IF of \Phi^S'),axis square off
subplot 247,imagesc(flipdim(abs(stft(1:round(N/2),:)),1)),title('sct (high pass)'),axis square off
subplot 241,imagesc(flipdim(abs(STFT(1:round(N/2),:)),1)),hold on,plot(round(N/2)-m,'k'),hold off,title('STFT & IFtrajectory (in strip region)'),axis square off
subplot 242,plot(estm_IF,'r'),hold on,plot(smooth_s,'k'),hold off,title('IF trajectory'),axis square  
subplot 248,imagesc(flipdim(abs(MC(1:round(N/2),:)),1)),title('sct (high pass)'),axis square off
set(gca,'Ytick',[]),set(gca,'Xtick',[])
%__________________________________________________________________________
toc


