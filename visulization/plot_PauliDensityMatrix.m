function plot_PauliDensityMatrix(psi)
%% bar plot both the Pauli set expectations and the density matrix of state psi;
if size(psi,1)==size(psi,2)
    rho=psi;
else
    rho=psi*psi';
end
N = size(rho,1); nq=log2(N);
figure('Position',[100 200 1800 700])
if nq==1
PauliMeas = DensityMatrix2PauliSet(rho);
PauliSet = {'I','X','Y','Z'};
elseif nq==2
PauliMeas = DensityMatrix2PauliSet(rho);
PauliSet = {'II','IX','IY','IZ','XI','YI','ZI','XX','XY','XZ','YX','YY','YZ','ZX','ZY','ZZ'};
elseif nq==3
PauliMeas = DensityMatrix2PauliSet(rho);
PauliSet = {'III','IIX','IIY','IIZ','IXI','IYI','IZI','XII','YII','ZII',...
            'IXX','IYX','IZX','IXY','IYY','IZY','IXZ','IYZ','IZZ',...
            'XIX','YIX','ZIX','XIY','YIY','ZIY','XIZ','YIZ','ZIZ',...
            'XXI','YXI','ZXI','XYI','YYI','ZYI','XZI','YZI','ZZI',...
            'XXX','YXX','ZXX','XYX','YYX','ZYX','XZX','YZX','ZZX',...
            'XXY','YXY','ZXY','XYY','YYY','ZYY','XZY','YZY','ZZY',...
            'XXZ','YXZ','ZXZ','XYZ','YYZ','ZYZ','XZZ','YZZ','ZZZ'};
end
subplot(2,4,[1,2,3,4])
bar(1:4^nq,PauliMeas)
set(gca,'box','off');
currentax=gca; currentax.YTick = -1.0:0.5:1.0;
ylim([-1.2 1.2]);  grid on; 
xlim([0 4^nq+1]);
set(gca,'XTick',1:1:4^nq);
set(gca,'XTickLabel',PauliSet);set(gca,'XTickLabelRotation',45);

subplot(2,4,[5,6])
mybar3(real(rho)); caxis([-1,1]);axis equal
xlim([0.5,N+0.5]);ylim([0.5,N+0.5]);zlim([-1,1]); title('Ideal: Re(\rho)')
subplot(2,4,[7,8])
mybar3(imag(rho)); caxis([-1,1]);axis equal
xlim([0.5,N+0.5]);ylim([0.5,N+0.5]);zlim([-1,1]); title('Ideal: Im(\rho)')


end