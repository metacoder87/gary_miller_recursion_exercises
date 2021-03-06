            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_recursion_exercises/blob/master/recursion.rb


# Recursion

# Learning Goals

# Know how to reason about recursive programs
# Be able to write a base case for a recursive method
# Be able to write the inductive step for a recursive method
# Be able to explain the benefits of writing a method recursively vs. iteratively
# Be able to trace a recursive method 
#     and figure out how many recursive steps it will take
# Know how to write recursive sorting and searching algorithms


# Warmup

# Write a recursive method, range, that takes a start and an end and returns an 
# array of all numbers in that range, exclusive. For example, range(1, 5) should 
# return [1, 2, 3, 4]. If end < start, you can return an empty array.


    def range(first, past_last)
        first >= past_last ? [] : [first] + range(first + 1, past_last)
    end

    # test
puts "Range"
p range(1, 4) # => [1, 2, 3] 
p range(3, 10) # => [3, 4, 5, 6, 7, 8, 9]
p range(9, 14) # => [9, 10, 11, 12, 13]
p range(10, 8) # => []

# Write both a recursive and iterative version of sum of an array.

    def iter_sum(array)
        array.inject(:+)
    end

    def recur_sum(array)
        array.count > 1 ? array.first + recur_sum(array.drop(1)) : array.first
    end

    # test
puts "Sum iteration"
p iter_sum([0, 1, 2, 3, 4, 5]) # => 15
p iter_sum([5, 10, -4]) # => 11
p iter_sum([1, 2, 3, 126, -7]) # => 125
p iter_sum([18, 6, 42, 0]) # => 66

puts "Sum recursion"
p recur_sum([0, 1, 2, 3, 4, 5]) # => 15
p recur_sum([5, 10, -4]) # => 11
p recur_sum([1, 2, 3, 126, -7]) # => 125
p recur_sum([18, 6, 42, 0]) # => 66

# Exponentiation

# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

    def expo(base, power)
        power > 1 ? base * expo(base, power - 1) : base == 2 && power == 0 ? 1 : base
    end

    # test
puts "Exponent 1"
p expo(2, 3) # => 8
p expo(3, 2) # => 9
p expo(3, 3) # => 27
p expo(9, 1) # => 9
p expo(1, 0) # => 1
p expo(0, 1) # => 0
p expo(1, 1) # => 1
p expo(1, 2) # => 1
p expo(2, 0) # => 1
p expo(2, 1) # => 2
p expo(2, 2) # => 4
p expo(3, 5) # => 243


# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) 
# and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special 
# to square a number, just calculate the value and multiply it by itself. 
# So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts..
# https://open.appacademy.io/learn/full-stack-online/ruby/breaking-methods-into-parts

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, 
# about how many nested recursive steps will we run in the first case?

# How deep will we need to recurse for the second? 
# Keep in mind that the first reduces the exponent by one for each recursion, 
# while the second reduces it by half.

# In addition to testing your methods by running the code, 
# try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). 
# e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?

    def exponent(base, power)
        power > 1 && power % 2 == 0 ? exponent(base, power / 2) * exponent(base,power / 2) : power > 1 && power % 2 != 0 ? base * (exponent(base, (power - 1) / 2) * exponent(base, (power -1) / 2)) : base == 2 && power == 0 ? 1 : base
    end

    # test
puts "Exponent 2"
p exponent(2, 3) # => 8
p exponent(3, 2) # => 9
p exponent(3, 3) # => 27*
p exponent(9, 1) # => 9
p exponent(1, 0) # => 1
p exponent(0, 1) # => 0
p exponent(1, 1) # => 1
p exponent(1, 2) # => 1
p exponent(2, 0) # => 1
p exponent(2, 1) # => 2
p exponent(2, 2) # => 4
p exponent(3, 5) # => 243

# Deep dup
puts "Deep dup"

# The #dup method doesn't make a deep copy:

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, but doesn't 
# recursively dup any arrays contained therein. So the dup method creates one new 
# array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps 
# things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will 
# perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication 
# of arrays. Don't worry about deep-duping (or regular-duping) other types of 
# mutable objects (like strings, hashes, instances of custom classes, etc.), 
# since this would require that we implement a deep dup method for each of 
# those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

    def deep_dup(array)
        array.count > 1 ? deep_dup(array.drop(1)).unshift(array.first.dup) : array.dup
    end

    # test
  arr = [1, [2], [3, [4]]]
  brr = deep_dup(arr)
    brr[1] << "Flawless"
p arr # => [1, [2], [3, [4]]]
  crr = [[1, 2, 3], [4, 5, 6], [7], 8]
  drr = deep_dup(crr)
    drr[0] << "Whoops"
p crr # => [[1, 2, 3], [4, 5, 6], [7], 8]
  err = []
  frr = deep_dup(err)
  frr << "ERROR"
p err # => []
  grr = [1]
  hrr = deep_dup(grr)
  hrr.shift
p grr # => [1]

# Fibonacci
puts "Fibonacci"

# Write a recursive and an iterative Fibonacci method. The method should take in 
# an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do 
# this just passing a single argument for the number of Fibonacci numbers requested.

    def fibonacci(n, fib = [1, 1])
        n > 2 ? fibonacci(n - 1, fib << fib[-1] + fib[-2]) : n == 2 ? fib : n == 1 ? [fib.first] : [].first
    end

p fibonacci(5) # => [1, 1, 2, 3, 5]
p fibonacci(18) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584]
p fibonacci(2) # => [1, 1]
p fibonacci(1) # => [1]
p fibonacci(0) # => nil
p fibonacci(-5) # => nil

# Binary Search
puts "Binary Search"

# The binary search algorithm begins by comparing the target value to the value 
# of the middle element of the sorted array. If the target value is equal to the 
# middle element's value, then the position is returned and the search is 
# finished. If the target value is less than the middle element's value, then the 
# search continues on the lower half of the array; or if the target value is 
# greater than the middle element's value, then the search continues on the upper 
# half of the array. This process continues, eliminating half of the elements, 
# and comparing the target value to the value of the middle element of the 
# remaining elements - until the target value is either found (and its associated 
#     element position is returned), or until the entire array has been searched 
#     (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). 
# https://en.wikipedia.org/wiki/Binary_search_algorithm
# Note that binary search only works on sorted arrays. Make sure to return the 
# location of the found object (or nil if not found!). 
# Hint: you will probably want to use subarrays.

    def bsearch(array, target, brr = array)
        # checks if target is the middle element => returns middle element # returns nil if target is too big # checks if the target is greater than the middle element => runs bsearch on the greater than sub array # returns nil if target is too small # checks if target is smaller than the middle element => bsearches the lesser sub array
        target == array[array.count / 2] ? brr.index(array[array.count / 2]) : target > array.last ? [].first : target > array[array.count / 2] ? bsearch(array.values_at(array.count / 2 + 1..-1), target, brr = brr) : target < array[0] ? [].first : target < array[array.count / 2] ? bsearch(array.take(array.count / 2), target, brr = brr) : [].first
    end

# Make sure that these test cases are working:

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# Merge Sort

# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. 
# Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, 
# watch this gif
# https://en.wikipedia.org/wiki/Merge_sort#/media/File:Merge-sort-example-300px.gif
# and check out this diagram.
# https://assets.aaonline.io/fullstack/ruby/assets/merge-sort-diagram.png

puts "Merge Sort"

    def merge_sort(array)
        array.length <= 1 ? array : merge_helper(merge_sort(array[0...array.length / 2]), merge_sort(array[array.length / 2..-1]))
    end


    def merge_helper(left, right, merged = [])
        left.first <= right.first ? merged << left.shift : merged << right.shift until left.length < 1 || right.length < 1 
        merged + left + right
    end


p merge_sort([]) # => []
p merge_sort([20, 8]) # => [8, 20]
p merge_sort([16, 14, 11]) # => [11, 14, 16]
p merge_sort([18, 4, 7, 19, 17]) # => [4, 7, 17, 18, 19]
p merge_sort([10, 12, 15, 13, 16, 7, 19, 2]) # => [2, 7, 10, 12, 13, 15, 16, 19]
p merge_sort([3, 14, 10, 8, 11, 7, 18, 17, 2, 5, 9, 20, 19]) # => [2, 3, 5, 7, 8, 9, 10, 11, 14, 17, 18, 19, 20]

# Array Subsets
puts "Array Subsets"

# Write a method subsets that will return all subsets of an array.

# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset 
# that is the same, except it also does contain 3.

        def subsets(array)
            array.count > 0 ? subsets(array[0...-1]) + subsets(array[0...-1]).map { |num| num += [array.last] } : [array]
        end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# Permutations
puts "Permutations"

# https://en.wikipedia.org/wiki/Permutation
# Write a recursive method permutations(array) that calculates all the 
# permutations of the given array. For an array of length n there are n! 
# different permutations. So for an array with three elements we will have 
# 3 * 2 * 1 = 6 different permutations.

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better 
# understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]


        def permutations(array, el = array[0])
            array.count < 2 ? [array] : permutations(array[1..-1]).each_with_object([]) { |perm, result| (0..perm.count).each { |i| result << perm.dup.insert(i,el) } }
        end

    # tests
p permutations([]) # => ([[]])
p permutations([1]) # => ([[1]])
p permutations([1,2]) # => ([[1,2], [2,1]])
p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
p permutations([1,2,3,4]) # => [[1, 2, 3, 4], [2, 1, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1], [1, 3, 2, 4], 
                          #    [3, 1, 2, 4], [3, 2, 1, 4], [3, 2, 4, 1], [1, 3, 4, 2], [3, 1, 4, 2], 
                          #    [3, 4, 1, 2], [3, 4, 2, 1], [1, 2, 4, 3], [2, 1, 4, 3], [2, 4, 1, 3], 
                          #    [2, 4, 3, 1], [1, 4, 2, 3], [4, 1, 2, 3], [4, 2, 1, 3], [4, 2, 3, 1], 
                          #    [1, 4, 3, 2], [4, 1, 3, 2], [4, 3, 1, 2], [4, 3, 2, 1]]


# Make Change


# RubyQuiz: Make change.
# https://web.archive.org/web/20130215052843/http://rubyquiz.com/quiz154.html 

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, 
# leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring 
# this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 
#     10 pieces as possible, 
#     greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out 
# denominations that we've already used. This allows each coin to be available 
# each time we get a new remainder. By iterating over the denominations and 
# continuing to search for the best change, we assure that we test for 
# 'non-greedy' uses of each denomination.

# Discuss the following game plan 
# and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the 
# remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. 
# This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. 
# Remember that a permutation is not the same thing as a combination - 
# we will need to check every combination of coins that add up to our target, 
# we just don't want to check the same combination in different orders. 
# If you get stuck you can start by writing a solution that calculates and 
# compares all of the permutations without storing them in an array. Then go back 
# and refactor your solution so that it only calculates and compares all of the
# different combinations. If you and your partner get totally stuck, or would 
# like to compare your answer, feel free to reference this 
# https://vimeo.com/91207646
# video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.
puts "Make Greedy Change"

        def greedy_make_change(amount, coins, change = [])
            return change if amount < 1 || coins.empty?
            change << coins.first && amount -= coins.first until amount < coins.first
            greedy_make_change(amount, coins.drop(1), change)
        end

    # tests
p greedy_make_change(39, [25,10,5,1]) # => [25, 10, 1, 1, 1, 1]
p greedy_make_change(96, [25,10,5,1]) # => [25, 25, 25, 10, 10, 1]


puts "Make Less Change"

        def make_change(amount, coins, change = [])
            return change if amount < 1 || coins.empty?
            coin = coins.select { |coin| amount % coin == 0 && coin != 1 }.first || coin = coins.select { |coin| amount / coin > 0 }.first 
            amount > coin ? make_change(amount - coin, coins, change << coin) : make_change(amount - coin, coins - [coin], change << coin)
        end

    # tests
p make_change(14, [10,7,1]) # => [7, 7]
p make_change(24, [10,7,1]) # => [10, 7, 7]
p make_change(39, [10,7,1]) # => [10, 10, 10, 7, 1, 1]

# Resources
# Wikipedia: Recursion
# https://en.wikipedia.org/wiki/Recursion_(computer_science)

 

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_recursion_exercises/blob/master/recursion.rb