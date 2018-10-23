function basis = fock(N,n)
%% return a columm vector represent the fock state;
basis = sparse(zeros(N,1));
basis(n+1) = 1;
end