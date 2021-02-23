function eigensumofdigitspowers(power::Int, digitrange)
    values = []
    min_digit, max_digit = digitrange
    min_value = 10 ^ (min_digit - 1)
    max_value = (10 ^ max_digit) - 1
    for value in min_value:max_value
        if sum(digits(value) .^ power) == value
            push!(values, value)
        end
    end
    return values
end


@show sum(eigensumofdigitspowers(4, (4, 4)))
@show sum(eigensumofdigitspowers(5, (4, 6)))
