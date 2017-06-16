% calculates the partition function and the associated normalized probabilities (np) for the three-state model

function [np]= ThreeStatePartitionFn_AN(N,B,J)
%disp('is called');

for n=0:N
    for m=0:(N-n)
        
        C = nchoosekAN(N,n);                 %nchoosek(N,n)
        D = nchoosekAN((N-n),m);             %nchoosek((N-n),m);
        S = B*(n-m);
        k = N -(n+m);
        d = (J/2)*(power(n,2)+power(m,2)+power(k,2)-n*(1+2*m)-m*(1+2*k)-k*(1+2*n));
        p(n+1,m+1) = C*D*exp(S)*exp(d); % non normalized probability
        
    end
    
end

P=sum(p); %   sum along the first dimension ( sum of values in each column in the p matrix each corresponding to diferent value of n
P = sum(P);  %   sum along the second dimention
% now P is the sum of all possible states

np = p/P;      %  normalized probability; in the case of the model with three states, this "np' is represented by a matrix (n,m)
%-----------------------------------------------
% this portion will just plot the firs colum of np ( probabilities for
% possible values of n, given m=0 (first column of np corresponds to m =
% 0)
%  vect=0:N;
%  figure, plot(vect,np(:,1),'r*');
%  ylim([0 1.1]);
%  xlim([0 N+1]);
end

