function [np]= PartitionFn_noInteraction(N,prob)
for n=0:N
    C = nchoosek(N,n);
    p(n+1) = C*(power((prob),n)*power((1-(prob)),(N-n)));
   
end
P=sum(p);   % partition function
np=p/P;     % normalized probability
vect=0:N;
% figure, plot(vect,np,'-*m');
% ylim([ 0 1]);
end
