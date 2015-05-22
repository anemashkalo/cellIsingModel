function [fr] = Fractions_AN(N,B,J,model)

if model <3
[np]= PartitionFn_AN(N,B,J);
else
    [np]= ThreeStatePartitionFn_AN(N,B,J);
end
 fr=0;
 %for k=0:N
     
for n=0:N
    expect(n+1) = ((n)/N)*(np(n+1)); % 
    
    %fr(n+1) = sum(expect);
    
end

fr = sum(expect);
 %end
       
vect=0:N;

% figure, plot(vect,(fr),'b*');
%  
% ylim([0 1]);
% xlim([0 N+1]);
% title('Fractions');
end
