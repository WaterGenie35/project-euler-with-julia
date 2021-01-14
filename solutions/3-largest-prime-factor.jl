

function isprime(n::Int)
    if n <= 3
        return n >= 2
    end
    if (n % 2) == 0
        return false
    end
    factor = 3
    while (factor ^ 2) <= n
        if (n % factor) == 0
            return false
        end
        factor += 2
    end
    return true
end


function primefactors(n::Int)
    factors = Int[]
    if (n % 2) == 0
        push!(factors, 2)
    end
    factor = 3
    while (factor ^ 2) <= n
        if isprime(factor) && (n % factor) == 0
            push!(factors, factor)
        end
        factor += 2
    end
    return factors
end


@show last(primefactors(600_851_475_143))
