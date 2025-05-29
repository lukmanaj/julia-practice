function binary_search(arr, target)
    low = 1
    high = length(arr)

    while low <= high
        mid = low + (high - low)÷ 2
        if arr[mid] == target
            return mid
        elseif arr[mid] < target
            low = mid + 1
        else
            high = mid - 1
        end
    end

    return -1  # Target not found
end

# Example usage
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
target = 5
result = binary_search(arr, target)
if result != -1
    println("Element found at index: ", result)
else
    println("Element not found in the array.")
end
# Output: Element found at index: 5
# Example with a target not in the array
target_not_found = 11
result_not_found = binary_search(arr, target_not_found)
if result_not_found != -1
    println("Element found at index: ", result_not_found)
else
    println("Element not found in the array.")
end
# Output: Element not found in the array.

# Insertion Sort
function insertion_sort(arr)
    n = length(arr)
    for i in 2:n
        j = i - 1
        while j >= 1 && arr[j+1] < arr[j]
            arr[j + 1],arr[j] = arr[j],arr[j+1]
            j -= 1
        end
    end
    return arr
end
# Example usage
arr_to_sort = [5, 2, 9, 1, 5, 6]
sorted_arr = insertion_sort(arr_to_sort)
println("Insertion sorted array: ", sorted_arr)
# Output: Sorted array: [1, 2, 5, 5, 6, 9]

# Merge Sort
function merge_sort(arr)
    if length(arr) <= 1
        return arr
    end

    mid = length(arr) ÷ 2
    left = merge_sort(arr[1:mid])
    right = merge_sort(arr[mid+1:end])

    return merge(left, right)
end

function merge(left, right)
    result = Int[]
    i = 1
    j = 1

    while i <= length(left) && j <= length(right)
        if left[i] < right[j]
            push!(result, left[i])
            i += 1
        else
            push!(result, right[j])
            j += 1
        end
    end

    while i <= length(left)
        push!(result, left[i])
        i += 1
    end

    while j <= length(right)
        push!(result, right[j])
        j += 1
    end

    return result
end
# Example usage
arr_to_sort_merge = [38, 27, 43, 3, 9, 82, 10]
sorted_arr_merge = merge_sort(arr_to_sort_merge)
println("Sorted array using Merge Sort: ", sorted_arr_merge)
# Output: Sorted array using Merge Sort: [3, 9, 10, 27, 38, 43, 82]
# Quick Sort
function quick_sort(arr)
    if length(arr) <= 1
        return arr
    end

    pivot = arr[1]
    less = [x for x in arr[2:end] if x <= pivot]
    greater = [x for x in arr[2:end] if x > pivot]

    return vcat(quick_sort(less), pivot, quick_sort(greater))
end
# Example usage
arr_to_sort_quick = [10, 7, 8, 9, 1, 5]
sorted_arr_quick = quick_sort(arr_to_sort_quick)
println("Sorted array using Quick Sort: ", sorted_arr_quick)
# Output: Sorted array using Quick Sort: [1, 5, 7, 8, 9, 10]
# Bubble Sort
function bubble_sort(arr)
    n = length(arr)
    for i in 1:n
        for j in 1:(n - i)
            if arr[j] > arr[j + 1]
                arr[j], arr[j + 1] = arr[j + 1], arr[j]  # Swap elements
            end
        end
    end
    return arr
end
# Example usage
arr_to_sort_bubble = [64, 34, 25, 12, 22, 11, 90]
sorted_arr_bubble = bubble_sort(arr_to_sort_bubble)
println("Sorted array using Bubble Sort: ", sorted_arr_bubble)
# Output: Sorted array using Bubble Sort: [11, 12, 22, 25, 34, 64, 90]
# Selection Sort
function selection_sort(arr)
    n = length(arr)
    for i in 1:n-1
        min_index = i
        for j in (i+1):n
            if arr[j] < arr[min_index]
                min_index = j
            end
        end
        arr[i], arr[min_index] = arr[min_index], arr[i]  # Swap elements
    end
    return arr
end
# Example usage         
arr_to_sort_selection = [29, 10, 14, 37, 13]
sorted_arr_selection = selection_sort(arr_to_sort_selection)
println("Sorted array using Selection Sort: ", sorted_arr_selection)
# Output: Sorted array using Selection Sort: [10, 13, 14, 29, 37]
# Heap Sort
function heapify(arr, n, i)
    largest = i
    left = 2 * i
    right = 2 * i + 1

    if left <= n && arr[left] > arr[largest]
        largest = left
    end

    if right <= n && arr[right] > arr[largest]
        largest = right
    end

    if largest != i
        arr[i], arr[largest] = arr[largest], arr[i]  # Swap elements
        heapify(arr, n, largest)
    end
end
function heap_sort(arr)
    n = length(arr) - 1  # Adjust for 1-based indexing

    for i in div(n, 2):-1:1
        heapify(arr, n, i)
    end

    for i in n:-1:2
        arr[1], arr[i] = arr[i], arr[1]  # Swap elements
        heapify(arr, i - 1, 1)
    end

    return arr
end
# Example usage
arr_to_sort_heap = [12, 11, 13, 5, 6, 7]
sorted_arr_heap = heap_sort(arr_to_sort_heap)
println("Sorted array using Heap Sort: ", sorted_arr_heap)
# Output: Sorted array using Heap Sort: [5, 6, 7, 11, 12, 13]
# Counting Sort
function counting_sort(arr, max_val)
    count = zeros(Int, max_val + 1)
    for num in arr
        count[num] += 1
    end

    sorted_arr = Int[]
    for i in 1:(max_val + 1)
        for j in 1:count[i]
            push!(sorted_arr, i - 1)  # Adjust for 0-based indexing
        end
    end

    return sorted_arr
end
# Example usage
arr_to_sort_counting = [4, 2, 2, 8, 3, 3, 1]
max_value = maximum(arr_to_sort_counting)
sorted_arr_counting = counting_sort(arr_to_sort_counting, max_value)
println("Sorted array using Counting Sort: ", sorted_arr_counting)
# Output: Sorted array using Counting Sort: [1, 2, 2, 3, 3, 4, 8]
# Radix Sort
function counting_sort_radix(arr, exp)
    n = length(arr)
    output = zeros(Int, n)
    count = zeros(Int, 10)

    for i in 1:n
        index = (arr[i] ÷ exp) % 10
        count[index + 1] += 1  # Adjust for 1-based indexing
    end

    for i in 2:10
        count[i] += count[i - 1]
    end

    for i in n:-1:1
        index = (arr[i] ÷ exp) % 10
        output[count[index + 1]] = arr[i]
        count[index + 1] -= 1
    end

    return output
end
function radix_sort(arr)
    max_val = maximum(arr)
    exp = 1

    while max_val ÷ exp > 0
        arr = counting_sort_radix(arr, exp)
        exp *= 10
    end

    return arr
end
# Example usage
arr_to_sort_radix = [170, 45, 75, 90, 802, 24, 2, 66]
sorted_arr_radix = radix_sort(arr_to_sort_radix)
println("Sorted array using Radix Sort: ", sorted_arr_radix)
# Output: Sorted array using Radix Sort: [2, 24, 45, 66, 75, 90, 170, 802]
# Shell Sort
function shell_sort(arr)
    n = length(arr)
    gap = div(n, 2)

    while gap > 0
        for i in (gap + 1):n
            temp = arr[i]
            j = i

            while j > gap && arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            end

            arr[j] = temp
        end
        gap = div(gap, 2)
    end

    return arr
end         
# Example usage
arr_to_sort_shell = [12, 34, 54, 2, 3]
sorted_arr_shell = shell_sort(arr_to_sort_shell)
println("Sorted array using Shell Sort: ", sorted_arr_shell)
# Output: Sorted array using Shell Sort: [2, 3, 12, 34, 54]
# Output: Sorted array using Shell Sort: [2, 3, 12, 34, 54]
# Fibonacci Sequence
function fibonacci(n)
    if n <= 0
        return 0
    elseif n == 1
        return 1
    else
        a, b = 0, 1
        for _ in 2:n
            a, b = b, a + b
        end
        return b
    end
end
# Example usage
n_fib = 10
fib_result = fibonacci(n_fib)
println("Fibonacci number at position $n_fib: $fib_result")
# Output: Fibonacci number at position 10: 55
# Factorial
function factorial(n)
    if n < 0
        throw(ArgumentError("Factorial is not defined for negative numbers."))
    elseif n == 0 || n == 1
        return 1
    else
        result = 1
        for i in 2:n
            result *= i
        end
        return result
    end
end
# Example usage     
n_factorial = 5     
fact_result = factorial(n_factorial)
println("Factorial of $n_factorial: $fact_result")
# Output: Factorial of 5: 120
# Prime Check
function is_prime(n)
    if n <= 1
        return false
    elseif n <= 3
        return true
    elseif n % 2 == 0 || n % 3 == 0
        return false
    end

    i = 5
    while i * i <= n
        if n % i == 0 || n % (i + 2) == 0
            return false
        end
        i += 6
    end

    return true
end
# Example usage
n_prime = 29
prime_result = is_prime(n_prime)
println("Is $n_prime a prime number? ", prime_result)
# Output: Is 29 a prime number? true
# GCD (Greatest Common Divisor)
function gcd(a, b)
    while b != 0
        a, b = b, a % b
    end
    return a
end
# Example usage
a_gcd = 48
b_gcd = 18
gcd_result = gcd(a_gcd, b_gcd)
println("GCD of $a_gcd and $b_gcd: $gcd_result")
# Output: GCD of 48 and 18: 6
# LCM (Least Common Multiple)
function lcm(a, b)
    return abs(a * b) ÷ gcd(a, b)
end
# Example usage
a_lcm = 15
b_lcm = 20
lcm_result = lcm(a_lcm, b_lcm)
println("LCM of $a_lcm and $b_lcm: $lcm_result")
# Output: LCM of 15 and 20: 60

