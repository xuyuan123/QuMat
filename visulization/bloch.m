function h = bloch(axislabel)
if nargin<1
    axislabel={'','x','','y','|1\rangle','|0\rangle'};
end
figure;
a = fsurf(@(t,x) sin(t).*cos(x),@(t,x) sin(t).*sin(x),@(t,x) cos(t),[0,pi,0,2*pi],...
    'MeshDensity',35,'FaceColor',[0.5,0.5,0.5],'EdgeColor','none','FaceAlpha',0.5,'LineWidth',1.2);
axis equal; hold on;
arrow3([-1,0,0],[1,0,0],'color','m','LineWidth',1.2);
arrow3([0,-1,0],[0,1,0],'color','m','LineWidth',1.2);
arrow3([0,0,-1],[0,0,1],'color','m','LineWidth',1.2);
set(gca,'XtickLabel','');set(gca,'YtickLabel','');set(gca,'ZtickLabel','');
set(gca,'Xtick','');set(gca,'Ytick','');set(gca,'Ztick','');
xlim([-1.2,1.2]);ylim([-1.2,1.2]);zlim([-1.2,1.2]);
t = text([-1.1,1.1,0,0,0,0],[0,0,-1.1,1.1,0,0],[0,0,0,0,-1.1,1.1],axislabel);
for k=1:6
t(k).FontWeight = 'bold'; t(k).Color = 'm'; t(k).FontSize = 14;
end
fplot3( @(t) sin(t), @(t) t*0, @(t) cos(t),'k','LineWidth',2)
fplot3(@(t) sin(t), @(t) cos(t),@(t) t*0,'k','LineWidth',2)
fplot3(@(t) t*0, @(t) sin(t), @(t) cos(t),'k','LineWidth',2)
fsurf(@(x,y) sin(x).*cos(y), @(x,y) sin(x).*sin(y), @(x,y) 0.*cos(x),[0,pi,0,2*pi],'EdgeColor','none','FaceColor','c','FaceAlpha',0.1)
fsurf(@(x,y) sin(x).*cos(y), @(x,y) 0.*sin(x).*sin(y), @(x,y) cos(x),[0,pi,0,2*pi],'EdgeColor','none','FaceColor','c','FaceAlpha',0.1)
fsurf(@(x,y) 0.*sin(x).*cos(y), @(x,y) sin(x).*sin(y), @(x,y) cos(x),[0,pi,0,2*pi],'EdgeColor','none','FaceColor','c','FaceAlpha',0.1)

view([130,30])
if nargout>0
    h=a;
end
end