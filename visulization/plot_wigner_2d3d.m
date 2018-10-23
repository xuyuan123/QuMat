function [out] = plot_wigner_2d3d(psi,xvec,yvec)
%% plot the wigner of a cavity state both in 2D and 3D
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
W = wignerFunction(rho,xvec,yvec,2);

figure();hold on;
a = surf(xvec,yvec,2*pi/2*real(W),'edgecolor','none');
ax=gca;ax.CLim=[-1,1]; colormap(jet);
alpha(a,0.5)
imgzposition = -3; planeimg = abs(2*pi/2*real(W));
% minplaneimg = min(min(planeimg)); % find the minimum
% scaledimg = (floor(((planeimg - minplaneimg) ./ ...
%     (max(max(planeimg)) - minplaneimg)) * 255)); % perform scaling
% colorimg = ind2rgb(scaledimg,jet(256));
surf([xvec(1) xvec(end)],[yvec(1) yvec(end)],repmat(imgzposition, [2 2]),planeimg,'facecolor','texture')
view(45,20)

axis equal; colorbar;
xlim([xvec(1),xvec(end)]);ylim([yvec(1),yvec(end)]);
xlabel('Re(\beta)');ylabel('Im(\beta)');
title('Cavity State Wigner function')
if nargout>0
    out=a;
end
end