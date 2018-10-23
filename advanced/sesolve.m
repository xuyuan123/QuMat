function results = sesolve(H, tH_list, tlist, psi0, eop_list)
%% sove the Schorgdinger equation without dispersition terms;
% H: Hamiltonian;
% tlist: time;
% psi0: initial state;
% op_list: operator list to calculate its expectation at each points;
if isempty(tH_list)
if size(psi0,1)==size(psi0,2)
% psi0 is a density matrix
k=0;
for t=tlist
    k=k+1;
    U = expm(-1i*H*t);
    psi = U*psi0*U';
    results.state{k} = psi;
    if ~isempty(eop_list)
    for j=1:length(eop_list)
    results.expect(k,j) = expect(eop_list{j}, psi);
    end
    end
end

else
% psi0 is a column vector
k=0;
for t=tlist
    k=k+1;
    U = expm(-1i*H*t);
    psi = U*psi0;
    results.state{k} = psi;
    if ~isempty(eop_list)
    for j=1:length(eop_list)
    results.expect(k,j) = expect(eop_list{j}, psi);
    end
    end
end
results.tlist = tlist';
end

else
    if size(psi0,1)==size(psi0,2)
       % density matrix;
       rhov0 = matrix2vec(psi0);

    myodefun = @(t,y) odefun(t,y,H,tH_list);
    options = odeset('RelTol',1e-6,'AbsTol',1e-8);
    [time,rhov] = ode45(myodefun, tlist, rhov0, options);

    for m=1:size(rhov,1)
        rho = (vec2matrix(rhov(m,:)));
        results.state{m}=rho;
        if ~isempty(eop_list)
            for j=1:length(eop_list)
                results.expect(m,j) = expect(eop_list{j}, rho);
            end
        end

    end
    results.tlist = time;
       
    else
       % vector state;
       myodefun = @(t,y) -1i*get_tH2(t,H, tH_list)*y;
       options = odeset('RelTol',1e-6,'AbsTol',1e-8);
       [time,psi] = ode45(myodefun, tlist, psi0, options);
       
    for m=1:size(psi,1)
        results.state{m}=psi(m,:).';
        if ~isempty(eop_list)
            for j=1:length(eop_list)
                results.expect(m,j) = expect(eop_list{j}, results.state{m});
            end
        end

    end
    results.tlist = time;
       
    end
    
    
    
end

    function dydt = odefun(t,y,H,tH_list)
        L = -1i*(spre(H)-spost(H));
        if ~isempty(tH_list) 
        L = get_tH(t,L, tH_list);
        end
        dydt = L*y(:);
    end

    function L = get_tH(t,L, tH_list)
        for kk=1:size(tH_list,2)
            coefFun = tH_list{1,kk};
            tH = tH_list{2,kk};
            L = L -1i*coefFun(t)*(spre(tH) - spost(tH));
        end
    end
    function H = get_tH2(t,H, tH_list)
        for kk=1:size(tH_list,2)
            coefFun = tH_list{1,kk};
            tH = tH_list{2,kk};
            H = H + coefFun(t)*tH;
        end
    end
end


