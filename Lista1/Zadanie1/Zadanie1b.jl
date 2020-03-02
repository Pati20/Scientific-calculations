# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 19.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 1.b) Wyznaczenie wartości eta dla zadanych arytmetyk
# x- typ arytmetyki (może być Float16, Float32, Float64)


function eta_calculation(x)
    eta = x(1.0)

    while eta / x(2.0) != x(0.0)
        eta /= x(2.0)
    end

    return eta
end

println("Eta dla Float16: ", nextfloat(Float16(0.0)))
println("Wyznaczona eta dla Float16: ", eta_calculation(Float16), "\n")

println("Eta dla Float32: ", nextfloat(Float32(0.0)))
println("Wyznaczona eta dla Float32: ", eta_calculation(Float32), "\n")

println("Eta dla Float64: ", nextfloat(Float64(0.0)))
println("Wyznaczona eta dla Float64 ", eta_calculation(Float64), "\n")


