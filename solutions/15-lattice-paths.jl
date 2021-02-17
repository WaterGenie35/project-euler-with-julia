function num_latticepaths(gridwidth::Int, gridheight::Int)
    #=
    Note that for any given intersection, the number of paths from
    the top-left to that intersection is the sum of the number of paths
    from the top and left intersections.
    For intersections along the top or left edges, the number of paths are 1.
    =#
    num_paths = fill(1, gridwidth + 1)
    for i in 1:gridheight, j in 1:(gridwidth + 1)
        if j == 1
            continue
        end
        num_paths[j] = num_paths[j] + num_paths[j - 1]
    end
    return last(num_paths)
end


@show num_latticepaths(2, 2)
@show num_latticepaths(20, 20)
