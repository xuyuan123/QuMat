function [fidelity,rho] = wigner_fidelityMLE(MeasWigner, xvec,yvec, ideal_psi)
if size(ideal_psi,1)==size(ideal_psi,2)
    ideal_rho=ideal_psi;
else
    ideal_rho=ideal_psi*ideal_psi';
end
MeasWigner(isnan(MeasWigner))=0; % set all the nan element to zero in MeasWigner.
sizeData = size(MeasWigner);
sizeTotal = sizeData(1)*sizeData(2);
[realMesh, imagMesh] = meshgrid(xvec, yvec);
displaceMatrix = realMesh + 1i*imagMesh;
resoSq = abs(xvec(2) - xvec(1))*abs(yvec(2)-yvec(1));
normalizer = 1/(sum(sum(MeasWigner))*(resoSq))*pi/2;
data2edit_sum = sum(sum(MeasWigner));
fprintf('Sum of the wigner data: %.5f\n',data2edit_sum)
data2edit = (MeasWigner)*normalizer;
numberMeasured=sizeTotal;

%normalized measurements
import.data = data2edit;
%respective displacements
import.displace = displaceMatrix;
%total number of measurements
import.size = sizeTotal;
%plotting mesh for real axis
import.realMesh = realMesh;
%plotting mesh for imaginary axis
import.imagMesh = imagMesh;

figure(11); surf(realMesh,imagMesh, data2edit ,'LineStyle','none');
ax=gca;ax.CLim=[-1,1];ax.Layer = 'top';
colormap(ax,redblue)
view(2); axis equal; colorbar;
xlim([xvec(1),xvec(end)]);ylim([yvec(1),yvec(end)]);
xlabel('Re(\beta)');ylabel('Im(\beta)');
title('Normalized Cavity State Wigner')

numberTruncation =40;
N = 50;
a = destroy(N);
parity = expm(1i*pi*(a'*a));
%initialize the design matrix
% designM = zeros(numberMeasured,numberTruncation^2);
index = 1;
% loop through each measurement for this data set
for m = 1:import.size
%     name the current displacement
    alpha = import.displace(m);
%     define displacement operator
    D = displace(N,alpha);
%     create displaced parity operator
    dispParity = D*parity*D';
%     valueMatrix{index} = dispParity(1:numberTruncation,1:numberTruncation);
    valueMatrix = dispParity(1:numberTruncation,1:numberTruncation).';
%     valueMatrix = dispParity(1:numberTruncation,1:numberTruncation);
% 
    designM(index,:) = double(valueMatrix(:));
    index = index + 1;
end

% %convert struct data into a cell array
% importCell = {import.data};
% %reshape each cell into a vector
% importCell = cellfun(@(x)reshape(x,1,[]),importCell,'UniformOutput',false);
% %concatenate cells into an observation list
% obvList = cell2mat(importCell)';

obvList = reshape(import.data,[],1);
% numMeasWigner = length(obvList);
tic;
cvx_begin
cvx_precision('high')
    variable rho(numberTruncation,numberTruncation) hermitian
%     tempExpect = [];
%     for k=1:numMeasWigner
%         tempExpect=[tempExpect;trace(rho*valueMatrix{k})];
%     end
%         minimize( norm(tempExpect-obvList) )
    minimize( norm(designM*rho(:)-obvList) )
    subject to
        rho == hermitian_semidefinite(numberTruncation);
        trace(rho) == 1;      
        
cvx_end
toc;

figure(12); 
plot_wigner(rho,xvec,yvec);
title('Reconstructed Wigner');

fidelity=trace(rho*ideal_rho);

figure(13);
subplot(2,2,1);
mybar3(real(rho)); caxis([-0.5,0.5])
xlim([0,10]);ylim([0,10]);zlim([-0.5,0.5]);
subplot(2,2,2);
mybar3(imag(rho)); caxis([-0.5,0.5])
xlim([0,10]);ylim([0,10]);zlim([-0.5,0.5]);
subplot(2,2,3);
mybar3(real(ideal_rho)); caxis([-0.5,0.5])
xlim([0,10]);ylim([0,10]);zlim([-0.5,0.5]);
subplot(2,2,4);
mybar3(imag(ideal_rho)); caxis([-0.5,0.5])
xlim([0,10]);ylim([0,10]);zlim([-0.5,0.5]);
annotation('textbox',[0.40 0.20 0.3 0.3],'String',sprintf('fidelity=%4f',fidelity),'FitBoxToText','on');
end