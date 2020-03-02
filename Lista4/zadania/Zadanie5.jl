# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 08.12.2019r.

# Obliczenia naukowe, lista 4. Zadanie 5. Przetestować funkcję rysujNnfx(f,a,b,n) na podanych przykładach.

include("./moduleZadania1-4.jl");
using .PolynomialInterpolation
 # e^x [0.0, 1.0] dla n = 5, 10, 15
rysujNnfx(x -> exp(x), 0.0, 1.0, 5)
rysujNnfx(x -> exp(x), 0.0, 1.0, 10)
rysujNnfx(x -> exp(x), 0.0, 1.0, 15)

# x^2*sin(x) [-1.0, 1.0] dla n = 5, 10, 15
rysujNnfx(x -> x^2*sin(x), -1.0, 1.0, 5)
rysujNnfx(x -> x^2*sin(x), -1.0, 1.0, 10)
rysujNnfx(x -> x^2*sin(x), -1.0, 1.0, 15)