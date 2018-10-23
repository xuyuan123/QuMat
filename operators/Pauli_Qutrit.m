function Operator = Pauli_Qutrit(ChooseAxis,ChooseGEF)
%% return a 3X3 matrix represent Pauli operator along ChooseAxis axis of ChooseGEF state of a qutrit;
lambda0= qeye(3); lambda3= [1,0,0;0,-1,0;0,0,0]; lambda8= 1/sqrt(3)*(lambda3+2*[0,0,0;0,1,0;0,0,-1]);
sigmaz_ef = [0,0,0;0,1,0;0,0,-1]; sigmaz_gf = [1,0,0;0,0,0;0,0,-1];
lambda1=[0,1,0;1,0,0;0,0,0]; lambda4=[0,0,1;0,0,0;1,0,0]; lambda6=[0,0,0;0,0,1;0,1,0];
lambda2=[0,-1i,0;1i,0,0;0,0,0]; lambda5=[0,0,-1i;0,0,0;1i,0,0]; lambda7=[0,0,0;0,0,-1i;0,1i,0];

switch lower(ChooseGEF)
    case 'ge'
    switch lower(ChooseAxis)
        case 'i'
            U = [1,0,0;0,1,0;0,0,0];
        case 'x'
            U = lambda1;
        case 'y'
            U = lambda2;
        case 'z'
            U = lambda3;
    end
    case 'ef'
    switch lower(ChooseAxis)
        case 'i'
            U = [0,0,0;0,1,0;0,0,1];
        case 'x'
            U = lambda6;
        case 'y'
            U = lambda7;
        case 'z'
            U = sigmaz_ef;
    end
    case 'gf'
    switch lower(ChooseAxis)
        case 'i'
            U = [1,0,0;0,0,0;0,0,1];
        case 'x'
            U = lambda4;
        case 'y'
            U = lambda5;
        case 'z'
            U = sigmaz_gf;
    end


end
Operator = U;
end