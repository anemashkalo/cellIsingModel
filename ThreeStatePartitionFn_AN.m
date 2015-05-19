% calculates the partition function and the associated probabilities (np) for the three-state model

function [np]= ThreeStatePartitionFn_AN(N,B,J)
 
for n=0:N
    for m=0:N 
        %while ~(m == n)
       k = N-(n+m);
        C = nchoosek(N,n);
        D = nchoosek(N-n,m);
        S = B*(n-m);
        d = (J)*(nchoosek(n,2)+nchoosek(m,2)+nchoosek(k,2)-m*n-n*k-m*k);
        m
        p(n+1) = C*D*exp(S)*exp(d); % non normalized probability
        %P = P+p(n);
        %  partition function
       % end
    end
    n
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