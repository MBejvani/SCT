
N = length(s);
t = (0:N-1)*dt;
f = linspace(0,1/2/dt,N/2);
%__________________________________________________________________________
sd = (1/(4*sqrt(2))) * L;
w = 1/(sqrt(2*pi)*sd) * exp(-1/2*(((0:N-1)-fix(N/2))/sd).^2);
W = conv2(w',eye(N));
W = W(fix(N/2):N+fix(N/2)-1,:);
%__________________________________________________________________________
z = hilbert(s);
Z = conv2(z.',ones(1,N));
%__________________________________________________________________________
STFT = Z .* W; STFT = fft(STFT);

[l m] = max(abs(STFT(1:fix(N/2),:)));

run SCT