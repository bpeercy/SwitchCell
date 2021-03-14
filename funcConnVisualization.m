function []=funcConnVisualization(F, F2,funcHub)
%This function helps to visualize the functional connectivity before and 
%after silencing the hub cell, which is marked in the islet.
%
%Inputs: F- the functional connectivity adjacency matrix before silencing
%        F2- the functional connectivity adjacency matrix before silencing
%        hub- the index of the hub cell
%
%Output: none


%STEP 1: Get locations of cells in xyz plane
load('cellLocations.mat','loc')
N=size(loc,1);

%STEP 2: Plot before silencing functioncal connections
figure('DefaultAxesFontSize',16);
subplot(2,1,1)
hold on

%plotting the cells
plot3(loc(:,1),loc(:,2),loc(:,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerEdgeColor','k','MarkerFaceColor','w')
plot3(loc(funcHub,1),loc(funcHub,2),loc(funcHub,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerFaceColor','g','MarkerEdgeColor','k');

%plotting the connections & cell numbers
for i=1:N
    for j=1:N
        if F(i,j)==1
            x=[loc(i,1) loc(j,1)];
            y=[loc(i,2) loc(j,2)];
            z=[loc(i,3) loc(j,3)];
            plot3(x,y,z,'r','LineWidth',2)
        end
    end
    text(loc(i,1),loc(i,2),loc(i,3)+0.05,num2str(i))
end
axis off
view(-173, 16)

%STEP 3: Plot after silencing connections
subplot(2,1,2)
hold on

%plotting the cells
plot3(loc(:,1),loc(:,2),loc(:,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerEdgeColor','k','MarkerFaceColor','w')
plot3(loc(funcHub,1),loc(funcHub,2),loc(funcHub,3),'LineStyle','none','Marker','o','MarkerSize',50,'MarkerFaceColor','g','MarkerEdgeColor','k');

%plotting the connections & cell numbers
for i=1:N
    for j=1:N
        if F2(i,j)==1
            x=[loc(i,1) loc(j,1)];
            y=[loc(i,2) loc(j,2)];
            z=[loc(i,3) loc(j,3)];
            plot3(x,y,z,'r','LineWidth',2)
        end
    end
    text(loc(i,1),loc(i,2),loc(i,3)+0.05,num2str(i))
end

axis off
view(-173, 16)

end


