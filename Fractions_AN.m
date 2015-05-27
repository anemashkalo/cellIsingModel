% calculates the expectation value of the fraction of "spin up" cells (
% those of which there are n within the colony N
function [fr] = Fractions_AN(N,B,J)

       np = ThreeStatePartitionFn_AN(N,B,J); %  np is an (nxm) matrix for a given row with n, the values (n,m1),(n,m2)...
                                             %  correspond to probabilities
                                             %   of observing n with the corresponding m(i). 
                                             
       pp = sum(np,2); % if sum up along the second dimention will get the column vector with necessaty weights for each possible n, which can be used to calculate the expectation value below
       fr=0;
      
for n=0:N
    %for m=0:(N-n)
                expect(n+1) = ((n)/N)*pp(n+1);
        %expect(n+1,m+1)= ((n)/N)*np(n+1,m+1); 
        %end
end
fr = sum(expect);
% fr = sum(fr);
 
 
end

