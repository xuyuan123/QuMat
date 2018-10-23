function S = spost(A)

N = size(A,1);
S = tensor(A.',qeye(N));


end