function [basisLabel, basisLabel2] = get_basisString(nq)
if nq==1
basisLabel = {'|g>','|e>'}; basisValueLabel={'0','1'};
elseif nq==2
basisLabel = {'|gg>','|ge>','|eg>','|ee>'}; basisValueLabel={'00','01','10','11'};
elseif nq==3
basisLabel = {'|ggg>','|gge>','|geg>','|gee>','|egg>','|ege>','|eeg>','|eee>'};
basisValueLabel={'000','001','010','011','100','101','110','111'};
end
if nargout>1
  basisLabel2 = basisValueLabel;
end
end