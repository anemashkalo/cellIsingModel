function [fr] = Fractions_AN(N,B,J)

if N == 1
np= PartitionFn_AN(N,B,J);
fr=0;
 %for k=0:N
     for n=0:N
    expect(n+1) = ((n)/N)*(np(n+1)); % 
        %fr(n+1) = sum(expect);
    end
fr = sum(expect);
else
%if model  == 3 || model >3
       np = ThreeStatePartitionFn_AN(N,B,J);
 fr=0;
      
for n=0:N
    for m=0:(N-n)
    expect(n+1,m+1)= ((n)/N)*np(n+1,m+1); % 
    
    %fr(n+1) = sum(expect);
    end
end

fr = sum(expect);
fr = sum(fr);
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
