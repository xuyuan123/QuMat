function [out] = plot_joinwignercut(psi,xvec1,yvec1,xvec2,yvec2)
%% plot the wigner of a cavity state
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
W = joinWigner(rho,xvec1,yvec1,xvec2,yvec2);

% figure();
if isscalar(xvec1) && isscalar(xvec2)
    a = surf(yvec1,yvec2,real(W),'LineStyle','none'); axis equal; 
xlim([yvec1(1),yvec1(end)]);ylim([yvec2(1),yvec2(end)]);
xlabel('Im(\beta_1)');ylabel('Im(\beta_2)');
elseif isscalar(xvec1) && isscalar(yvec2)
    a = surf(yvec1,xvec2,real(W),'LineStyle','none'); axis equal; 
xlim([yvec1(1),yvec1(end)]);ylim([xvec2(1),xvec2(end)]);
xlabel('Im(\beta_1)');ylabel('Re(\beta_2)');
elseif isscalar(yvec1) && isscalar(xvec2)
    a = surf(xvec1,yvec2,real(W),'LineStyle','none'); axis equal; 
xlim([xvec1(1),xvec1(end)]);ylim([yvec2(1),yvec2(end)]);
xlabel('Re(\beta_1)');ylabel('Im(\beta_2)');
elseif isscalar(yvec1) && isscalar(yvec2)
    a = surf(xvec1,xvec2,real(W),'LineStyle','none'); axis equal; 
xlim([xvec1(1),xvec1(end)]);ylim([xvec2(1),xvec2(end)]);
xlabel('Re(\beta_1)');ylabel('Re(\beta_2)');  
    
end
ax=gca;ax.CLim=[-1,1];ax.Layer = 'top';
colormap('redblue');
view(0,90);
colorbar;
title('ideal Cavity State join Parity cut')

if nargout>0
    out=a;
end
end