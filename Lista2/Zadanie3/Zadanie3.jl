# Autor: Patrycja Paradowska
# Nr indexu: 244952
# Data: 08.11.2019r.

# Obliczenia naukowe Lista 2., Zadanie 3. Układ równań


using LinearAlgebra

include("matcond.jl")
include("hilb.jl")
Type = Float64

function methodOfGaussianElimination(A,b);
    return A\b
end
function methodOfInversion(A,b);
    return inv(A)*b
end
function countingRelativeErrors(result, x)
    return norm(result - x) / norm(x)
end

function printingResults(T,A,matrixSize);
    x = ones(T,matrixSize)
    b = A*x
    result1 = methodOfGaussianElimination(A,b)
    result2 = methodOfInversion(A,b)
    error1 = countingRelativeErrors(result1,x)
    error2 = countingRelativeErrors(result2,x)
    println("MatrixSize: ",matrixSize, " rank(A): ", rank(A), " cond(A): ", cond(A)," gaussError: ", error1," inversionError: ", error2)
end

println("Hilbert matrix: ")
for i = 1 : 20
    printingResults(Type,hilb(i),Int(i))
end

n = [Int(5),Int(10),Int(20)]
c = [Type(1),Type(10),Type(10^(3)),Type(10^(7)),Type(10^(12)),Type(10^(16))]

println("Random matrix: ")
for i = 1 : 3
    for j = 1 : length(c)
        printingResults(Type,matcond(Int(n[i]),Float64(c[j])),n[i])
    end
end
