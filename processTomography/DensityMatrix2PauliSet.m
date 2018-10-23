function PauliSetData = DensityMatrix2PauliSet(psi)
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
N = size(rho,1); nq = log2(N);

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

PauliSetData=zeros(1,4^nq);
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
    Pauli_operator = tensor_list(op); 
    PauliSetData(k) = real(trace(rho*Pauli_operator));
end

end