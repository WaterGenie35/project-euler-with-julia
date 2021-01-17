@show sum((1:10).^2)
@show sum(1:10)^2
@show abs(sum((1:10).^2) - sum(1:10)^2)

@show abs(sum((1:100).^2) - sum(1:100)^2)
