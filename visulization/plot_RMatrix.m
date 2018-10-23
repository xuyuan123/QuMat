function [out] = plot_RMatrix(R)
%% bar plot the Pauli transfer process matrix;
N = size(R,1); nq=log2(N)/2;
if nq==1
figure('Position',[700 500 400 400]);
PauliSet = {'I','X','Y','Z'};
elseif nq==2
figure('Position',[500 300 600 600]);
PauliSet = {'II','IX','IY','IZ','XI','YI','ZI','XX','XY','XZ','YX','YY','YZ','ZX','ZY','ZZ'};
elseif nq==3
figure('Position',[400 50 900 950]);
PauliSet = {'III','IIX','IIY','IIZ','IXI','IYI','IZI','XII','YII','ZII',...
            'IXX','IYX','IZX','IXY','IYY','IZY','IXZ','IYZ','IZZ',...
            'XIX','YIX','ZIX','XIY','YIY','ZIY','XIZ','YIZ','ZIZ',...
            'XXI','YXI','ZXI','XYI','YYI','ZYI','XZI','YZI','ZZI',...
            'XXX','YXX','ZXX','XYX','YYX','ZYX','XZX','YZX','ZZX',...
            'XXY','YXY','ZXY','XYY','YYY','ZYY','XZY','YZY','ZZY',...
            'XXZ','YXZ','ZXZ','XYZ','YYZ','ZYZ','XZZ','YZZ','ZZZ'};
end
h = mybar3(R); caxis([-1,1]);
ax=gca; ax.CLim=[-1,1];axis tight;
colormap(redblue);
xlim([0.5,N+0.5]);ylim([0.5,N+0.5]);zlim([-1,1]); title('Pauli Transfer Matrix: R')
set(gca,'xtick', 1:1:N); set(gca,'ytick', 1:1:N); set(gca,'ztick', -1:1:1);
set(gca,'Xticklabel', PauliSet);set(gca,'Yticklabel', PauliSet);axis equal;
set(gca,'XTickLabelRotation',90);
view(0,90);

if nargout>0
    out=h;
end

end