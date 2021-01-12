

function multipleof(n::Int, base::Int)
    return (n % base) == 0
end


function multipleof_or(n::Int, bases::Int...)
    return any(multipleof.(n, bases))
end


function arg_multipleof_or(n::Int, bases::Int...)
    if multipleof_or(n, bases...)
        return n
    else
        return 0
    end
end


@show sum(arg_multipleof_or.(1:999, 3, 5))
