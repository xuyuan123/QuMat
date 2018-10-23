function rhoOut = chiProcess(chi,rhoIn)
if size(rhoIn,1) ~= size(rhoIn,2)
    rhoIn = rhoIn*rhoIn';
end
N = size(rhoIn,1); nq = log2(N);
Ed = pauliForProcessTomography(nq);
rhoOut = 0;
for i=1:4^nq
    for j=1:4^nq
        rhoOut = rhoOut + chi(i,j)*Ed(:,:,i)*rhoIn*Ed(:,:,j)';
    end
end

end