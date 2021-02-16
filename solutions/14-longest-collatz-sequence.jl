function collatzsequence_length(n::Int, memory::Dict{Int, Int}=Dict{Int, Int}())
    if haskey(memory, n)
        return memory[n]
    end
    if (n % 2) == 0
        result = 1 + collatzsequence_length(Int(n / 2), memory)
    else
        result = 1 + collatzsequence_length((3 * n) + 1, memory)
    end
    memory[n] = result
    return result
end


function max_collatzsequence_length_lessthan(bound::Int, memory::Dict{Int, Int}=Dict{Int, Int}())
    max_length = 1
    max_start = 1
    for n in 2:(bound - 1)
        new_length = collatzsequence_length(n, memory)
        if new_length > max_length
            max_start = n
            max_length = new_length
        end
    end
    return max_start
end


memory = Dict{Int, Int}()
memory[1] = 1
@show collatzsequence_length(13, memory)
@show max_collatzsequence_length_lessthan(1_000_000, memory)
