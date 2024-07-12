using GLMakie,Random

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
function peakss(x,y, n=49)  
    xmin=0
    xmax=1
    ymin=0
    ymax=1
    x1 = range(xmin, xmax, n)
    y1 = range(xmin, xmax, n)
    x_min, x_max =0, 1
    y_min, y_max = 0, 1
    return (x1, y1, count_points_in_grid(shuffle!(x),shuffle!(y) , n,xmin, xmax, ymin, ymax))
end
function count_points_in_grid(x_coords, y_coords,n, x_min=0, x_max=1, y_min=0, y_max=1)
    # Kiểm tra xem x_coords và y_coords có cùng độ dài không
    @assert length(x_coords) == length(y_coords)

    # Tính độ dài của mỗi ô vuông trên các trục x và y
    x_step = (x_max - x_min) / n
    y_step = (y_max - y_min) / n

    # Tạo một ma trận đếm số lượng điểm, kích thước n x n
    counts = zeros(Int, n, n)
    ycop=range(start=y_min, stop=y_max, length=length(y_coords))
xcop=range(start=x_min, stop=x_max, length=length(y_coords))
    for k in 1:length(x_coords)
        x, y = x_coords[k], y_coords[k]
        #sua doi cho vegas
        x1,y2= xcop[k], ycop[k]
        # Tính chỉ số của ô vuông mà điểm (x, y) thuộc vào
        i = clamp(floor(Int, (x - x_min) / x_step) + 1, 1, n)
        j = clamp(floor(Int, (y - y_min) / y_step) + 1, 1, n)
        counts[i, j] += 1
    end
    return counts
end
function histogram3D(x, y, n)
    x, y, z = peakss(x, y, n)
    δx = (x[2] - x[1]) / 2
    δy = (y[2] - y[1]) / 2
    fig = Figure(size=(2000, 1600), fontsize=30,px_per_unit = 2)
    ax2 = Axis3(fig[1, 1]; aspect=(1, 1, 1), perspectiveness=0.5,xlabel=L"X_0",ylabel=L"X_1",zlabel="Sample")
    rectMesh = Rect3f(Vec3f(-0.5, -0.5, 0), Vec3f(1, 1, 1))
    meshscatter!(ax2, x, y, 0 * z; marker=rectMesh, color=:cyan,
        markersize=Vec3f.(2δx, 2δy, z[:]),
        shading=MultiLightShading, transparency=false)
    for (idx, i) in enumerate(x)
        for (idy, j) in enumerate(y)
            rectMesh = Rect3f(Vec3f(i - δx, j - δy, 0), Vec3f(2δx, 2δy, z[idx, idy]))
            recmesh = GeometryBasics.mesh(rectMesh)
            lines!(ax2, recmesh, color=:black, linewidth=0.5)
        end
    end
    fig
end
