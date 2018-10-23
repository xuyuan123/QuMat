function rho = fock_dm(N,n)
%% return the denxity matrix of the fock state;
rho = fock(N,n)*fock(N,n)';
end