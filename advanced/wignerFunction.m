function wmat = wignerFunction(psi,xvec,yvec,g)
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
N = length(rho);
[xx,yy] = meshgrid(xvec,yvec);
amat = 0.5*g*(xx + 1i*yy);
Wlist = zeros(size(amat,1),size(amat,2),N);
wmat = zeros([size(amat)]);
%
Wlist(:,:,1) = exp(-2*abs(amat).^2)/pi;
for n = 1:N-1
   Wlist(:,:,n+1) = (2*amat.*Wlist(:,:,n))./sqrt(n);
end
wmat(:,:) = rho(1,1)*real(Wlist(:,:,1));
   for n = 2:N
      wmat(:,:) = wmat(:,:)+2*real(rho(1,n)*Wlist(:,:,n));
   end      


for m = 1:N-1
   temp = Wlist(:,:,m+1);
   Wlist(:,:,m+1) = (2*conj(amat).*temp-sqrt(m)*Wlist(:,:,m))/sqrt(m);
   for n = m+1:N-1
      temp2 = (2*amat.*Wlist(:,:,n)-sqrt(m)*temp)./sqrt(n);
      temp  = Wlist(:,:,n+1);
      Wlist(:,:,n+1) = temp2;
   end
      wmat(:,:) = wmat(:,:)+rho(m+1,m+1)*real(Wlist(:,:,m+1));
      for n = m+2:N
         wmat(:,:) = wmat(:,:)+2*real(rho(m+1,n)*Wlist(:,:,n));
      end      
end
wmat = 0.5 * wmat * g^2;
end