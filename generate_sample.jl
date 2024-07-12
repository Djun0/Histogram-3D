function generate_random_between_intervals(arr::Vector{Float64}, n::Int)
    if length(arr) < 2
        return Float64[]
    end
    random_numbers = Float64[]

    for i in 1:(length(arr) - 1)
        lower_bound = arr[i]
        upper_bound = arr[i + 1]
        for _ in 1:n
            random_number = rand(Uniform(lower_bound, upper_bound))
            push!(random_numbers, random_number)
        end
    end
    return random_numbers
end
