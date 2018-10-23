function x = persub(p, perm, dims)
%% Permutes the order of subsystems in tensor product space
% for example: p = tensor(sigmax(),sigmay(),sigmaz(),create(N)) is a tensor product system;
% x = persub(p,[1,4,2,3],[2,2,2,N]) 
% returns x=tensor(sigmax(),create(N),sigmay(),sigmaz());

% check arguments
n = length(dims);
d = size(p);

% check for input errors
if length(perm) ~= n
  error('Number of subsystems in perm and dims should be equal');
end
if sort(perm) ~= 1:n
  error('perm is not a valid permutation, it should contain all numbers between 1 and %d inclusive', n);
end
if length(p) ~= prod(dims)
  error('Total dimension in dim does not match state p; one should have prod(dim)=length(p)')
end

if length(dims) <= 1
	x = p;
elseif min(d) == 1
	% we have a state vector
	perm = n+1-perm([end:-1:1]);
	x=reshape(p,dims(end:-1:1));
	x=permute(x,perm);
	x = reshape(x,d);
elseif d(1) == d(2)
	% density matrix
	perm = n+1-perm([end:-1:1]);
	perm = [perm,n+perm];
	x = reshape(permute(reshape(p,[dims(end:-1:1),dims(end:-1:1)]),perm),d);
else
	error('The input matrix should be a 1D matrix, or a square matrix');
end