# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 19.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 1.c) Wyznaczenie wartości MAX dla zadanych arytmetyk
# x- typ arytmetyki (może być Float16, Float32, Float64)


function max_calculation(x)
    max = x(1.0)
    while !isinf(max * x(2.0)) #funkcja isinf określa, czy argument jest nieskończonością
        max = x(2.0)*max
    end
    max = (x(2.0) - eps(x))*max
    return max
end

println("Max dla Float16: ", floatmax(Float16))
println("Wyznaczona wartość MAX dla Float16: ", max_calculation(Float16), "\n")

println("Max dla Float32: ", floatmax(Float32))
println("Wyznaczona wartość MAX dla Float32:", max_calculation(Float32), "\n")

println("Max dla Float64:", floatmax(Float64))
println("Wyznaczona wartość MAX dla Float64:", max_calculation(Float64), "\n")


