function U = Rotation_qutrit(theta,ChooseGEF,ChooseAxis)
%% return a 3X3 matrix represent rotate qutrit along ChooseAxis axis by angle theta of ChooseGEF state;
% parameter: ChooseAxis is a string of {'i','x', 'y','z'}
% parameter: ChooseGEF is a string of {'GE','EF', 'GF'}
% for example: U = Rotation_qutrit(pi/2,'GE','x')

Operator = Pauli_Qutrit(ChooseAxis,ChooseGEF);
U = expm(-1i*theta/2*Operator);

end