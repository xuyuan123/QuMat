function U = ry(theta)
%% return a 2X2 matrix represent rotate qubit along y axis by angle theta;

U = expm(-1i*theta/2*sigmay());


end