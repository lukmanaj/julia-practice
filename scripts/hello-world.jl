# Julia Rocks!
## Between print and println

# Using print
println("Using print:")
for i in 1:5
    print(i, " ")

end

println("\n")  # Just adds a blank line for separation

# Using println
println("Using println:")
for i in 1:5
    println(i)
end



# Using symbolic variables
println("Using symbolic variables:")
α = 1 
β = 2
γ = 3
println("α = ", α)
println("β = ", β)
println("γ = ", γ)

# Using symbol for in 
println("Using symbol for in with a range:")
for i ∈ 1:5 
    println(i)
end


# Types of Numbers

println("Types of Numbers:")
println("Int8: ", Int8(1))
println("Int16: ", Int16(1))
println("Int32: ", Int32(1))
println("Int64: ", Int64(1))
println("Float64:",Float64(1)) 
println("Complex: $(1 + 2im)")

# Types
println("Types:")
println("Int8: ", typeof(Int8(1)))
println("Int16: ", typeof(Int16(1)))
println("Int32: ", typeof(Int32(1)))
println("Int64: ", typeof(Int64(1)))
println("Float64:", typeof(Float64(1))) # Float64:Float64
println("Complex: $(typeof(1 + 2im))") # Complex: Complex{Int64}


# Operators
#=
Operators work in basically the same way for addition, subtraction and multiplication, 
division is the one with three types

=#

println("Operators:")
println("Addition: ", 1 + 2) # Addition: 3
println("Subtraction: ", 1 - 2) # Subtraction: -1
println("Multiplication: ", 1 * 2) # Multiplication: 2
println("Division: ", 1 / 2) # Division: 0.5
println("Integer Division: ", 1 ÷ 2) # Integer Division: 0
println("Modulo: ", 1 % 2) # Modulo: 1
println("Exponentiation: ", 2 ^ 3) # Exponentiation: 8
println("Exponentiation: ", 2 ^ 3.0) # Exponentiation: 8.0
println("Rational division: ", 1 // 2) # Rational divsion: 1//2
println("Rational division - addition: ", 1 // 2 + 2 // 3) # Rational divsion: 1//2
println("Exponentiation: ", (1 + 2im)^2) # Exponentiation: -3 + 4im

# Chains of Expressions
println("Chains of Expressions:")
println("Handled in the REPL: Check notebook")


# Coefficient Syntax
println("Coefficient Syntax:")
α = 1 
println("2α + 3β + 4γ = ", 2α + 3β + 4γ) # Coefficient Syntax: 2α + 3β + 4γ = 30

#=
In an expression such as 1/2*w, the 1/2 is calculated first and the result
is multiplied by 2. But since juxtaposition binds more tightly than
explicit arithmetic operators, in the expression 1/2w, the 2w is calculated
first.
This unusual syntax feature, along with the ability to use Greek
letters and other Unicode symbols, helps to make math in code look
more like math.
=#

# Expression Blocks
println("Expression Blocks:")
begin
    1
    2
    5+ 3
end

eigth = begin
    1
    2
    5 + 3
end
println("eigth = ", eigth) # eigth = 8

# Logic 
println("Logic:")
println("True: ", true) # True: true
println("False: ", false) # False: false
println("Not: ", !true) # Not: false
println("And: ", true && false) # And: false
println("Or: ", true || false) # Or: true
println("Xor: ", true ⊻ false) # Xor: true
println("Xor: ", true ⊻ true) # Xor: false
println("Xor: ", false ⊻ false) # Xor: false


# Looping: while blocks
# println("Looping: while blocks:")
# global j = 1
# while j <= 5
#     println(j)
#     global j += 1
# end
# println("Looping: while blocks - with break:")
# global i = 1
# while i <= 5
#     println(i)
#     if i == 3
#         break
#     end
#     global i += 1
# end
# println("Looping: while blocks - with continue:")
# global i = 1 
# while i <= 5
#     global i += 1
#     if i == 3
#         continue
#     end
#     println(i)
# end
println("Looping: while blocks - with continue and break:") 
global i = 1
while i <= 5
    global i += 1
    if i == 3
        continue
    end
    if i == 5
        break
    end
    println(i)
end
# println("Looping: while blocks - with continue and break - with a range:")      
# for i in 1:5
#     if i == 3
#         continue
#     end
#     if i == 5
#         break
#     end
#     println(i)
# end

# if blocks
#=Unlike while blocks, if blocks return a result, so an explicit print()
statement isn’t needed.
=#
println("if blocks:")
global n = 5
if n % 2 === 0
"That number is even."
elseif n % 2 === 1
"That number is odd."
else
"I only deal with integers."
end