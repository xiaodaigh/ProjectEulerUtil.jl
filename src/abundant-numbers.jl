export proper_divisors, is_abundant



is_abundant(n) = begin
    sum(proper_divisors(n)) > n
end
