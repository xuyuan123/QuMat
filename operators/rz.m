function U = rz(theta)
%% return a 2X2 matrix represent rotate qubit along z axis by angle theta;

U = expm(-1i*theta/2*sigmaz());


end