# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 08.11.2019r.

# Obliczenia naukowe Lista 2., Zadanie 2. Obliczanie granicy funkcji

import Pkg;
Pkg.build("SpecialFunctions")
Pkg.add("SymPy")
Pkg.add("PyCall")
Pkg.build("PyCall")
using SymPy
using Plots

f(x) = (exp(x)*(log(1 + exp(-x))))
x = symbols("x")
println("Wartość granicy funkcji f(x): ",limit(f(x), x => oo))
