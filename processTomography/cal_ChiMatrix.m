function chiMatrix = cal_ChiMatrix(exprhodr)
% exprhodr is a 2^nq*2^nq*4^nq matrix corresponding to 4^nq output density matrix;
N = size(exprhodr,1); nq=log2(N);

exprhodr=reshape(exprhodr,4^nq,4^nq);
rhod = rhoForProcesstomography(nq);
Ed = pauliForProcessTomography(nq);

rhodr=reshape(rhod,4^nq,4^nq);
lambdajk=rhodr\exprhodr;

Erho=zeros(N,N,4^nq);
beta=zeros(4^nq,4^nq,4^nq,4^nq);
for m=1:4^nq
    for n=1:4^nq
        for j=1:4^nq
            Erho(:,:,j)=Ed(:,:,m)*rhod(:,:,j)*Ed(:,:,n)';
        end
        Erhor=reshape(Erho,4^nq,4^nq);
        beta(:,:,m,n)=rhodr\Erhor;
    end
end
betar=reshape(beta,(4^nq)^2,(4^nq)^2);
lambdajkr=reshape(lambdajk,(4^nq)^2,1);
chi=betar\lambdajkr;
chiMatrix=reshape(chi,4^nq,4^nq);