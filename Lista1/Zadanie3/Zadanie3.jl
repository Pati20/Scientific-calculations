# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 19.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 3. Rozmieszczenie liczb zmiennopozycyjnych

#Power- potęga kroku delta
#x- początek przedziału
#stop - koniec przedziału
#Funkcja drukuje bitową reprezentację liczb Float64 w danym przedziale
function bit_representation(Power,x,stop)
    println("Bit representation [",x," , ",stop,"] delta: 2^-",Power)
    delta = (0.5)^(Power)
    for i=1 : 7
        println(bitstring(Float64(x)))
        x += delta
    end
    println("...")
    for i = 1 : 5
	println(bitstring(stop-Float64(delta*(5-i))))
    end
end

bit_representation(52,1,2)
println("---------------------------------------")
bit_representation(53,0.5,1)
println("---------------------------------------")
bit_representation(51,2,4)
println("---------------------------------------")
