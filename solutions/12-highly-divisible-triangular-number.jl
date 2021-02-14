using Utility


function triangular_numdivisorsgreaterthan(d::Int)
    numdivisors = 1
    triangular_number = 1
    n = 2
    while (numdivisors <= d)
        triangular_number += n
        n += 1
        factors = factorsof(triangular_number)
        numdivisors = length(factors)
    end
    return triangular_number
end


@show triangular_numdivisorsgreaterthan(5)
@show triangular_numdivisorsgreaterthan(500)
