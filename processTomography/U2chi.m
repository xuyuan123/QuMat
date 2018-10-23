function chiideal = U2chi(U)
% transform the gate operation U to process chi matrix
N = size(U,1);
nq = log2(N);
rhod = rhoForProcesstomography(nq);
Idealrhod=zeros(N,N,4^nq);
for i=1:4^nq
    Idealrhod(:,:,i)=U*rhod(:,:,i)*U';
end
chiideal = cal_ChiMatrix(Idealrhod);

end