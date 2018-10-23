function a = destroy(N)
%% return a spare NXN matrix represent the anihilation operator of a harmonic oscillator
a = spdiags(sqrt(0:N-1)',1,N,N);

end