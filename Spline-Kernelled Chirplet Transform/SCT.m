
estm_IF = f(m);
D = diff(estm_IF);
sub = find(abs(D)>delta);
sub(length(sub)+1) = N;

if sub > 0
    b = 1;
    for u = 1:length(sub)
        scs = csaps((b-1:sub(u)-1)*dt,estm_IF(b:sub(u)),landa);
        Q_R(b:sub(u),:) = Phi_R( scs,dt,N,coff  ); % [ ; ]
        Q_S(:,b:sub(u)) = Phi_S( scs,t,coff  ); % [ , ]  
        smooth_s(b:sub(u)) = ppval(scs,scs.breaks);
        b = sub(u)+1;
    end
else
    scs = csaps((0:N-1)*dt,estm_IF,landa);
    Q_R = Phi_R( scs,dt,N,coff  );
    Q_S = Phi_S( scs,t,coff  );
    smooth_s = ppval(scs,scs.breaks);
end

S_sct = Z .* Q_R .* Q_S .* W; S_sct = fft(S_sct);

Phi_R_IF = Q_R .* W;          Phi_R_IF = fft(Phi_R_IF);
Phi_S_IF = Q_S .* W;          Phi_S_IF = fft(Phi_S_IF);


