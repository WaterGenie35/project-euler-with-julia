

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


#=
First, we prove by induction that for all positive natural number n,
f(3n - 1) is even.

We have that:
f(1) = 1 is odd
f(2) = 2 is even

Assume for some natural number k >= 1 that P(k) is true where
    P(k): f(3k - 2) is odd and f(3k - 1) is even

    Then f(3k) = f(3k - 1) + f(3k - 2) is odd
    Then f(3k + 1) = f(3k) + f(3k - 1) is odd
    Then f(3k + 2) = f(3k + 1) + f(3k) is even

    Now f(3k + 1) = f(3k + 3 - 2)
                  = f(3(k+1) - 2) is odd
    And f(3k + 2) = f(3k + 3 - 1)
                  = f(3(k+1) - 1) is even

    So P(k) ==> P(k+1)

Now f(3(1) - 2) = f(1) is odd
and f(3(1) - 1) = f(2) is even
So P(1) is true.

Therefore, f(3k - 1) is even for all k >= 1
=#

#=
Let e(n) = f(3n - 1) be the nth even fibonacci number.
We have that e(1) = f(3(1) - 1) = f(2) = 2
and e(2) = f(3(2) - 1) = f(5) = 8

Now consider:
    f(n) =                 f(n - 1)       +       f(n - 2)
         =      f(n - 2)       + f(n - 3) + f(n - 3) +      f(n - 4)
         = f(n - 3) + f(n - 4) + f(n - 3) + f(n - 3) + f(n - 5) + f(n - 6)
         = 3f(n - 3) + (f(n - 4) + f(n - 5)) + f(n - 6)
         = 3f(n - 3) +        f(n - 3)       + f(n - 6)
         = 4f(n - 3) + f(n - 6)

Then e(n) = f(3n - 1)
          = 4f((3n - 1) - 3) + f((3n - 1) - 6)
          = 4f(3n - 4) + f(3n - 7)
          = 4f(3n - 3 - 1) + f(3n - 6 - 1)
          = 4f(3(n - 1) - 1) + f(3(n - 2) - 1)
          = 4e(n - 1) + e(n - 2)
=#


function evenfibonacci(n::Int, basecase=(2, 8))
    if n < 1
        return nothing
    end
    if n <= 2
        return basecase[n]
    end
    en1 = basecase[1]
    en2 = basecase[2]
    sum = 0
    for current = 3:n
        sum = (4 * en2) + en1
        en1 = en2
        en2 = sum
    end
    return sum
end


function sum_evenfibonaccilessthan(bound::Int, basecase=(2, 8))
    sum = 0
    n = 1
    e = evenfibonacci(n, basecase)
    while e < bound
        sum += e
        n += 1
        e = evenfibonacci(n, basecase)
    end
    return sum
end


@show sum_evenfibonaccilessthan(4_000_000 + 1)
