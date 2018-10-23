function state = basis(n,k)
%% this function represented the ground and excited state by columm vector;
% basis(0)=[1;0] ; basis(1)=[0;1]
if nargin==1

if n==0
    state = [1;0];
elseif n==1
    state = [0;1];
else
    fprintf('ERROR!')
end

elseif nargin>1

state = fock(n,k);

end