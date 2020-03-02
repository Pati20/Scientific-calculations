# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 08.11.2019r.

# Obliczenia naukowe Lista 2., Zadanie 1. Iloczyn skalarny (powtórzenie zadania 5. z listy 1.)

# Poniższe funkcje obliczają iloczyn dla poszczególnych wektorów. X i Y to dane wektory. Algorytm A zaczyna od ich pierwszych współrzędnych, algorytm B od ostatnich.
# Algorytm C działa tak, że produkty kolejnych wspołrzednych sa obliczane w funkcji rozdziel_iloczyny, a potem ujemne wartosci są sumowane rosnąco, a dodatnie wartości są sumowane malejąco i w koncu te dwie sumy są dodawane. 
# Algorytm D różni się od C tym, że ujemne wartosci są sumowane malejąco, a dodatnie wartości są sumowane rosnąco.

function algorytm_A(x, y)
    T = typeof(x[1])
    iloczyn = T(0)
    dl = length(x)
    for k in 1:dl
        iloczyn += x[k] * y[k]
    end
    iloczyn
end

function algorytm_B(x, y)
    T = typeof(x[1])
    iloczyn = T(0.0)
    dl = length(x)
    for k in dl:-1:1
        iloczyn += x[k] * y[k]
    end
    iloczyn
end

function rozdziel_iloczyny(x, y)
    T = typeof(x[1])
    dl = length(x)
    ujemne = T[]
    dodatnie = T[]
    for k in 1:dl
        p = x[k] * y[k]
        if p < 0
            push!(ujemne, p)
        else
            push!(dodatnie, p)
        end
    end
    ujemne, dodatnie
end

function algorytm_C(x, y)
    T = typeof(x[1])
    iloczyn = T(0)
    dl = length(x)
    ujemne, dodatnie = rozdziel_iloczyny(x, y)
    sort!(ujemne)
    sort!(dodatnie, rev=true)
    uj = T(0)
    dod = T(0)
    for k in ujemne
        uj += k
    end
    for j in dodatnie
        dod += j
    end
    uj + dod
end

function algorytm_D(x, y)
    T = typeof(x[1])
    iloczyn = T(0)
    dl = length(x)
    ujemne, dodatnie = rozdziel_iloczyny(x, y)
    sort!(ujemne, rev=true)
    sort!(dodatnie)
    uj = T(0)
    dod = T(0)

    for k in ujemne
        uj += k
    end

    for j in dodatnie
        dod += j
    end
    uj + dod
end

x = Float64[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = Float64[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println("Iloczyn skalarny wektorów X·Y w FLOAT64")
println("a) wynik: ", algorytm_A(x,y))
println("b) wynik: ", algorytm_B(x,y))
println("c) wynik: ", algorytm_C(x,y))
println("d) wynik: ", algorytm_D(x,y))
println()

x = Float32[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = Float32[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println("Iloczyn skalarny wektorów X·Y w FLOAT32")
println("a) wynik: ", algorytm_A(x,y))
println("b) wynik: ", algorytm_B(x,y))
println("c) wynik: ", algorytm_C(x,y))
println("d) wynik: ", algorytm_D(x,y))
println()

x2 = Float64[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = Float64[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println("Iloczyn skalarny wektorów X'· Y w FLOAT64")
println("a) wynik: ", algorytm_A(x2,y))
println("b) wynik: ", algorytm_B(x2,y))
println("c) wynik: ", algorytm_C(x2,y))
println("d) wynik: ", algorytm_D(x2,y))
println()

x2 = Float32[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.301029995]
y = Float32[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.00018504]

println("Iloczyn skalarny wektorów X'· Y w FLOAT32")
println("a) wynik: ", algorytm_A(x2,y))
println("b) wynik: ", algorytm_B(x2,y))
println("c) wynik: ", algorytm_C(x2,y))
println("d) wynik: ", algorytm_D(x2,y))
