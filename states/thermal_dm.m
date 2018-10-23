function rho = thermal_dm(N,n)
%% return the density matrix of a thermal state;
k=0:N-1;
rho = diag((1+n)^(-1)*(n/(1+n)).^k);
end