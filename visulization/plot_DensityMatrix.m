function [out] = plot_DensityMatrix(psi)
%% bar plot the density matrix of state psi;
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
N = size(rho,1);
h=figure('Position',[500,500,600,300]);
subplot(1,2,1)
mybar3(real(rho)); 
if max(max(abs(real(rho))))>=0.5
caxis([-1,1]);zlim([-1,1]);
elseif max(max(abs(real(rho))))>=0.25
caxis([-0.5,0.5]);zlim([-0.5,0.5]);
else
caxis([-0.25,0.25]);zlim([-0.25,0.25]);
end
% axis equal
xlim([0.5,N+0.5]);ylim([0.5,N+0.5]); title('Ideal: Re(\rho)')

subplot(1,2,2)
mybar3(imag(rho)); 
if max(max(abs(real(rho))))>=0.5
caxis([-1,1]);zlim([-1,1]);
elseif max(max(abs(real(rho))))>=0.25
caxis([-0.5,0.5]);zlim([-0.5,0.5]);
else
caxis([-0.25,0.25]);zlim([-0.25,0.25]);
end
% axis equal
xlim([0.5,N+0.5]);ylim([0.5,N+0.5]); title('Ideal: Im(\rho)')

if nargout>0
    out=h;
end

end