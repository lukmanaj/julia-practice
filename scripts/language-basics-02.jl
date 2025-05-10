## Arrays
# Arrays are a collection of elements
# Arrays can be created using the `Array` constructor
# or using the `[]` syntax
# Arrays can be created using the `collect` function
# Arrays can be created using the `fill` function
# Arrays can be created using the `zeros` function
# Arrays can be created using the `ones` function
# Arrays can be created using the `rand` function
# Arrays can be created using the `randn` function
# Arrays can be created using the `randint` function
# Arrays can be created using the `randperm` function
# Arrays can be created using the `randrange` function
# Arrays can be created using the `randexp` function
println("Arrays:")
# Create an array of integers
a = [1, 2, 3, 4, 5]
println("a = ", a)
# Create an array of floats
b = [1.0, 2.0, 3.0, 4.0, 5.0]
println("b = ", b)
# Create an array of strings
c = ["one", "two", "three", "four", "five"]
println("c = ", c)
# using end for indexing
println("a[end] = ", a[end])
# using end for indexing
println("a[1:end] = ", a[1:end])
# using end for indexing    
println("a[1:end-1] = ", a[1:end-1])

# Using collect for ranges
println("collect(1:5) = ", collect(1:5))

# Arrays: Vectors and Matrices
println("Arrays: Vectors and Matrices:")
# Create a vector
v = [1, 2, 3, 4, 5]
println("v = ", v)
# Create a matrix
m = [1 2 3; 4 5 6; 7 8 9]
println("m = ", m)
# Create a 3D array     
a3d = rand(3, 3, 3)
println("a3d = ", a3d)

# Create a 4D array
a4d = rand(3, 3, 3, 3)
println("a4d = ", a4d)

# Membership Operator
println("Membership Operator:")
# Create a vector
v = [1, 2, 3, 4, 5]
# Check if 3 is in the vector
println("3 ∈ v = ", 3 ∈ v)
# Check if 6 is in the vector
println("6 ∈ v = ", 6 ∈ v)
# Check if 3 is not in the vector
println("3 ∉ v = ", 3 ∉ v)
println( [2, 3] ∈ [2, 3, 4]) # false
println( [2, 3] ∉ [2, 3, 4]) # false
println( [2, 3] ∈ [[2, 3]]) # true

# Strings and Characters

println("Strings and Characters:")
#=Julia is a bit unusual in that single and double quotation marks have
different meanings: single quotes indicate characters and double quotes
are for strings. Char and String are two distinct data types.

You can add an integer to a character, as in 'a' + 1, and Julia will give
you the next character, 'b'. Subtraction gives similar results. You can
even subtract two characters to find the distance between them: 'c' - 'a'
yields 2, which means that 'a' + 2 yields 'c'. However, addition of
characters is not allowed.
=#
println("Adding 1 to 'a': ", 'a' + 1) # Adding 1 to 'a': b
println("Subtracting 1 from 'a': ", 'a' - 1) # Subtracting 1 from 'a': a
println("Subtracting 'a' from 'c': ", 'c' - 'a') # Subtracting 'a' from 'c': 2
println("Adding 2 to 'a': ", 'a' + 2) # Adding 2 to 'a': c
#println("Adding 'a' to 'b': ", 'a' + 'b') # Adding 'a' to 'b': ERROR

# For blocks
#= You may substitute = for the keyword in in any for block if you prefer. There
is also a third, fancier option: you can use the membership symbol ∈,
=#
println("For blocks:")
println("Using = for in:")
for i = 1:5
    println(i)
end
println("Using ∈ for in:")
for i ∈ 1:5
    println(i)
end
println("Using ∈ for in with a range:")
for i ∈ 1:5
    println(i)
end
println("Using = for in with a range:")
for i = 1:5
    println(i)
end
println("Using nested for loop in a single line:") # benefit only one end
for i ∈ 1:5, j ∈ 1:5
    println("i = ", i, ", j = ", j)
end