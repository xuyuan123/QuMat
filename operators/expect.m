function a = expect(operator,psi)
%% return the expectation of the operator in state psi;
% input parameter can be a state columm vector of density matrix;
% for example: a = expect(sigmax(), unit(basis(0)+basis(1)) );
if isa(psi,'cell')
    for k=1:length(psi)
        if size(psi{k},1)==size(psi{k},2)
            rho=psi{k};
        else
            rho=state2dm(psi{k});
        end
        a(k,1) = real(trace(rho*operator));
    end
elseif isa(psi,'numeric')
    if size(psi,1)==size(psi,2)
        rho=psi;
    else
        rho=psi*psi';
    end
    a = real(trace(rho*operator));


end

end