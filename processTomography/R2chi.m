function chi = R2chi(R)

N = size(R,1); nq = log2(N)/2;
rhod = rhoForProcesstomography(nq);
for k=1:4^nq
   
    Pin = DensityMatrix2PauliSet(rhod(:,:,k));
    Pout = R*Pin.';
    rhoOut(:,:,k) = PauliSet2DensityMatrix(Pout);
end

chi = cal_ChiMatrix(rhoOut);

end