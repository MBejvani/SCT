home ,clear all,close all ;tic
s = MakeChirps('Chirps',100);
dt = 0.001;
%__________________________________________________________________________
N = length(s);
sd = 10;
% sr = [7 50 50 0];      % [n p w l]
sr = [2 10 13 .3;2 40 20 -.5]; 
MC = zeros(N);
for c = 1:2
p = sr(c,2);
ww = sr(c,3);
l = sr(c,4);
n = sr(c,1);
[ S_sct,Phi_R_IF,Phi_S_IF,STFT,m,estm_IF,y,stft ] = PCT( s,dt,sd,n,p,ww,l );
HPS_sct = high_pass(abs(S_sct),5);
%__________________________________________________________________________
tr = HPS_sct>.1;
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
subplot 242,plot(estm_IF,'r'),hold on,plot(y,'k'),hold off,title('IF trajectory'),axis square  
subplot 248,imagesc(flipdim(abs(MC(1:round(N/2),:)),1)),title('sct (high pass)'),axis square off
set(gca,'Ytick',[]),set(gca,'Xtick',[])
%__________________________________________________________________________
toc


