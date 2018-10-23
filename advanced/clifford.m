function CliffordGroup = clifford(nq)
%% generate single-qubit and two-qubit clifford group elements for random benchmarking;
% 'I' ==> qeye(2);     'X' ==> rx(pi);    'Y' ==> ry(pi)
% 'x' ==> rx(pi/2);    'y' ==> ry(pi/2);  'u' ==> rx(-pi/2);  'v' ==> ry(-pi/2);
% 'C' ==> cz();  

SingleQubit_clifford = {'I','X','Y','YX',...
                        'xy','xv','uy','uv','yx','yu','vx','vu',...
                        'x','u','y','v','uyx','uvx',...
                        'Xy','Xv','Yx','Yu','xyx','uyu'};
if nq==1
CliffordGroup = SingleQubit_clifford;
elseif nq==2
S1setgates = {'I','yx','uv'};
S1xsetgates = {'x','xyx','v'};
S1ysetgates = {'y','Yx','uvx'};
CliffordGroup = {};
k=0;
%% 1. single-qubit class ---> 576 elements
for m=1:24
    for n=1:24
        k=k+1;
        C1Q1 = SingleQubit_clifford{m};
        C1Q2 = SingleQubit_clifford{n};
        diff = length(SingleQubit_clifford{n})-length(SingleQubit_clifford{m});
        if diff>=0
        C1Q1 = [repelem('I',abs(diff)),SingleQubit_clifford{m}];
        else
        C1Q2 = [repelem('I',abs(diff)),SingleQubit_clifford{n}];
        end
        CliffordGroup{1,k} = C1Q1;
        CliffordGroup{2,k} = C1Q2;
    end
end
%% 2. CNOT-like class ---> 5184 elements
for m=1:24
    for n=1:24
        for p=1:3
            for q=1:3
                k=k+1;
                C1Q1 = SingleQubit_clifford{m};
                C1Q2 = SingleQubit_clifford{n};
                diff = length(SingleQubit_clifford{n})-length(SingleQubit_clifford{m});
                if diff>=0
                C1Q1 = [repelem('I',abs(diff)),SingleQubit_clifford{m}];
                else
                C1Q2 = [repelem('I',abs(diff)),SingleQubit_clifford{n}];
                end
                
                S1Q1 = S1setgates{p};
                S1Q2 = S1ysetgates{q};
                diff = length(S1ysetgates{q})-length(S1setgates{p});
                if diff>=0
                S1Q1 = [S1setgates{p},repelem('I',abs(diff))];
                else
                S1Q2 = [S1ysetgates{q},repelem('I',abs(diff))];
                end
                CliffordGroup{1,k} = [C1Q1,'c',S1Q1];
                CliffordGroup{2,k} = [C1Q2,'c',S1Q2];
            end
        end
    end
end
%% 3. iSWAP-like class ---> 5184 elements
for m=1:24
    for n=1:24
        for p=1:3
            for q=1:3
                k=k+1;
                C1Q1 = SingleQubit_clifford{m};
                C1Q2 = SingleQubit_clifford{n};
                diff = length(SingleQubit_clifford{n})-length(SingleQubit_clifford{m});
                if diff>=0
                C1Q1 = [repelem('I',abs(diff)),SingleQubit_clifford{m}];
                else
                C1Q2 = [repelem('I',abs(diff)),SingleQubit_clifford{n}];
                end
                
                S1Q1 = S1ysetgates{p};
                S1Q2 = S1xsetgates{q};
                diff = length(S1xsetgates{q})-length(S1ysetgates{p});
                if diff>=0
                S1Q1 = [S1ysetgates{p},repelem('I',abs(diff))];
                else
                S1Q2 = [S1xsetgates{q},repelem('I',abs(diff))];
                end
                
                CliffordGroup{1,k} = [C1Q1,'cyc',S1Q1];
                CliffordGroup{2,k} = [C1Q2,'cuc',S1Q2];
            end
        end
    end
end
%% 4. SWAP-like class ---> 576 elements
for m=1:24
    for n=1:24
        k=k+1;
        C1Q1 = SingleQubit_clifford{m};
        C1Q2 = SingleQubit_clifford{n};
        diff = length(SingleQubit_clifford{n})-length(SingleQubit_clifford{m});
        if diff>=0
        C1Q1 = [repelem('I',abs(diff)),SingleQubit_clifford{m}];
        else
        C1Q2 = [repelem('I',abs(diff)),SingleQubit_clifford{n}];
        end
        
        CliffordGroup{1,k} = [C1Q1,'cvcycI'];
        CliffordGroup{2,k} = [C1Q2,'cycvcy'];
    end
end

end

end

