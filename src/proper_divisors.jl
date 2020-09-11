using Primes
using Base.Iterators: drop, product

proper_divisors(n) = begin
    if n == 1
        return [1]
    end
    factors_of_n = factor(n)
    nfactors = prod(x -> x[2] + 1, factors_of_n)
    res = Vector{Int}(undef, nfactors)
    res .= 1
    i = 1
    for (factor, power) in factors_of_n
        if i == 1
            res[1] = 1
            res[2:power+1] .= factor .^ (1:power)
            i = power + 1
        else
            next_few = i * power
            next_few_vals = [
                existing * more
                for (existing, more) in product(res[1:i], factor .^ (1:power))
            ]
            res[i+1:i+next_few] = vec(next_few_vals)
            i += next_few
        end
    end
    res[1:end-1]
end
