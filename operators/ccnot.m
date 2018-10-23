function U = ccnot()
%% return a 8X8 matrix represent the three-qubit control-control-NOT gate also called Toffoli gate;
U = [1,0,0,0,0,0,0,0;
    0,1,0,0,0,0,0,0;
    0,0,1,0,0,0,0,0;
    0,0,0,1,0,0,0,0;
    0,0,0,0,1,0,0,0;
    0,0,0,0,0,1,0,0;
    0,0,0,0,0,0,0,1;
    0,0,0,0,0,0,1,0];

end