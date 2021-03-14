function F=computeFuncConn(t,Ca)
%This function calculates the functional connectivity of an islet using the
%algorithm described in the Functional Connectivity section of "Flipping
%the switch on the hub cell: Islet desynchronization through cell silencing"
%
%Inputs: t- time vector (does not need to be equally spaced)
%        Ca- corresponding calcium traces
%
%Output: F- a square matrix where the i,jth entry is 1 is cells i,j are
%           functionally connected or 0 otherwise


[~,N]=size(Ca); %total number of cells

%STEP 1: Interpolation to get evenly spaced data & binarizing using 0.15 uM
Caint=interp1(t,Ca,t(1):t(end));
c=Caint>0.15;

%STEP 2: Calculate time active and coactive
T=zeros(N); %coactivity time
for i=1:N
    for j=i:N
        T(i,j)=sum(c(:,i)+c(:,j)==2); %number of time points they're coactive
    end
end


F=zeros(N); %adjacency matrix

for i=1:N
    for j=i+1:N
        %Step 3: Calculate C
        C=T(i,j)/sqrt(T(i,i)*T(j,j));
        
%Calculating sifnificance step has been commented out as it takes a long 
%time to complete and the exclusion of it does not impact the functional
%connections. Feel free to uncomment if interested.
%         %Step 3b: Calculate significance of Tij
%         c1=c(:,i);
%         c2=c(:,j);
%         PermT=zeros(10000,1);
%         for count=1:10000
%             perm1=c1(randperm(length(c1)));
%             perm2=c2(randperm(length(c2)));
%             PermT(count)=sum(perm1+perm2==2);
%         end
%         
%         tbl=tabulate(PermT); %tabulated version of iterations of Tij
%         %1st column- unique values
%         %2nd column- number of instances
%         %3rd column- probability of occurance
%         
%         index=find(tbl(:,1)==T(i,j));
%         
%         if isempty(index) %Our Tij did not occur in 10000 iterations
%             p=0;
%         else %Our Tij did occur in the 10000 iterations
%             p=sum(tbl(index:end,3))/100;
%         end
%         
%         if p<0.01 && C>0.85; F(i,j)=1; end
         if C>0.85; F(i,j)=1; end
    end
end

F=F'+F;

end
