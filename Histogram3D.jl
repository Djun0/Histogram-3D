using GLMakie
function histogram3D(x, y, n)
    x, y, z = peakss(x, y, n)
    δx = (x[2] - x[1]) / 2
    δy = (y[2] - y[1]) / 2
    fig = Figure(size=(2000, 1600), fontsize=30,px_per_unit = 2)
    ax2 = Axis3(fig[1, 1]; aspect=(1, 1, 1), perspectiveness=0.5,xlabel=L"X_0",ylabel=L"X_1",zlabel="Số mẫu",zlabelposition[] = (0.5, 1.1))
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
