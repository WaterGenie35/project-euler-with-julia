

function divisibleby_lessthan(n::Int, d::Int)
    for i in d:-1:2
        if (n % i) != 0
            return false
        end
    end
    return true
end


function smallestcommonmultiple(d::Int)
    n = d
    while !divisibleby_lessthan(n, d)
        n += d
    end
    return n
end


@show divisibleby_lessthan(2520, 10)
@show smallestcommonmultiple(10)
@show smallestcommonmultiple(20)
