% calculates the partition function and the associated probabilities (np) for the three-state model

function [np]= ThreeStatePartitionFn_AN(N,B,J)
%disp('is called');
if N == 1
 np = PartitionFn_AN(N,B,J);
 
else

for n=0:N
    for m=0:(N-n)
        
        C = (N*(N-1))/factorial(n);                   %nchoosek(N,n)
        D = ((N-n)*(N-n-1))/factorial(m);             %nchoosek((N-n),m);
        S = B*(n-m);
        k = N -(n+m);
        d = (J/2)*(power(n,2)+power(m,2)+power(k,2)-n*(1+2*m)-m*(1+2*k)-k*(1+2*n));
       
        p(n+1,m+1) = C*D*exp(S)*exp(d); % non normalized probability
        
    
    end
    
     
end

   P=sum(p); %   sum along the first dimension ( sum of values in each column in the p matrix each corresponding to diferent value of n
   P = sum(P);  %   sum along the second dimention
   % now P is the sum of all possible states
   
   np = p/P;       %  normalized probability; in the case of the model with three states, this "np' is represented by a matrix (n,m), shifted by 1 
  
   
    % the values of ineterst for this function are the (N+1) values
    % corresponding to the (N+1) possible values of n (0:N) and this is what
    % will be used to calculate the fractions


vect=0:N;
% figure, plot(vect,np,'r*');
% 
%  ylim([0 1.1]);
%  xlim([0 N+1]);
%legend({param1,param2});

end
end


%end