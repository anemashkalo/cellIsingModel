function [np]= PartitionFn_noInteraction(N)
for n=0:N
    C = nchoosek(N,n);
    p(n+1) = C*(power((n/N),n)*power((1-(n/N)),(N-n)));
    %P = P+p(n);              %  partition function
end
P=sum(p);%  partition function
np=p/P;     % normalized probability
vect=0:N;
figure, plot(vect,np,'-*m');
ylim([ 0 1]);
end
% fr = [];
% for n=0:N
%     expect(n+1) = ((n)/N)*np(n+1);
%        end
% fr = sum(expect);
% end

% frN=0;
% for i=1:N
%     frN(i) = Fractions_AN(i,B,J);% uses the three-state partition function
% end