function [fr] = Fractions_AN(N,B,J)

if N == 1
np= PartitionFn_AN(N,B,J);
fr=0;
 
     for n=0:N
    expect(n+1) = ((n)/N)*(np(n+1)); % 
       
    end
fr = sum(expect);
else
%if model  == 3 || model >3
       np = ThreeStatePartitionFn_AN(N,B,J);
       pp = sum(np,2);
 fr=0;
      
for n=0:N
    %for m=0:(N-n)
        
        expect(n+1) = ((n)/N)*pp(n+1);
        %expect(n+1,m+1)= ((n)/N)*np(n+1,m+1); 
    
    %end
end

fr = sum(expect);
% fr = sum(fr);
 %end
%end 
 
vect=0:N;

% figure, plot(vect,(fr),'b*');
%  
% ylim([0 1]);
% xlim([0 N+1]);
% title('Fractions');
end
end
