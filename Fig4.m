%Graphs for Figure 4 in "Flipping the switch on the hub cell: Islet
%desynchronization through cell silencing"


%Subfigure A
[t,x,M]=silencingSSCM('Fig4Parameters.mat',0);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);
F=computeFuncConn(0:300,Ca);
PowerLawHist(F);

%Subfigure B
[t2,x2]=silencingSSCM('Fig4Parameters.mat',43);
Ca2=interp1(t2,x2(:,3*57+1:4*57),0:300);
F2=computeFuncConn(0:300,Ca2);
funcConnVisualization(F, F2,43)

%Subfigure C
figure('DefaultAxesFontSize',16);
subplot(2,1,1)
plot(0:300,mean(Ca,2))
ylabel('Mean [Ca^{2+}] (\muM)')
title('Before Silencing')

subplot(2,1,2)
Ca_bin=Ca>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')

%Subfigure D
figure('DefaultAxesFontSize',16);
subplot(2,1,1)
plot(0:300,mean(Ca2,2))
ylabel('Mean [Ca^{2+}] (\muM)')
title('Functional Hub Cell 43 Silenced')

subplot(2,1,2)
Ca_bin=Ca2>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')

%Subfigure E
[t,x]=silencingSSCM('Fig4Parameters.mat',[43 54]);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);

figure('DefaultAxesFontSize',16);
subplot(2,1,1)
plot(0:300,mean(Ca,2))
ylabel('Mean [Ca^{2+}] (\muM)')
title('Top Two Functionally Connected Cells 43, 54 Silenced')

subplot(2,1,2)
Ca_bin=Ca>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')

%Subfigure F
[t,x]=silencingSSCM('Fig4Parameters.mat',6);
Ca=interp1(t,x(:,3*57+1:4*57),0:300);

figure('DefaultAxesFontSize',16);
subplot(2,1,1)
plot(0:300,mean(Ca,2))
ylabel('Mean [Ca^{2+}] (\muM)')
title('Randomly Selected Cell 6 Silenced')

subplot(2,1,2)
Ca_bin=Ca>0.15;
raster=Ca_bin.*(1:57);
raster(raster==0)=NaN;
plot(0:300,raster,'LineStyle','none','Marker','.','Color','k')
ylabel('Cell Number')
xlabel('Time (s)')
