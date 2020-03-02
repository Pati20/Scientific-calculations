# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 20.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 5. Iloczyn skalarny


## Funkcja, która oblicza iloczyn dla poszczególnych wektorów x, y, zaczynając od ich ostatnich współrzędnych.
## parametr x to pierwszy wektor
## parametr y to drugi wektor
function wTyl(x, y)
    T = typeof(x[1])
    iloczyn = T(0.0)
    l = length(x)
    for i in l:-1:1
        iloczyn += x[i] * y[i]
    end
    iloczyn
end

## Funkcja, która oblicza iloczyn dla poszczególnych wektorów x,y, zaczynając od ich pierwszych współrzędnych.
## parametr x to pierwszy wektor
## parametr y to drugi wektor
function wPrzod(x, y)
    T = typeof(x[1])
    iloczyn = T(0)
    l = length(x)
    for i in 1:l
        iloczyn += x[i] * y[i]
    end
    iloczyn
end

## Funkcja, która oblicza iloczyny i rozdziela je na 2 listy - dodatnie i ujemne
## parametr x to pierwszy wektor
## parametr y to drugi wektor
## zwraca krotke dwoch list - ujemne produkty i dodatnie

function coords_iloczyny(x, y)
    T = typeof(x[1])
    l = length(x)
    neg = T[]
    pos = T[]
    for i in 1:l
        p = x[i] * y[i]
        if p < 0
            push!(neg, p)
        else
            push!(pos, p)
        end
    end
    neg, pos
end


## Funkcja, ktora oblicza iloczyn dla danych wektorów a i b. Pierwszy produkty kolejnych wspołrzednych sa obliczane a potem ujemne wartosci są sumowane rosnąco, a dodatnie wartości są sumowane w kolejności malejącej i w koncu te dwie sumy są dodawane.
## parametr x to pierwszy wektor
## parametr y to drugi wektor

function malejacy(x, y)
    T = typeof(x[1])
    iloczyn = T(0)
    l = length(x)
    ps_neg, ps_pos = coords_iloczyny(x, y)
    sort!(ps_neg)
    sort!(ps_pos, rev=true)
    neg = T(0)
    pos = T(0)
    for k in ps_neg
        neg += k
    end
    for j in ps_pos
        pos += j
    end
    neg + pos
end


## Funkcja, ktora oblicza iloczyn dla danych wektorów a i b. Pierwszy produkty kolejnych wspołrzednych sa obliczane a potem ujemne wartosci są sumowane malejąco, a dodatnie wartości są sumowane w kolejności rosnącej i w koncu te dwie sumy są dodawane.
## parametr x to pierwszy wektor
## parametr y to drugi wektor

function rosnacy(x, y)
    T = typeof(x[1])
    iloczyn = T(0)
    l = length(x)
    ps_neg, ps_pos = coords_iloczyny(x, y)
    sort!(ps_neg, rev=true)
    sort!(ps_pos)
    neg = T(0)
    pos = T(0)

    for k in ps_neg
        neg += k
    end

    for j in ps_pos
        pos += j
    end
    neg + pos
end

x = Float64[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = Float64[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println("Iloczyn skalarny wektorów x · y w FLOAT64")
println("a) daje wynik: ", wPrzod(x,y))
println("b) daje wynik: ", wTyl(x,y))
println("c) daje wynik: ", malejacy(x,y))
println("d) daje wynik: ", rosnacy(x,y))
println()

x = Float32[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = Float32[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println("Iloczyn skalarny wektorów x · y w FLOAT32")
println("a) daje wynik: ", wPrzod(x,y))
println("b) daje wynik: ", wTyl(x,y))
println("c) daje wynik: ", malejacy(x,y))
println("d) daje wynik:", rosnacy(x,y))
