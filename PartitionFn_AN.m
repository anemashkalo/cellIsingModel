function [np]= PartitionFn_AN(N,B,J)
% calculates the partition function and the associated probabilities (variable np) for the two-state model
for n=0:N    
    C = nchoosek(N,n);
    S = B*(2*n-N);
    d = (J/2)*(power((N-2*n),2) - N);    
    p(n+1) = C*exp(S)*exp(d); % non normalized probability
    %P = P+p(n);              %  partition function    
end
P=sum(p); %  partition function
np=p/P;   % normalized probability
% for n=1:N
%   np(n)=p(n)/P ;
% end
vect=0:N;
%figure, plot(vect,np,'r*');
% ylim([0 1.1]);
% xlim([0 N+1]);
%legend({param1,param2});

end

