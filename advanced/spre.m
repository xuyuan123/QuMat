function S = spre(A)

N = size(A,1);
S = tensor(qeye(N),A);


end