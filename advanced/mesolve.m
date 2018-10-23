function results = mesolve(H, tH_list, tlist, psi0, cops, eop_list)
%% sove the Schorgdinger equation without dispersition terms;
% H: Hamiltonian;
% tH_list: time dependent coeffcient function and Hamiltonian
% tlist: time;
% psi0: initial state;
% cops: collapse operators list
% op_list: operator list to calculate its expectation at each points;
if isempty(cops)
    results = sesolve(H, tH_list, tlist, psi0, eop_list);
else

if size(psi0,1)==size(psi0,2)
    rho0 = psi0;
else
    rho0 = state2dm(psi0);
end

rhov0 = matrix2vec(rho0);

myodefun = @(t,y) odefun(t,y,H,tH_list,cops);
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
end

    function dydt = odefun(t,y,H,tH_list,cops)
        L = -1i*(spre(H)-spost(H));
        if ~isempty(tH_list) 
        L = get_tH(t,L, tH_list);
        end
        L = get_dissipator(L,cops);
        dydt = L*y(:);
    end

    function L = get_tH(t,L, tH_list)
        for kk=1:size(tH_list,2)
            coefFun = tH_list{1,kk};
            tH = tH_list{2,kk};
            L = L -1i*coefFun(t)*(spre(tH) - spost(tH));
        end
    end

    function L = get_dissipator(L,cops)
        for k=1:size(cops,2)
            cop = cops{k};
            L = L+1/2*(2*spre(cop)*spost(cop') - spre(cop'*cop) - spost(cop'*cop));
        end
    end


end


