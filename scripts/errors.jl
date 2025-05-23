## Error Handling
# try-catch
function friendly_divide(x, y)
    try
        return x ÷ y
    catch e
        if e isa DivideError
            #println("Error: Division by zero!")
            @warn("Error: Division by zero!")
            @info("Please provide a non-zero denominator.")
        elseif e isa ArgumentError
            #println("Error: Invalid argument!")
            @warn("Error: Invalid argument!")
            @info("Please check the input values.")
        elseif e isa MethodError
            #println("Error: Method not found!")
            @warn("Error: Method not found!")
            @info("Please check the method signature.")
        else
        @error("An unexpected error occurred: ")
        end
        return NaN  # Return NaN in case of an error
    end
end
# Example usage
result = friendly_divide(10, 0)
println("Result: ", result)  # Output: Result: NaN


# Using throw

function finite_log(x)
    if x <= 0
        throw(ArgumentError("Input must be positive."))
    end
    return log(x)
end

function e(n)
    if n < 0
        throw((n, "Got a negative number."))
    elseif n == 0
        throw((0, "Got 0."))
end
return log(n)
end