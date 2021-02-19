word_lengths = Dict(
        1 => 3,     # one
        2 => 3,     # two
        3 => 5,     # three
        4 => 4,     # four
        5 => 4,     # five
        6 => 3,     # six
        7 => 5,     # seven
        8 => 5,     # eight
        9 => 4,     # nine
        10 => 3,    # ten
        11 => 6,    # eleven
        12 => 6,    # twelve
        13 => 8,    # thirteen
        14 => 8,    # fourteen
        15 => 7,    # fifteen
        16 => 7,    # sixteen
        17 => 9,    # seventeen
        18 => 8,    # eighteen
        19 => 8,    # nineteen
        20 => 6,    # twenty
        30 => 6,    # thirty
        40 => 5,    # forty
        50 => 5,    # fifty
        60 => 5,    # sixty
        70 => 7,    # seventy
        80 => 6,    # eighty
        90 => 6,    # ninety
        100 => 7,   # hundred
        1000 => 8,  # thousand
        0 => 0,     # for 0 in the ones digit
)


function word_length(number::Int)
    if number <= 20
        return word_lengths[number]
    end
    if number < 100
        tens = 10 * div(number, 10)
        ones = rem(number, 10)
        return word_lengths[tens] + word_lengths[ones]
    end
    if number < 1000
        hundredth_digit = div(number, 100)
        firsttwo_digits = rem(number, 100)
        hundred_length = word_lengths[hundredth_digit] + word_lengths[100]
        if firsttwo_digits == 0
            return hundred_length
        else
            return hundred_length + 3 + word_length(firsttwo_digits)
        end
    end
    return word_lengths[1] + word_lengths[1000]
end


@show word_length(342)
@show word_length(115)
@show sum(word_length.(1:1000))
