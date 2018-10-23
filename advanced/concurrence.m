function c = concurrence( psi )
%% calculate the concurrence of a two-qubit density matrix rho
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end

sysy = tensor(sigmay(),sigmay());
rho_tilde = (rho*sysy)*(conj(rho)*sysy);

evals = real(eigs(rho_tilde,4));
evals = abs(sort(evals,'descend'));
sum = sqrt(evals(1) - evals(2) - evals(3) - evals(4));
c = max(0,sum);

