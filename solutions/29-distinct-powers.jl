function distinctpowers(base_range, power_range)
    results = []
    base_min, base_max = base_range
    power_min, power_max = power_range
    for base in base_min:base_max, power in power_min:power_max
        result = big(base) ^ power
        if !(result in results)
            push!(results, result)
        end
    end
    return results
end


@show distinctpowers((2, 5), (2, 5))
@show length(distinctpowers((2, 100), (2, 100)))
