function state = coherent(N,alpha)
%% return a columm vector represent the coherent state
state = 0*fock(N,0);
for n=1:N
    state = state + alpha^(n-1)/sqrt(factorial(n-1))*fock(N,n-1);
end
state = state*exp(-abs(alpha)^2/2);
end