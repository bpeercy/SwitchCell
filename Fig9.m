%Graphs for Figure 9 in "Flipping the switch on the hub cell: Islet
%desynchronization through cell silencing"


%Subfigure A
load('Fig9Parameters','gca','gkatp')
load('cellLocations.mat','loc')

figure('DefaultAxesFontSize',16);
hold on;
col=(max(gkatp)-gkatp)./(max(gkatp)-min(gkatp));
for j=1:57; plot3(loc(j,1),loc(j,2),loc(j,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerEdgeColor',[0.5686 0.5686 0.5686],'MarkerFaceColor',[col(j) col(j) 1]); end
for j=1:57; text(loc(j,1),loc(j,2),loc(j,3),num2str(j)); end
view(-12,18)
axis off
map=[0:0.01:1; 0:0.01:1; ones(1,101)]';
colormap(map)
colorbar('Ticks',[0 1], 'TickLabels',{'161 pS','115 pS'})

%Subfigure B
figure('DefaultAxesFontSize',16);
hold on;
col=(max(gkatp)-gkatp)./(max(gkatp)-min(gkatp));
for j=1:57; plot3(loc(j,1),loc(j,2),loc(j,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerEdgeColor',[0.5686 0.5686 0.5686],'MarkerFaceColor',[1-col(j) 1 1-col(j)]); end
for j=1:57; text(loc(j,1),loc(j,2),loc(j,3),num2str(j)); end
view(-12,18)
axis off
view(68,24)
map=[0:0.01:1; ones(1,101); 0:0.01:1;]';
colormap(map)
colorbar('Ticks',[0 1], 'TickLabels',{'869 pS','1186 pS'})

%Subfigure C
figure('DefaultAxesFontSize',16);
hold on;
active=find(gkatp<(0.196*gca-62.88));
plot3(loc(:,1),loc(:,2),loc(:,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerEdgeColor',[0.5686 0.5686 0.5686],'MarkerFaceColor','w')
plot3(loc(active,1),loc(active,2),loc(active,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerEdgeColor',[0.5686 0.5686 0.5686],'MarkerFaceColor','r')
for j=1:57; text(loc(j,1),loc(j,2),loc(j,3),num2str(j)); end
axis off
view(-12,18)

%Subfigure D
[t,x]=silencingSSCM('Fig9Parameters.mat',0);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);
F=computeFuncConn(0:300,Ca);
PowerLawHist(F);

%Subfigure E
[t2,x2]=silencingSSCM('Fig9Parameters.mat',18);
Ca2=interp1(t2,x2(:,3*57+1:4*57),0:300);
F2=computeFuncConn(0:300,Ca2);
funcConnVisualization(F, F2,18)

%Subfigure F
figure('DefaultAxesFontSize',16)
subplot(2,1,1)
Ca_bin=Ca>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')
title('Before Silencing')

subplot(2,1,2)
Ca_bin=Ca2>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')
title('Cell 18 Silenced')
