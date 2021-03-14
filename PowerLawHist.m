function []=PowerLawHist(F)
%This function creates a histogram of connections based off the given
%adjacency matrix F. The x-axis represents the number of connections a cell
%has, while the y-axis denotes the number of cells that have that number of
%connections. The histogram is fit to a power law distribution, which is
%then plotted in red on top of the histogram.
%
%Input: F- adjacency matrix
%
%Output: none

%Step 1: Get the power law fit
deg=sum(F);
tbl=tabulate(deg);
tbl(:,1)=tbl(:,1)+1; %shift by one so that 0 functional connections does not cause a problem
mdl=fitlm(log10(tbl(:,1)),log10(tbl(:,2)),'linear');


%Step 2: Plot the histogram
figure('DefaultAxesFontSize',16);
hold on
histogram(deg,-0.5:1:max(deg)+1)
t=-1:0.01:max(deg)+1; 
plot(t,10^(mdl.Coefficients.Estimate(1))*(t+1).^mdl.Coefficients.Estimate(2),'LineWidth',3)

axis([-1 max(deg)+1 0 max(tbl(:,2))+1])
xlabel('Number of Connections')
ylabel('Number of Cells')
title(sprintf('Power Law Fit with R^2=%.3f and k=%.2f',mdl.Rsquared.Ordinary,-mdl.Coefficients.Estimate(2)))

end