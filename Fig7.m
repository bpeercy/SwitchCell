%Graphs for Figure 7 in "Flipping the switch on the hub cell: Islet
%desynchronization through cell silencing"


%Subfigure A
[t,x]=silencingSSCM('Fig7Parameters.mat',0);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);
F=computeFuncConn(0:300,Ca);
PowerLawHist(F);

%Subfigure B
[t2,x2]=silencingSSCM('Fig7Parameters.mat',11);
Ca2=interp1(t2,x2(:,3*57+1:4*57),0:300);
F2=computeFuncConn(0:300,Ca2);
funcConnVisualization(F, F2,11)

%Subfigure C
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
title('Cell 11 Silenced')

%Subfigure D
load('cellLocations.mat','loc')
load('Fig7Parameters.mat','M')
figure('DefaultAxesFontSize',16);
hold on
plot3(loc(:,1),loc(:,2),loc(:,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerEdgeColor','k','MarkerFaceColor','w')
plot3(loc(11,1),loc(11,2),loc(11,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerFaceColor','g','MarkerEdgeColor','k');
plot3(loc(4,1),loc(4,2),loc(4,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerFaceColor','b','MarkerEdgeColor','k');
plot3(loc(32,1),loc(32,2),loc(32,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerFaceColor','m','MarkerEdgeColor','k');
for i=1:57
    for j=1:57
        if M(i,j)==1
            tempx=[loc(i,1) loc(j,1)];
            tempy=[loc(i,2) loc(j,2)];
            tempz=[loc(i,3) loc(j,3)];
            plot3(tempx,tempy,tempz,'k')
        end
    end
    text(loc(i,1),loc(i,2),loc(i,3)+0.05,num2str(i))
end
axis off
view(-173, 16)

%Subfigure E
figure('DefaultAxesFontSize',16)
subplot(2,1,1)
[t,x]=silencingSSCM('Fig7Parameters.mat',4);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);
Ca_bin=Ca>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')
title('Neighboring Cell 4 Silenced')

subplot(2,1,2)
[t,x]=silencingSSCM('Fig7Parameters.mat',32);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);
Ca_bin=Ca>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')
title('Nonswitch Cell 32 Silenced')
