function [fr] = Fractions_ANnoInteraction(N,prob)


[np]= PartitionFn_noInteraction(N,prob) ;
%pp = sum(np,2); % if sum up along the second dimention will get the column vector with necessaty weights for each possible n, which can be used to calculate the expectation value below
fr=0;

for n=0:N
    expect(n+1) = ((n/N))*np(n+1);%
end
fr = sum(expect);
% fr = sum(fr);


end

