# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 20.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 6. Przybliżenie funkcji

# Funkcja obliczająca 10 kolejnych wartości funkcji f(x) oraz g(x) zdefiniowanych w poleceniu zadania 6. Ale także kilka dalszych wartości

x = 10
for i = 1 : x
    a = Float64(8)^(-i)
    f = sqrt(a^2 + 1) - 1
    g = a^2 / (sqrt(a^2 + 1) + 1)
    
    println("x = 8^$(i)")
    println("f(x) = $f")
    println("g(x) = $g\n")
end

x2 = 179
for j = 178 : x2
    a = Float64(8)^(-j)
    f = sqrt(a^2 + 1) - 1
    g = a^2 / (sqrt(a^2 + 1) + 1)
    
    println("x= 8^$(j)")
    println("f(x) = $f")
    println("g(x) = $g\n")
end


