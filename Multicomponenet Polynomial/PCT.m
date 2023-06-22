function [ S_sct,Phi_R_IF,Phi_S_IF,STFT,m,estm_IF,y,stft ] = PCT( s,dt,sd,n,p,ww,l )

%   polynomial Chirplet Transform function 
%   written by mohammad bejvani (bejvanimohammad@ut.ac.ir)
%__________________________________________________________________________
N = length(s);
t = (0:N-1)*dt;
f = linspace(0,1/2/dt,N/2);
%__________________________________________________________________________
w = 1/(sqrt(2*pi)*sd) * exp(-1/2*(((0:N-1)-fix(N/2))/sd).^2);
W = conv2(w',eye(N));
W = W(fix(N/2):N+fix(N/2)-1,:);
%__________________________________________________________________________
z = hilbert(s);
Z = conv2(z.',ones(1,N));
%__________________________________________________________________________
STFT = Z .* W; STFT = fft(STFT);
stft = STFT;
[sr] = strip_region(N,p,ww,l);
STFT = sr .* STFT;
[o, m] = max(abs(STFT(1:fix(N/2),:)));
estm_IF = f(m);
%__________________________________________________________________________
p = polyfit(t,estm_IF,n);
y = polyval(p,t);
% p(end+1) = 0;
[Q_R,dR] = Phi_R( p,t,N );
[Q_S,dS] = Phi_S( p,t );
%__________________________________________________________________________
S_sct = Z .* Q_R .* Q_S .* W; S_sct = fft(S_sct);
Phi_R_IF = Q_R .* W;          Phi_R_IF = fft(Phi_R_IF);
Phi_S_IF = Q_S .* W;          Phi_S_IF = fft(Phi_S_IF);
end




