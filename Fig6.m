%Graphs for Figure 6 in "Flipping the switch on the hub cell: Islet
%desynchronization through cell silencing"


%Subfigure A
[t,x]=silencingSSCM('Fig6Parameters.mat',0);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);
F=computeFuncConn(0:300,Ca);
PowerLawHist(F);

%Subfigure B
[t2,x2]=silencingSSCM('Fig6Parameters.mat',1);
Ca2=interp1(t2,x2(:,3*57+1:4*57),0:300);
F2=computeFuncConn(0:300,Ca2);
funcConnVisualization(F, F2,1)

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
title('Cell 1 Silenced')