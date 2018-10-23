function [out] = plot_Qfunc(psi,xvec,yvec)
%% plot the wigner of a cavity state
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
Q = QFunction(rho,xvec,yvec);

% figure;
% a = imagesc(xvec,yvec,2*pi/2*real(W));
% % shading interp
% colorbar;axis xy;
% grid on;
% ax=gca;ax.CLim=[-1,1];
% xlim([xvec(1),xvec(end)]);ylim([yvec(1),yvec(end)]);
% load('MyColormaps','mycmap'); colormap(ax,mycmap)
% title('Cavity State Wigner function')
% axis equal

% figure();
a = surf(xvec,yvec, pi*real(Q),'LineStyle','none');
ax=gca;ax.CLim=[-1,1];ax.Layer = 'top';
% load('MyColormaps','mycmap'); colormap(ax,mycmap)
colormap('redblue');
view(0,90);
axis equal; colorbar;
xlim([xvec(1),xvec(end)]);ylim([yvec(1),yvec(end)]);
xlabel('Re(\beta)');ylabel('Im(\beta)');
title('Cavity State Q function')

if nargout>0
    out=a;
end
end