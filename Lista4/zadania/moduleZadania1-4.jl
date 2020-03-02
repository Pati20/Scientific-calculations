# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 08.12.2019r.

# Obliczenia naukowe, lista 4. Zadania 1-4.

module PolynomialInterpolation
  export ilorazyRoznicowe, warNewton, rysujNnfx, naturalna
#   using Plots
#
########################### ZADANIE 1. ############################

# Funkcja obliczająca ilorazy różnicowe dla danych funkcji i wektorów argumentów
# Dane:
# x - Vector{Float64} wektor długości n+1 zawierający węzły x0, ... , xn
# f - Vector{Float64} wektor długości n+1 zawierający wartości interpolowanej funkcji
# w węzłach f(x0), ... , f(xn).
# Wyniki:
# fx - Vector{Float64} wektor długości n+1 zawierający obliczone ilorazy różnicowe

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    n = length(f)
    fx = Vector{Float64}(undef,n)
    for i in 1:n
        fx[i] = f[i]
    end
    for i = 2:n
        for j = n:-1:i
            fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
        end
    end
    return fx
end

###############################  ZADANIE 2. ###########################
# Funkcja obliczająca wartość wielomianu interpolacyjnego stopnia n w postaci Newtona Nn(x)
# w punkcie x = t za pomocą uogólnionego  algorytmu Hornera, w czasie  O(n)
# Dane:
# x - Vector{Float64} wektor długości n+1 zawierający węzły x0, ..., xn
# fx - Vector{Float64} wektor długości n+1 zawierający ilorazy różnicowe
# t - punkt, w którym należy obliczyć wartośc wielomianu
# Wyniki:
# nt - wartość wielomianu w punkcie t

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    l = length(x)
    nt = fx[l]
    for i = l - 1:-1:1
        nt = fx[i] + (t-x[i]) * nt
    end
    return nt
end

################################ ZADANIE 3 ########################

# Funkcja obliczająca w czasie O(n^2) wspolczynniki postaci naturalnej a0,.., an wielomianu interpolacyjnego,
# znając jego wspolczyniki w postaci newtona (ilorazy różnicowe) oraz węzły
# Dane:
# x - Vector{Float64} wektor długości n+1 zawierający węzły x0, ... xn
# fx - Vector{Float64} wektor długości n+1 zawierająćy ilorazy różnicowe
# Wyniki:
# a - Vector{Float64} wektor długości n+1 zawierający obliczone współczynniki postaci naturalnej.

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    n = length(x)
    a = Vector{Float64}(undef,n)
    a[n] = fx[n]
    for i = n - 1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]
        for j = i + 1:n - 1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end
    return a
end

################################ ZADANIE 4. #############################
using PyPlot

# Funkcja, która zinterpoluje zadaną funkcję f(x) w przedziale [a,b] za pomocą
# wielomianu interpolacyjnego stopnia n w postaci Newtona, a następnie narysuje
# wielomian interpolacyjny i interpolowaną funkcję.
# Dane:
# f - funkcja f(x) zadana jako anonimowa
# a - początek przedzału interpolacji (Float64)
# b - koniec przedziału interpolacji (Float64)
# n - stopień wielomianu interpolacyjnego
# Wyniki:
# - funkcja rysuje wielomian interpolacyjny i interpolowaną funkcję w przedziale [a,b]

function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    x = Vector{Float64}(undef,n + 1)
    y = Vector{Float64}(undef,n + 1)
    f_x = Vector{Float64}(undef,n + 1)
    maxlWęzłów = n + 1
    h = (b - a) / n
    kh = Float64(0.0)
    mnożnik = 20
    plot_args = Vector{Float64}(undef,mnożnik * maxlWęzłów)
    plot_val = Vector{Float64}(undef,mnożnik * maxlWęzłów)
    plot_ip = Vector{Float64}(undef,mnożnik * maxlWęzłów)
    for i = 1:maxlWęzłów
        x[i] = a + kh
        y[i] = f(x[i])
        kh += h
    end
    f_x = ilorazyRoznicowe(x, y)
    kh = Float64(0.0)
    maxlWęzłów *= mnożnik
    h = (b - a) / (maxlWęzłów - 1)
    for i = 1:maxlWęzłów
        plot_args[i] = a + kh
        plot_ip[i] = warNewton(x, f_x, plot_args[i])
        plot_val[i] = f(plot_args[i])
        kh += h
    end
    nazwaPliku = string("wykres_", f, "_", n, ".png")
    clf()
    plot(plot_args, plot_val, label="f(x)", linewidth=1.0)
    plot(plot_args, plot_ip, label="w(x)", linewidth=1.0)
    grid(true)
    legend(loc=2,borderaxespad=0)
    title(string(" N = ", n))
    savefig(nazwaPliku)
end
end