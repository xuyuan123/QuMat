function U = cswap()
%% return a 8X8 matrix represent the three-qubit control-SWAP gate also called Fredkin gate;
U = [1,0,0,0,0,0,0,0;
    0,1,0,0,0,0,0,0;
    0,0,1,0,0,0,0,0;
    0,0,0,1,0,0,0,0;
    0,0,0,0,1,0,0,0;
    0,0,0,0,0,0,1,0;
    0,0,0,0,0,1,0,0;
    0,0,0,0,0,0,0,1];

end