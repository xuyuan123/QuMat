function [out] = plot_ChiMatrix(chi)
%% bar plot of a process chi matrix;
N = size(chi,1);nq=log2(N)/2;
if nq==1
h=figure('Position',[500 500 800 300]);
PauliSet = {'I','X','Y','Z'};
elseif nq==2
h=figure('Position',[300 300 1500 400]);
PauliSet = {'II','IX','IY','IZ','XI','YI','ZI','XX','XY','XZ','YX','YY','YZ','ZX','ZY','ZZ'};
elseif nq==3
h=figure('Position',[0 400 1900 500]);
PauliSet = {'III','IIX','IIY','IIZ','IXI','IYI','IZI','XII','YII','ZII',...
            'IXX','IYX','IZX','IXY','IYY','IZY','IXZ','IYZ','IZZ',...
            'XIX','YIX','ZIX','XIY','YIY','ZIY','XIZ','YIZ','ZIZ',...
            'XXI','YXI','ZXI','XYI','YYI','ZYI','XZI','YZI','ZZI',...
            'XXX','YXX','ZXX','XYX','YYX','ZYX','XZX','YZX','ZZX',...
            'XXY','YXY','ZXY','XYY','YYY','ZYY','XZY','YZY','ZZY',...
            'XXZ','YXZ','ZXZ','XYZ','YYZ','ZYZ','XZZ','YZZ','ZZZ'};
end
subplot(1,2,1)
mybar3(real(chi)); caxis([-1,1]);%axis equal
xlim([0.5,N+0.5]);ylim([0.5,N+0.5]);zlim([-1,1]); title('Ideal: Re(\chi)')
set(gca,'xtick', 1:1:N); set(gca,'ytick', 1:1:N); set(gca,'ztick', -1:1:1);
set(gca,'Xticklabel', PauliSet);set(gca,'Yticklabel', PauliSet);
set(gca,'YTickLabelRotation',45);
subplot(1,2,2)
mybar3(imag(chi)); caxis([-1,1]);%axis equal
xlim([0.5,N+0.5]);ylim([0.5,N+0.5]);zlim([-1,1]); title('Ideal: Im(\chi)')
set(gca,'xtick', 1:1:N); set(gca,'ytick', 1:1:N); set(gca,'ztick', -1:1:1);
set(gca,'Xticklabel', PauliSet);set(gca,'Yticklabel', PauliSet);
set(gca,'YTickLabelRotation',45);

if nargout>=1
    out=h;
end

end