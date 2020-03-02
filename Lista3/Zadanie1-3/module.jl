# Autor: Patrycja Paradowska
# Nr indeksu: 244952
# 22.11.2019r.

# Obliczenia naukowe, Lista 3., Zadania 1-3.
# Pierwsze 3 zadania polegały na napisaniu funkcji rozwiązujących równanie f(x) = 0 za pomocą
# metod bisekcji, Newtona oraz siecznych.

module ComputingLinearEquations
  export mbisekcji, mstycznych, msiecznych

  # Funkcja z zadania 1. szukająca zera podanej funkcji używając metody bisekcji
  # f - funkcja f(x) zadana jako anonimowa funkcja (ang. anonymous function)
  # a,b - końce przedziału
  # delta, epsilon - dokładności obliczeń

  function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    r = Float64(0.0)
    v = Float64(0.0)
    it = 0
    err = 0
    e = b - a
    f_a = f(a)
    f_b = f(b)

    if signbit(f_a) == signbit(f_b)
        err = 1
        return (r, v, it, err)
    end
    while e > epsilon
        it += 1
        e /= 2.0
        r = a + e
        v = f(r)
        if abs(e) < delta || abs(v) < epsilon
            return (r, v, it, err)
        end

        if signbit(v) != signbit(f_a)
            b = r
            f_b = v
        else
            a = r
            f_a = v
        end
    end
end


  # Funkcja z zadania 2. szukająca zera podanej funkcji używając metody stycznych (Newtona)
  # f - funkcja f(x) zadana jako anonimowa funkcja (ang. anonymous function)
  # pf - pochodna danej funkcji f
  # xo - przybliżenie początkowe
  # delta, epsilon - dokładności obliczeń
  # maxit - maksymalna dopuszczalna liczba iteracji

  # Wyniki: czwórka (r, v, it, err), gdzie:
  # r - przybliżona wartość pierwiastka równania f(x) = 0
  # v - wartość f(r)
  # it - liczba wykonanych iteracji
  # err - sygnalizacja błędu
#     0 - metoda zbieżna
#     1 - nie osiągnięto wymaganej dokładności w maxit iteracji
#     2 - pochodna bliska zeru

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    r = Float64(0.0)
    v = Float64(0.0)
    it = 0
    err = 0
    r = x0
    v = f(r)
    if abs(pf(r)) < epsilon
        err = 2
        return (r, v, it, err)
    end

    for it in 1:maxit
        x1 = r - v / pf(r)
        v = f(x1)
        if abs(x1 - r) < delta || abs(v) < epsilon
            r = x1
            return (r, v, it, err)
        end
        r = x1
    end
    err = 1
    return (r, v, it, err)
end

  # Funkcja z zadania 3. szukająca zera podanej funkcji używając metody siecznych
  # f - funkcja f(x) zadana jako anonimowa funkcja (ang. anonymous function)
  # x0,x1 - przybliżenie początkowe
  # delta, epsilon - dokładności obliczeń
  # maxit - maksymalna dopuszczalna liczba iteracji

  # Wyniki: czwórka (r, v, it, err), gdzie:
  # r - przybliżona wartość pierwiastka równania f(x) = 0
  # v - wartość f(r)
  # it - liczba wykonanych iteracji
  # err - sygnalizacja błędu
#     0 - metoda zbieżna
#     1 - nie osiągnięto wymaganej dokładności w maxit iteracji

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    r = Float64(0.0)
    v = Float64(0.0)
    it = 0
    err = 0

    f_x0 = f(x0)
    f_x1 = f(x1)

    for it in 1:maxit
        if abs(f_x0) > abs(f_x1)
            # Swap values
            x0, x1 = x1, x0
            f_x0, f_x1 = f_x1, f_x0
        end

        s = (x1 - x0) / (f_x1 - f_x0)
        x1 = x0
        f_x1 = f_x0
        x0 -= f_x0 * s
        f_x0 = f(x0)

        if abs(x1 - x0) < delta || abs(f_x0) < epsilon
            r = x0
            v = f_x0
            return(r, v, it, err)
        end
    end

    err = 1
    r = x0
    v = f_x0
    return(r, v, it, err)
end
end