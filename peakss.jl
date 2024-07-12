
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
