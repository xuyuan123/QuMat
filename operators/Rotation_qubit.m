function U = Rotation_qubit(theta,ChooseAxis)
%% return a 2X2 matrix represent rotate qubit along ChooseAxis axis by angle theta;
% parameter: ChooseAxis is a string of {'i','x', 'y','z'}
% for example: U = Rotation_qubit(pi/2,'x')

switch lower(ChooseAxis)
case 'i'
    U = expm(-1i*theta/2*qeye(2));
case 'x'
    U = expm(-1i*theta/2*sigmax());
case 'y'
    U = expm(-1i*theta/2*sigmay());
case 'z'
    U = expm(-1i*theta/2*sigmaz());
end
