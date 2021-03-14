These files are associated with the paper "Flipping the switch on the hub cell: Islet desynchronization through cell silencing." There are scripts to recreate Figures 4, 6, 7, 8, and 9, titled accordingly. The other files are used in these scripts. Below is a brief description of each file:

computeFuncConn.m: Given the time vector and calcium traces of cells in an islet, it computes the functional connectivity of the islet. Currently the process of calculating significance of a connection is commented out since it adds a significant amount of computation time while making very little difference in the outcome.

funcConnVisualization.m: Given the functional connectivity of the islet before and after silencing a cell, it creates a graphical representation of both connectivities. 

PowerLawHist.m: Given the functional connectivity of the islet, it fits a power law distribution to the distribution of functional connections and displays the histogram along with the fit.

silencingSSCM.m: Given a parameter set, it solves the Single Slow Channel Model with the option of silencing cells in the islet.

Fig4.m: A script that creates the six subfigures in Figure 4.

Fig6.m: A script that creates the three subfigures in Figure 6.

Fig7.m: A script that creates the five subfigures in Figure 7.

Fig8.m: A script that creates the three subfigures in Figure 8.

Fig9.m: A script that creates the six subfigures in Figure 9.

cellLocations.mat: A data file that gives the x,y,z coordinates for each cell in a 57 cell islet.

Fig4Parameters.mat: A data file with the cell and network parameters for the islet in Figure 4.

Fig6Parameters.mat: A data file with the cell and network parameters for the islet in Figure 6.

Fig7Parameters.mat: A data file with the cell and network parameters for the islet in Figure 7.

Fig8Parameters.mat: A data file with the cell and network parameters for the islet in Figure 8.

Fig9Parameters.mat: A data file with the cell and network parameters for the islet in Figure 9.




