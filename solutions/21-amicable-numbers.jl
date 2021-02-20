using Utility

# Note that there may be amicable numbers less than 10,000 whose
# amicable pair is greater than 10,000.

function amicables_lessthan(n::Int)
    amicables = []
    for i in 1:(n - 1)
        if i in amicables
            continue
        end
        sum_properdivisorsof_i = sum(factorsof(i)) - i
        pair = sum_properdivisorsof_i
        sum_properdivisorsof_pair = sum(factorsof(pair)) - pair
        if (sum_properdivisorsof_pair == i) && (i != pair)
            push!(amicables, i)
            if pair < n
                push!(amicables, pair)
            end
        end
    end
    return amicables
end


@show 220 in amicables_lessthan(221)
@show 284 in amicables_lessthan(285)
@show sum(amicables_lessthan(10_000))
