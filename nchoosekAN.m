function [d] = nchoosekAN(n,k)

if n<k
    d = 0;
else
    d = nchoosek(n,k);
end

end