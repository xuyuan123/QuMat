function U = phasegate(theta)
%% return a 2X2 matrix represent phase gate;
U = [1, 0;
     0, exp(1i*theta)];
end