function [ S_sct,Phi_R_IF,Phi_S_IF,STFT,stft,m,estm_IF,smooth_s ] = PCT( s,dt,sd,landa,delta,coff,p,ww,l )

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
D = diff(estm_IF);
sub = find(abs(D)>delta);
sub(length(sub)+1) = N;
%__________________________________________________________________________
if sub > 0
    b = 1;
    for u = 1:length(sub)
        if abs(sub(u)-b) >= 3 || u == length(sub)
        scs = csaps((b-1:sub(u)-1)*dt,estm_IF(b:sub(u)),landa);
        Q_R(b:sub(u),:) = Phi_R( scs,dt,N,coff  ); % [ ; ]
        Q_S(:,b:sub(u)) = Phi_S( scs,t,coff  ); % [ , ]  
        smooth_s(b:sub(u)) = ppval(scs,scs.breaks);
        b = sub(u)+1;
        else
        continue
        end
    end
else
    scs = csaps((0:N-1)*dt,estm_IF,landa);
    Q_R = Phi_R( scs,dt,N,coff  );
    Q_S = Phi_S( scs,t,coff  );
    smooth_s = ppval(scs,scs.breaks);
end
%__________________________________________________________________________
S_sct = Z .* Q_R .* Q_S .* W; S_sct = fft(S_sct);
Phi_R_IF = Q_R .* W;          Phi_R_IF = fft(Phi_R_IF);
Phi_S_IF = Q_S .* W;          Phi_S_IF = fft(Phi_S_IF);
end




