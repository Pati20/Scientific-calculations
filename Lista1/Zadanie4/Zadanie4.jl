# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 20.10.2019r.

# Obliczenia naukowe Lista 1., Zadanie 4. Problem nieodwracalności dzielenia

#Funkcja znajdująca taką najmniejszą liczbę z przedziału 1 < x < 2, że 1 * 1/x != 1
function smallst()
	x = nextfloat(Float64(1.0))
	#dopóki x * 1/x == 1 zwiększaj x
	while Float64(x * Float64(1.0 / x)) == Float64(1.0) && x < Float64(2.0)
		x = nextfloat(Float64(x))
	end
	return x
end

println(smallst())

