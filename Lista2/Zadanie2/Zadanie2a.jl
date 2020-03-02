# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 08.11.2019r.

# Obliczenia naukowe Lista 2., Zadanie 2a. Wykres funkcji

import Pkg;
Pkg.add("Plots")
Pkg.build("Plots")
Pkg.add("SymPy")
Pkg.build("SymPy")

using SymPy
using Plots
plotly()
T = Float64
f(x) = (T(T(exp(x))*(T(log(T(1) + T(exp(-x)))))))
x = symbols("x")
#wykres = plot(f, -30, 50,legend=false)
wykres = plot(f, 31, 38,legend=false)
display(wykres)

