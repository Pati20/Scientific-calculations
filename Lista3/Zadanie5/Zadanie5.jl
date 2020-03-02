# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 24.11.2019r.

# Obliczenia naukowe, lista 3. Zadanie 5. przecięcie wykresów funkcji y=3x oraz y = e^x.
include("./module.jl");
using .ComputingLinearEquations

function Zadanie5()

  println("[0; 1]")
  result = mbisekcji(x -> 3*x - exp(x), 0.0, 1.0, 10.0^(-4), 10.0^(-4))
  println(result)

  println("[0.5; 0.65]")
  result = mbisekcji(x -> 3*x - exp(x), 0.5, 0.65, 10.0^(-4), 10.0^(-4))
  println(result)

  println("[1; 2]")
  result = mbisekcji(x -> 3*x - exp(x), 1.0, 2.0, 10.0^(-4), 10.0^(-4))
  println(result)

  println("[1.5; 1.8]")
  result = mbisekcji(x -> 3*x - exp(x), 1.5, 1.8, 10.0^(-4), 10.0^(-4))
  println(result)

  println("[0; 2]")
  result = mbisekcji(x -> 3*x - exp(x), 0.0, 2.0, 10.0^(-4), 10.0^(-4))
  println(result)
end

Zadanie5()