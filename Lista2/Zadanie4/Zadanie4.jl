# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 09.11.2019r.

# Obliczenia naukowe Lista 2., Zadanie 4. Złośliwy wielomian Wilkinsona

import Pkg
Pkg.add("Polynomials")
Pkg.build("Polynomials")
using Polynomials

wspolczynniki = reverse(Float64[1, -210.0, 20615.0,-1256850.0, 53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0, 1307535010540395.0, -10142299865511450.0, 63030812099294896.0,
      -311333643161390640.0, 1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0,
      -12870931245150988800.0, 13803759753640704000.0, -8752948036761600000.0, 2432902008176640000.0])

P = Poly(wspolczynniki) #wielomian utowrzony z podanych współczynników
pierwiastki_P = (roots(P))
println("Obliczone pierwiastki wielomianu P(x): ", pierwiastki_P)
p = poly([1.0:20.0;]) #wielomian stworzony z tablicy zawierającej miejsca zerowe

for i in 1:20
      zk = pierwiastki_P[i]
      Pzk = abs(polyval(P, zk))
      pzk = abs(polyval(p, zk))
      n = abs(zk - i)
      println("$i & $zk & $Pzk & $pzk & $n \\")
end

wspolczynniki[20] = Float64(-210.0 - (1/2)^(23))
P = Poly(wspolczynniki)
pierwiastki_P = (roots(P))

println("Obliczenia dla wielomianu z zaburzonym współczynnikiem przy x^19: ", wspolczynniki[20])

for i in 1:20
      zk = pierwiastki_P[i]
      Pzk = abs(polyval(P, zk))
      pzk = abs(polyval(p, zk))
      n = abs(zk - i)
      println("$i & $zk & $Pzk & $pzk & $n \\")
end