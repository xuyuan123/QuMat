function state = basis_dm(n,k)
%% this function represented the density matrix of the ground state and excited state of a two-level system;

if nargin==1

if n==0
    state = [1,0;0,0];
elseif n==1
    state = [0,0;0,1];
else
    fprintf('ERROR!')
end

elseif nargin>1

state = fock_dm(n,k);

end