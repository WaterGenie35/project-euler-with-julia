function ispythagoreantriplet(a::Int, b::Int, c::Int)
    return (a^2 + b^2) == c^2
end


function pythagoreantriplet_sumto(n::Int)
    for a in 1:998
        for b in a:998
            c = (n - a) - b
            if ispythagoreantriplet(a, b, c)
                return (a, b, c)
            end
        end
    end
end


@show prod(pythagoreantriplet_sumto(1000))
