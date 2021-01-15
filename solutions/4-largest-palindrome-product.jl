

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


function maxpalindromeproduct(digit::Int=3)
    maxsofar = typemin(Int)

    digit_max = (10^digit) - 1
    digit_min = 10^(digit - 1)
    for m1 in digit_max:-1:digit_min
        for m2 in m1:-1:digit_min
            product = m1 * m2
            if m1 == m2 && product < maxsofar
                @goto break_outer
            end
            if ispalindrome(product) && product > maxsofar
                maxsofar = product
            end
        end
    end
    @label break_outer

    if maxsofar == typemin(Int)
        return nothing
    end
    return maxsofar
end


@show maxpalindromeproduct(2)
@show maxpalindromeproduct(3)
