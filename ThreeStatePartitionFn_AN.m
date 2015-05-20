% calculates the partition function and the associated probabilities (np) for the three-state model

function [np]= ThreeStatePartitionFn_AN(N,B,J)

if N<3
    [np]= PartitionFn_AN(N,B,J);
end
if N>=3
    
for n=0:N
    
    for m=0:N
        k = N -(n+m);
        while (n+m)<N
        
        C = nchoosek(N,n);
        D = nchoosek((N-n),m);
        S = B*(n-m);
        
        if n == 1
           d = (J)*(nchoosek(m,2)+nchoosek(k,2)-m*n-n*k-m*k);
        end
        if m == 1
           d = (J)*(nchoosek(n,2)+nchoosek(k,2)-m*n-n*k-m*k);
        end
                if k == 1
                    d = (J)*(nchoosek(n,2)+nchoosek(m,2)-m*n-n*k-m*k);
                end
                       
        d = (J)*(nchoosek(n,2)+nchoosek(m,2)+nchoosek(k,2)-m*n-n*k-m*k);  
        end
                        
        p(n+1) = C*D*exp(S)*exp(d); % non normalized probability 
        end
        
        end
    end
    
   


%P=sum(p);   %  partition function, need to modify since the summation was over two indices
%np=p/P;     %  normalized probability

np ;  % troubleshooting, calculate nonnomalised P

% for n=1:N
%   np(n)=p(n)/P ;
% end

vect=0:N;
%figure, plot(vect,np,'r*');



% ylim([0 1.1]);
% xlim([0 N+1]);
%legend({param1,param2});

end