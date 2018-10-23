function out = parity(N)
%% return a spare NXN matrix represent the parity operator of a harmonic oscillator
a=destroy(N);
out = expm(1i*pi*(a'*a));
end