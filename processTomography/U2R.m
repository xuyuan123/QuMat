function R = U2R(U)
% transform the gate operation U to Pauli transfer matrix R
N = size(U,1); nq = log2(N);

R = zeros(4^nq,4^nq);
if nq==1
PauliSet = {'I','X','Y','Z'};
elseif nq==2
PauliSet = {'II','IX','IY','IZ','XI','YI','ZI','XX','XY','XZ','YX','YY','YZ','ZX','ZY','ZZ'};
elseif nq==3
PauliSet = {'III','IIX','IIY','IIZ','IXI','IYI','IZI','XII','YII','ZII',...
            'IXX','IYX','IZX','IXY','IYY','IZY','IXZ','IYZ','IZZ',...
            'XIX','YIX','ZIX','XIY','YIY','ZIY','XIZ','YIZ','ZIZ',...
            'XXI','YXI','ZXI','XYI','YYI','ZYI','XZI','YZI','ZZI',...
            'XXX','YXX','ZXX','XYX','YYX','ZYX','XZX','YZX','ZZX',...
            'XXY','YXY','ZXY','XYY','YYY','ZYY','XZY','YZY','ZZY',...
            'XXZ','YXZ','ZXZ','XYZ','YYZ','ZYZ','XZZ','YZZ','ZZZ'};
end

for k=1:length(PauliSet)
    op_string = PauliSet{k};
    for kk=1:length(op_string)
    if strcmp(op_string(kk),'I')
        op{kk}=qeye(2);
    elseif strcmp(op_string(kk),'X')
        op{kk}=sigmax();
    elseif strcmp(op_string(kk),'Y')
        op{kk}=sigmay();
    elseif strcmp(op_string(kk),'Z')
        op{kk}=sigmaz();
    end
    end
    Pauli_operator{k} = tensor_list(op); 
end

for i=1:4^nq
    for j=1:4^nq
        R(i,j) = real(trace(Pauli_operator{j}*U*Pauli_operator{i}*U'))/(2^nq);
    end
end
R = R';
end