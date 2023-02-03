function powerdigitsum(power::Int)
    current_power = 1
    digit_sum = 2
    num = [2]
    while current_power < power
        current_power += 1
        digit_sum = 0
        i = 1
        carry = 0
        while i <= length(num)
            digit = num[i]
            digit_doubled = 2 * digit
            new_digit = (digit_doubled % 10) + carry
            digit_sum += new_digit
            num[i] = new_digit

            carry = digit_doubled ÷ 10
            i += 1
        end
        if carry > 0
            append!(num, carry)
            digit_sum += carry
        end
    end
    return digit_sum
end

@show powerdigitsum(15)
@show powerdigitsum(1_000)
