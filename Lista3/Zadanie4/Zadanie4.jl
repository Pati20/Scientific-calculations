# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 24.11.2019r.

# Obliczenia naukowe, lista 3. Zadanie 4. Wyznaczenie pierwiastku równania sinx - (1/2x)^2 = 0
include("./module.jl");
using .ComputingLinearEquations

function Zadanie4()
  println("Metoda bisekcji: ")
  result = mbisekcji(x -> sin(x) - (x/2)^(2), 1.5, 2.0, 0.5*10.0^(-5), 0.5*10.0^(-5))
  println(result)

  println("Metoda Newtona: ")
  result = mstycznych(x -> sin(x) - (x/2)^(2), x-> cos(x) - x/2,  1.5, 0.5*10.0^(-5), 0.5*10.0^(-5), 50)
  println(result)

  println("Metoda siecznych:")
  result = msiecznych(x -> sin(x) - (0.5 * x)^2, 1.0, 2.0, 0.5 * 10.0^(-5), 0.5 * 10.0^(-5), 50)
  println(result)

end
Zadanie4()