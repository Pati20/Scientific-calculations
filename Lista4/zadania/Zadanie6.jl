# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 08.12.2019r.

# Obliczenia naukowe, lista 4. Zadanie 6. Przetestować funkcję rysujNnfx(f,a,b,n)
# na następujących przykładach (zjawisko rozbieżności).

include("./moduleZadania1-4.jl");
using .PolynomialInterpolation

# x -> abs(x) [-1.0, 1.0] dla n = 5, 10, 15
rysujNnfx(x -> abs(x), -1.0, 1.0, 5)
rysujNnfx(x -> abs(x), -1.0, 1.0, 10)
rysujNnfx(x -> abs(x), -1.0, 1.0, 15)

# x -> 1/(1+x^2) [-5.0, 5.0] dla n = 5, 10, 15
rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 5)
rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 10)
rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 15)