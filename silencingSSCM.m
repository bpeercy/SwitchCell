function [t,x,M]=silencingSSCM(filename,hub)
%This function runs the SSCM model with or without the silencing of some 
%cells. 
%
%Inputs: hub- the number of the hub cell that will be silenced, 0 if no hub
%               cell is to be silenced
%        filename- the name of the .mat file containing the parameters
%           (e.g. 'parameters.mat')
%
%Outputs: t- associated time vector
%         x- solutions of the differential system organized as
%               Columns 1:N- Voltage
%               Columns N+1:2*N- n
%               Columns 2*N+1:3*N- s
%               Columns 3*N+1:4*N- Calcium



%STEP 1: Parameter set up
simTime=300; %simulation time in seconds
load(filename,'gkatp','gca','gk','gs','kca','x0','M')
N=size(M,1);


%STEP 2: Define model equations and solve system
if hub==0; fun = @(t, x) odefunc(t, x, kca, gca, gkatp, gk, gs, N, M,[]);
else; fun = @(t, x) odefunc(t, x, kca, gca, gkatp, gk, gs, N, M, hub);
end

[t,x] = ode45(fun, [0 simTime], x0);


    function dxdt=odefunc(t, x, kca, gca, gkatp, gk, gs, N, M,hub)
        %Parameters
        Cm = 5.3;           
        Vm = -20;           
        theta_m = 12;       
        Vn = -16;           
        theta_n = 5.6;      
        Vs = -52;           
        theta_s = 10;       
        Vca = 25;           
        Vk = -75;           
        tau_n = 20e-3;      
        tau_s = 20000e-3;   
        f = 0.01;           
        alph = 4.5e-3;      
        gcl=100;
        Vcl=-70;
        sigma=zeros(N,1);
        sigma(hub)=1;
        
        %Declaration of variable
        V = x(1:N);               %mV
        n = x(N+1:2*N);       %unitless
        s = x(2*N+1:3*N);   %unitless
        Ca = x(3*N+1:4*N);   %uM
        
        %Calculate expressions
        minf = (1+exp((Vm-V)/theta_m)).^-1;
        ninf = (1+exp((Vn-V)/theta_n)).^-1;
        sinf = (1+exp((Vs-V)/theta_s)).^-1;
        Ica = gca.*minf.*(V-Vca);
        Ikatp = gkatp.*(V-Vk);
        Ik = gk.*n.*(V-Vk);
        Is = gs.* s.*(V-Vk);
        Icl=gcl*sigma.*(V-Vcl);
        Icoup = M*V;
        
        %RHS
        dVdt = (Ica + Ikatp + Ik + Is + Icl+ Icoup)./(-Cm);            %mV/s
        dndt = (ninf - n)/tau_n;                                  %1/s
        dsdt = (sinf - s)/tau_s;                                  %1/s
        dCadt = f * (-alph .* Ica - kca .* Ca);                   %uM/s
        
        dxdt=[dVdt; dndt; dsdt; dCadt];
    end


end