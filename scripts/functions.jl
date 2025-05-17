# Functions and Metaprogramming
# Splatting and Slurping
# Splatting is a way to unpack elements from a collection into function arguments.
# Slurping is the opposite, where you collect multiple arguments into a single collection.

# Splatting
function add(x, y)
    return x + y
end
function add_all(args...)
    return sum(args)
end

# Example of splatting
numbers = [1, 2, 3, 4, 5]
result = add_all(numbers...)  # Unpack the array into the function
println("Sum of numbers: ", result)
# Slurping
function collect_args(args...)
    return args
end
# Example of slurping
args = collect_args(1, 2, 3, 4, 5)  # Collect arguments into a tuple
println("Collected arguments: ", args)



# Keyword Arguments
function greet(name; greeting="Hello")
    return "$greeting, $(name)!"
end
# Example of keyword arguments
greeting_message = greet("Alice", greeting="Hi")  # Specify a keyword argument
println(greeting_message)
# Example of default keyword arguments
default_greeting = greet("Bob")  # Use the default keyword argument
println(default_greeting)

# Destructuring
function process_data((x, y, z))
    return x + y + z
end
# Example of destructuring
data = (1, 2, 3)
result = process_data(data)  # Unpack the tuple into the function
println("Processed data: ", result)
# Example of destructuring with named fields
struct Point
    x::Float64
    y::Float64
end
function process_point(point::Point)
    return point.x + point.y
end
# Example of destructuring with named fields
point = Point(3.0, 4.0)
result = process_point(point)  # Unpack the struct into the function
println("Processed point: ", result)

# Infix Operators
function ⊟(x, y)
    return sqrt((y[1] -x[1])^2 + (y[2] - x[2])^2)
end
# Example of using infix operator
println("Distance using ⊟: ", (1, 2) ⊟ (4, 6))  # Use the custom infix operator
# Example of using infix operator with a custom function
v1 = [0,1]
v2 = [1,0]
println("Distance using custom infix operator: ", v1 ⊟ v2)  # Use the custom infix operator
println(3 .* v1 ⊟ 4 .* v2)  # Use the custom infix operator with scalar multiplication

v1a = [v1, v1, v1]
v2a = [v1, v2, [0, 0]]
println("Vectorized distance using custom infix operator: ", v1a .⊟ v2a)  # Use the custom infix operator

# The Mapping, Filtering, and Reduction Operators
#=The three operators map(), filter(), and reduce() are higher-order
functions that apply a supplied function to a collection.
=#

# Map
function square(x)
    return x^2
end
# Example of using map
numbers = [1, 2, 3, 4, 5]
squared_numbers = map(square, numbers)  # Apply the square function to each element
println("Squared numbers: ", squared_numbers)

# Filter
function is_even(x)
    return x % 2 == 0
end
# Example of using filter
even_numbers = filter(is_even, numbers)  # Filter even numbers from the list
println("Even numbers: ", even_numbers)

println("Fittered ASCII characters: ", filter(isascii, "François"))  # Filter ASCII characters

println(filter(x -> x % 2 == 0, 1:10))  # Filter even numbers using a lambda function


# Reduce
function add(x, y)
    return x + y
end
# Example of using reduce
numbers = [1, 2, 3, 4, 5]
sum_result = reduce(add, numbers)  # Reduce the list by summing elements
println("Sum of numbers: ", sum_result)


# Mapreduce
mapreduce(x -> x^2, +, 1:100)  # Map and reduce in one step

# do block

foldl(3:-1:0) do x, y
    if y == 0
        return x
    else
        return x/y
    end
end

# Symbols and Metaprogramming
## Expression Objects
# An expression object is a Julia object that represents a piece of code.
# It can be created using the : operator, which creates a symbol.

#=

Julia has the ability to manipulate Julia code. That’s possible because
Julia code itself is expressible as a data type that the language can
operate on, just as it operates on numbers, strings, and arrays. This data
type is called Expr. Objects with this data type are referred to as Expr
objects or expression objects. Expression objects are different from
expressions, which are language forms that return results, such as 3 * 5.
Expression objects often involve Julia Symbols. We can create a Symbol
by prepending a colon to a name, as with the attributes, such as :red,
that we used when making plots. We can convert a string to a symbol
with the Symbol() function as well: Symbol("red") == :red.
We can also use colons to construct expression objects by following
the colon with an expression in parentheses. To reiterate: 3 * 5 is an
expression, while :(3 * 5) is an expression object. If we enter 3 * 5 in the
REPL, Julia evaluates the expression and returns 15. If we enter :(3 * 5),
or any other expression object, it simply returns what we entered.
In order to evaluate the expression that the Expr object represents, the
part inside the parentheses, we use the eval() function. If we enter eval(:
(3 * 5)) in the REPL, Julia returns 15.

=#

ex = quote
    a = 3
    a + 2
end;
println(typeof(ex)) # Expr

# Expressin Object Interpolation
ex = :(a + b)
a = 3
b = 4
println(eval(ex))  # Evaluate the expression object
# Example of expression object interpolation
ex = :(a + $b)  # Interpolate the value of b into the expression
println(eval(ex))  # Evaluate the expression object

mkvar(s,v) = eval(:($(Symbol(s)) = $v))  # Create a variable with the given name and value
mkvar("Lukman",31)  # Create a variable named "Lukman" with value 31
println(Lukman)  # Access the variable
