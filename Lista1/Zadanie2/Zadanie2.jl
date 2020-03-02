# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 19.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 2. Eksperymentalne sprawdzenie słuszności stwierdzenia Kahana

println("Epsilon maszynowy Kahana dla Float16: ", Float16(3.0 * Float16( (Float16(4.0)/Float16(3.0) )-Float16(1.0) )) - Float16(1.0) )
println("Macheps dla Float16: ", eps(Float16), "\n")
println("Epsilon maszynowy Kahana dla Float32: ", Float32(3.0 * Float32( (Float32(4.0)/Float32(3.0) )-Float32(1.0) )) - Float32(1.0) )
println("Macheps dla Float32: ", eps(Float32), "\n")
println("Epsilon maszynowy Kahana dla Float64: ", Float64(3.0 * Float64( (Float64(4.0)/Float64(3.0) )-Float64(1.0) )) - Float64(1.0) )
println("Macheps dla Float64: ", eps(Float64), "\n")
