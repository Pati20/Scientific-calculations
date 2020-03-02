# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 19.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 1.a) Wyznaczenie wartości epsilonu maszynowego dla zadanych arytmetyk
# x- typ arytmetyki (może być Float16, Float32, Float64)

function macheps_calculation(x)
    macheps = x(1.0)

    while (x(1.0) + macheps/x(2.0)) > x(1.0)
        macheps = macheps/(x(2.0))
    end

    return macheps
end

println("Macheps zwracany przez eps(Float16): ", eps(Float16))
println("Wyznaczony macheps dla Float16: ", macheps_calculation(Float16), "\n")

println("Macheps zwracany przez eps(Float32): ", eps(Float32))
println("Wyznaczony macheps dla Float32: ", macheps_calculation(Float32), "\n")

println("Macheps zwracany przez eps(Float64): ", eps(Float64))
println("Wyznaczony macheps dla Float32: ", macheps_calculation(Float64), "\n")


