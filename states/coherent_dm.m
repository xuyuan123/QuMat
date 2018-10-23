function rho = coherent_dm(N,alpha)
%% return the density matrix of a coherent state;
rho = coherent(N,alpha)*coherent(N,alpha)';
end