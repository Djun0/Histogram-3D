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
