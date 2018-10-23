function d = displace(N,alpha)
%% return a NXN matrix representing the displacement of a harmonic oscillator;
a = destroy(N);
d = expm(alpha*a'-alpha'*a);
end