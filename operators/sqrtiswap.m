function U = sqrtiswap()
%% return a 4X4 matrix represent the two qubit square root iSWAP gate;
U = [1,0,0,0;
    0,1/sqrt(2),1i/sqrt(2),0;
    0,1i/sqrt(2),1/sqrt(2),0;
    0,0,0,1];

end