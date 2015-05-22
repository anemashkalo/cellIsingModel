% calculates the partition function and the associated probabilities (np) for the three-state model

function [np]= ThreeStatePartitionFn_AN(N,B,J)
%disp('is called');

for n=0:N
    for m=0:N
        
        C = nchoosek(N,n);
        D = ((N-n)*(N-n-1))/factorial(m);             %nchoosek((N-n),m);
        S = B*(n-m);
        k = N -(n+m);
        d = (J/2)*(power(n,2)+power(m,2)+power(k,2)-n*(1+2*m)-m*(1+...
            2*k)-k*(1+2*n));
        
        p(n+1,m+1) = C*D*exp(S)*exp(d); % non normalized probability
    end
    
end


P=sum(p);   %  partition function, need to modify since the summation was over two indices
np=p/P;     %  normalized probability



% for n=1:N
%   np(n)=p(n)/P ;
% end

vect=0:N;
%figure, plot(vect,np,'r*');



% ylim([0 1.1]);
% xlim([0 N+1]);
%legend({param1,param2});

end