# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 20.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 7. Przybliżenie wartości pochodnej

# Funkcja, której definicja zotała podana w treści zadania. 
function f(x)
    return sin(x) + cos(3x)
end

#Funkcja, ktora zwraca przyblizona pochodna w punkci x0 z dostarczanym parametrem h
function przyblizona_pochodna(x, h)
    return (f(x + h) - f(x)) / h
end

#Funkcja, ktora zwraca przybliżoną wartość pochodnej funkcji f w punkcie x
#h - wartość ulatwijaca przybliżenie pochodnej
function pochodna(x)
    return cos(x) - 3sin(3x)
end

#Funkcja, która oblicza błąd przybliżonej wartości pochodnej.

function blad(przyblizona_pochodna, pochodna)
    return abs(pochodna - przyblizona_pochodna)
end

x = Float64(1)

for n in 0:54
    h = Float64(1/2)^n
    d = pochodna(Float64(1.0))
    pp = przyblizona_pochodna(Float64(1.0), h)
    e = blad(d, pp)
    println("{", n, "} & ", pp, " & ", e, " & ", Float64(1) + h, " \\\\")
end
