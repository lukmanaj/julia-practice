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




