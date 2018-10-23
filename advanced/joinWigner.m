function W = joinWigner(psi,xvec1,yvec1,xvec2,yvec2)
%% calculate the join wigner of a two-cavity system state;
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
N = sqrt(size(rho,1));
a = tensor(destroy(N),qeye(N)); b=tensor(qeye(N),destroy(N));
Parity = expm(1i*pi*((a'*a)+(b'*b)));

W = zeros(length(xvec1),length(yvec1),length(xvec2),length(yvec2));
n=0;
for belta2Imag = yvec2
    n=n+1;m=0;
for belta2Real = xvec2
    m=m+1;j=0;
    for belta1Imag = yvec1
        j=j+1;i=0;
    for belta1Real = xvec1
        i=i+1;
        beta1 = (belta1Real+1i*belta1Imag); beta2 = (belta2Real+1i*belta2Imag); 
        D1 = tensor(displace(N,beta1),qeye(N)); D2 = tensor(qeye(N),displace(N,beta2));
        W(i,j,m,n) = trace(rho*D1*D2*Parity*D2'*D1');
    end
    end
end
end
W = (squeeze(real(W)));
if ismatrix(W)
    if ~isvector(W)
    W=W';
    end
end

end