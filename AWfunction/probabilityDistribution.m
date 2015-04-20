function prob = probabilityDistribution(N,B,J)

prob = zeros(N+1,1);

for n=0:N
    prob(n+1)=nchoosek(N,n)*exp(B*(2*n-N)+J/2*((N-2*n)^2-N));
end

prob = prob/sum(prob);
