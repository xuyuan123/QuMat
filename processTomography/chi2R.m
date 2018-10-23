function R = chi2R(chi)

N = size(chi,1); nq = log2(N)/2;
rhod = rhoForProcesstomography(nq);
for k=1:4^nq
   
    rhoOut = chiProcess(chi,rhod(:,:,k));
    Pout(k,:) = DensityMatrix2PauliSet(rhoOut);
end

R = cal_transferRmatrix(Pout);

end