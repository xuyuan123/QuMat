function dm_MLE = MLErho(rhoMeas)


numberTruncation=size(rhoMeas,1);
tic;
cvx_begin
cvx_precision('high')
    variable rho(numberTruncation,numberTruncation) hermitian
    %variable rho(N,N) hermitian
    minimize( norm(rho - rhoMeas) )
    subject to
        rho == hermitian_semidefinite(numberTruncation);
        trace(rho) == 1;           
cvx_end
toc;

dm_MLE = rho;


end