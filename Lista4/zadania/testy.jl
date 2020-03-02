# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 08.12.2019r.

# Obliczenia naukowe, lista 4. Testy do zadań 1-4.
include("./moduleZadania1-4.jl");
using Test

############################# TESTY DLA ZADANIA 1 ###################################
x1 = [3.0, 1.0, 5.0, 6.0]
f1 = [1.0, -3.0, 2.0, 4.0]
x2 = [-1.0, 0.0, 1.0, 2.0, 3.0]
f2 = [2.0, 1.0, 2.0, -7.0, 10.0]
oczekiwanyWynik1 = [1.0, 2.0, -3.0 / 8.0, 7.0 / 40.0]
oczekiwanyWynik2 = [2.0, -1.0, 1.0, -2.0, 2.0]

@testset "Testy do zadania 1:" begin
    @test isapprox(PolynomialInterpolation.ilorazyRoznicowe(x1, f1), oczekiwanyWynik1)
    @test isapprox(PolynomialInterpolation.ilorazyRoznicowe(x2, f2), oczekiwanyWynik2)
end

############################# TEST DLA ZADANIA 2 ######################################
fx2 = PolynomialInterpolation.ilorazyRoznicowe(x2, f2)
@testset "Test do zadania 2:" begin
    @test isapprox(PolynomialInterpolation.warNewton(x2, fx2, 5.0), 506.0)
    @test isapprox(PolynomialInterpolation.warNewton(x2, fx2, -3.0), 298.0)
end

############################# TESTY DLA ZADANIA 3 #####################################
oczekiwanyWynik3 = [1.0, 6.0, -1.0, -6.0, 2.0]
@testset "Test do zadania 3:" begin
    @test isapprox(PolynomialInterpolation.naturalna(x2, fx2), oczekiwanyWynik3)
end