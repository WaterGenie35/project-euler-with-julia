module Utility

export multipleof, factorsof
export firstndigits
export fibonacci
export ispalindrome, ispythagoreantriplet


function multipleof(n::Int, base::Int)
    return (n % base) == 0
end


function factorsof(n::Int)
    factors = Int[]
    push!(factors, 1)
    push!(factors, n)
    candidate = 2
    while (candidate ^ 2) <= n
        if multipleof(n, candidate)
            push!(factors, candidate)
            push!(factors, n / candidate)
        end
        candidate += 1
    end
    return factors
end


function firstndigits(num::Number, n::Int)
    numdigits = floor(log(10, num))
    divider = 10 ^ (numdigits - n + 1)
    ndigits = floor(num / divider)
    return ndigits
end


function fibonacci(n::Int, basecase=(1, 2))
    if n < 1
        return nothing
    end
    if n <= 2
        return basecase[n]
    end
    fn1 = basecase[1]
    fn2 = basecase[2]
    sum = 0
    for current = 3:n
        sum = fn1 + fn2
        fn1 = fn2
        fn2 = sum
    end
    return sum
end


function ispalindrome(n::Int)
    if n < 0
        n = -n
    end
    if n < 10
        return true
    end
    forward_string = string(n)
    backward_string = reverse(forward_string)
    return forward_string == backward_string
end


function ispythagoreantriplet(a::Int, b::Int, c::Int)
    return (a^2 + b^2) == c^2
end


end
