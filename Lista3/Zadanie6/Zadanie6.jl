# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 24.11.2019r.

# Obliczenia naukowe, lista 3. Zadanie 6. Miejsca zerowe funkcji f_1(x) = e^(1-x) - 1 oraz f_2(x) = xe^(-x).

include("./module.jl");
using .ComputingLinearEquations

f1(x) = exp.(1.0 - x) - 1.0
f2(x) = x * exp.(-x)
pf1(x) = -exp.(1.0 - x)
pf2(x) = -exp.(-x) * (x - 1.0)
delta = Float64(1.0 / 10.0^5)
epsilon = delta
maxit = 1000

######################## METODA BISEKCJI #########################################
println("f1 - Metoda bisekcji")
przedzialy = [(0.0, 2.0), (-2.0, 2.0), (0.1, 1.8), (0.1, 1.2), (-0.2, 1.8), (-5.0, 500.0)]

for iv in przedzialy
    (r, v, it, err) = mbisekcji(f1, iv[1], iv[2], delta, epsilon)
    println((r, v, it, err))
end

println("f2 - Metoda bisekcji")
przedzialy = [(-0.5, 0.5), (-0.7, 0.4), (-10.0, 100.)]

for iv in przedzialy
    (r, v, it, err) = mbisekcji(f2, iv[1], iv[2], delta, epsilon)
    println((r, v, it, err))
end
######################## METODA NEWTONA ###########################################

println("f1 - Metoda Newtona")
starts = [-1.0, 0.0, 1.1, 2.0, 6.0, 8.0, 15.00]

for s in starts
    (r, v, it, err) = mstycznych(f1, pf1, s, delta, epsilon, maxit)
    println((r, v, it, err))
end

println("f2 - Metoda Newtona")
starts = [-1.0, -0.4, 0.0, 1.0, 6.0, 8.0, 15.00]

for s in starts
    (r, v, it, err) = mstycznych(f2, pf2, s, delta, epsilon, maxit)
    println((r, v, it, err))
end

######################## METODA SIECZNYCH ################################################
println("f1 - Metoda siecznych")
starts = [(-2.0, 2.0), (-0.3, 1.8), (0.1, 1.3), (-2.0, 6.0), (-10.0, 10.0), (10.0, 100.0)]
for s in starts
    (r, v, it, err) = msiecznych(f1, s[1], s[2], delta, epsilon, maxit)
    println((r, v, it, err))
end

println("f2 - Metoda siecznych")
starts = [(-2.0, 2.0), (-0.3, 1.8), (0.1, 1.3), (-2.0, 6.0), (-10.0, 10.0), (10.0, 100.0)]
for s in starts
    (r, v, it, err) = msiecznych(f2, s[1], s[2], delta, epsilon, maxit)
    println((r, v, it, err))
end
#########################################################################################