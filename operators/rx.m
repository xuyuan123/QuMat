function U = rx(theta)
%% return a 2X2 matrix represent rotate qubit along x axis by angle theta;

U = expm(-1i*theta/2*sigmax());


end