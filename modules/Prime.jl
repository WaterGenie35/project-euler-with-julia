module Prime

export isprime, nthprime, primeslessthan, primefactors

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

function nthprime(n::Int)
    if n <= 2
        return n + 1
    end
    index = 3
    candidate = 5
    while index < n
        candidate += 2
        if isprime(candidate)
            index += 1
        end
    end
    return candidate
end

function primeslessthan(n::Number)
    primes = Int[]
    if n >= 3
        push!(primes, 2)
    end
    if n >= 4
        push!(primes, 3)
    end
    if n <= 5
        return primes
    end

    candidate = 5
    while (candidate < n)
        if isprime(candidate)
            push!(primes, candidate)
        end
        candidate += 2
    end
    return primes
end

function primefactors(n::Int)
    factors = Int[]
    if (n % 2) == 0
        push!(factors, 2)
    end
    factor = 3
    while (factor ^ 2) <= n
        if (n % factor) == 0 && isprime(factor)
            push!(factors, factor)
        end
        factor += 2
    end
    return factors
end

end
