# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 09.11.2019r.

# Obliczenia naukowe Lista 2., Zadanie 6. Iteracja funkcji kwadratowej

#Funkcja, która oblicza rekurencyjne równanie xn+1 = xn^2 + c. x0 to wartość x, n - liczba iteracji, c - wartosc c
function obliczRekurencyjnie(x0, n, c)
    if n == 0 return x0
      else 
        x = obliczRekurencyjnie(x0, n-1, c)
        return (x^2 + c)
      end
end

Y = zeros(40)

# c = -2, x0 = 1
println("----------------Dane nr 1.------------------")
for i = 1:40
  Y[i] = obliczRekurencyjnie(Float64(1), i, Float64(-2))
  println("$(Y[i])")
end



# c = -2, x0 = 2
println("----------------Dane nr 2.------------------")
for i = 1:40
  Y[i] = obliczRekurencyjnie(Float64(2), i, Float64(-2))
  println("$(Y[i])")
end


# c = -2, x0 = 1.99999999999999
println("----------------Dane nr 3.------------------")
for i = 1:40
  Y[i] = obliczRekurencyjnie(Float64(1.99999999999999), i, Float64(-2))
  println("$(Y[i])")
end

# c = -1, x0 = 1
println("----------------Dane nr 4.------------------")
for i = 1:40
  Y[i] = obliczRekurencyjnie(Float64(1), i, Float64(-1))
  println("$(Y[i])")
end


# c = -1, x0 = -1
println("----------------Dane nr 5.------------------")
for i = 1:40
  Y[i] = obliczRekurencyjnie(Float64(-1), i, Float64(-1))
  println("$(Y[i])")
end


# c = -1, x0 = 0.75
println("----------------Dane nr 6.------------------")
for i = 1:40
  Y[i] = obliczRekurencyjnie(Float64(0.75), i, Float64(-1))
  println("$(Y[i])")
end


# c = -1, x0 = 0.25
println("----------------Dane nr 7.------------------")
for i = 1:40
  Y[i] = obliczRekurencyjnie(Float64(0.25), i, Float64(-1))
  println("$(Y[i])")
end
