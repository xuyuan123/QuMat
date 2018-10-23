function U = sqrtswap()
%% return a 4X4 matrix represent the two qubit square root SWAP gate;
U = [1,0,0,0;
    0,(1+1i)/2,(1-1i)/2,0;
    0,(1-1i)/2,(1+1i)/2,0;
    0,0,0,1];

end