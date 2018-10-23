function qmat = QFunction(psi,xvec,yvec,g)
%% calculate the wigner function of a cavity state;
% for example: wmat = wignerFunction(coherent(N,alpha),-4:0.1:4,-3:0.1:3);
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
if nargin<=3
    g=2;
end

[xx,yy] = meshgrid(xvec,yvec);
amat = 0.5*g*(xx + 1i*yy);
qmat = zeros( size(amat) );

[v,d] = eig(full(rho));  d = diag(d);
qmat(:,:) = 0;
for k = 1:length(d)
    qmat(:,:) = qmat(:,:) + real(d(k)*qfunc1(v(:,k),amat));
end

qmat = 0.25 * qmat * g^2;

   function qmat1=qfunc1(psi,amat)
        psi = psi(:).';
        index = 1:length(psi);
        qmat1 = abs(polyval(fliplr(psi(index)./sqrt([1,cumprod(1:length(psi)-1)])),conj(amat))).^2/pi;
        qmat1 = real(qmat1.*exp(-abs(amat).^2));
   end

end
