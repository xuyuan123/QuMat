function [out] = plot_fock_distribution(psi)
%% plot the fock state distribution of a cavity state psi;
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end

N = size(rho,1);
h = bar(0:N-1,real(diag(rho)),0.8,'r');
xlim([-0.5,N]); ylim([0,1])

if nargout>0
    out=h;
end

end