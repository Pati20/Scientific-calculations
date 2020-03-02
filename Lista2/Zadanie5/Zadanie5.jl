# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 09.11.2019r.

# Obliczenia naukowe Lista 2., Zadanie 5. Model logistyczny, model wzrostu populacji

# Funkcje obliczające podaną liczbę iteracji logistycznego modelu populacji w podanej arytmetyce
# i warunkach początkowych. Parametr T to typ arytmetyki, w której mają być wykonywane obliczenia,
# p0 to pierwszy numer sekwencji, c to liczba itracji, po krótej dokonywane jest obcięcie,
# n- liczba iteracji, r - pewna stała. Zwracana jest lista długości n z kolejnymi wartościami wyrażeń modelu logistyczego

function modelLogistyczny(T, p0, n, r)
    A = zeros(T,n+1)
    p = p0
    A[1] = p
    for i in 1:n
        p = p + r * p * (T(1.0) - p)
        A[i + 1] = p
    end
    A
end

function modelLogistycznyZObcieciem(T, p0, c, n, r)
    A = modelLogistyczny(T, p0, c, r)
    A[c+1] =  T(Int64(floor(A[c+1]*1000.0))/1000)
    B = modelLogistyczny(T, A[c+1], n-c, r)
    pop!(A)
    C = append!(A, B)
    C
end

function drukowanieTabeli(array)
    for i in 1:length(array[1])
        println("n: ", i-1)
        for j in eachindex(array)
            println("wynik:", array[j][i])
            if j < length(array)
            else
                println(" \\\\ \n")
            end
        end
    end
end

n = 40
cut = 10
r = 3
X = zeros(Float32,n+1)
Y = zeros(Float64,n+1)
Z = zeros(Float32,n+1)

X = modelLogistyczny(Float32, Float32(0.01), n, r)
Y = modelLogistyczny(Float64, Float64(0.01),  n, r)
Z = modelLogistycznyZObcieciem(Float32, Float32(0.01), cut,  n, r)

println("Błąd względny obcięcia: ", (0.722931 - 0.722000)/ 0.722000)

println("------------ FLOAT32 & FLOAT32 Z OBCIĘCIEM------------------")
drukowanieTabeli([X, Z])
println("-------------------------------------------------------------")
println()
println("----------- FLOAT32 & FLOAT64 --------------------------")
drukowanieTabeli([X, Y])