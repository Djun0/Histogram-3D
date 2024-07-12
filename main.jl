f(x)=x[2]^2/((x[1]-0.5)^2+10^-10)+x[1]^2/((x[2]-0.5)^2+10^-10)
global v = vegas(f, zeros(2), fill(1.0, 2),ncalls = 100000,nbins=1000, maxiter =20)
println("----------------------------------")
println(v.integral_estimate)
println(v.standard_deviation)
println(v.chi_squared_average)
x1, x2 = 0, 1         
global n = 100  # số lượng số ngẫu nhiên cần sinh ra giữa mỗi khoảng
global sample1 = generate_random_between_intervals(v.adaptive_grid[:,1], n)
global sample2 = generate_random_between_intervals(v.adaptive_grid[:,2], n)
n=25
global A=histogram_or_bars_in_3d((sample1),(sample2),n)
display(A)
