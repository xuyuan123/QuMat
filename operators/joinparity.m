function out = joinparity(N)
%% return a spare (N^2)X(N^2) matrix represent the joined parity operator of a harmonic oscillator
a=tensor(destroy(N),qeye(N)); b=tensor(qeye(N),destroy(N));
out = expm(1i*pi*((a'*a)+(b'*b)));
end