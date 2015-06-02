function [frN] = FractionsN_AN(N,B,J)
%[np]= PartitionFn_AN(N,B,J);
 frN=0;
 %for k=0:N
    
for i=1:N
        frN(i) = Fractions_AN(i,B,J);
        %fr(n+1) = sum(expect);
    end
%frN;
%  vect=1:N;
% % 
%   figure, plot(vect,(frN),'b*');
%    %  ylim([0 1]);
%   xlim([0 N+1]);
%  title('FractionsN');
end
