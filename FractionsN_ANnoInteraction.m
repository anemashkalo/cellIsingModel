function [frN] = FractionsN_ANnoInteraction(N)
%[np]= PartitionFn_AN(N,B,J);
frN=0;
%for k=0:N

for i=1:N
    frN(i) = Fractions_ANnoInteraction(i);% uses the three-state partition function
     %frN(i) = Fractions_ANtwostate(i,B,J); % to use the two-state partition function
end
%frN;
%  vect=1:N;
% %
%   figure, plot(vect,(frN),'b*');
%    %  ylim([0 1]);
%   xlim([0 N+1]);
%  title('FractionsN');
end
