# Question 18

# Identify all of the code implementations that correctly meet the following set of requirements.
#
# Given an array numbers which contains both odd and even integers;
# create two new arrays, odd_numbers which contains
# the odd integers from the original array
# and even_numbers which contains the even integers.

# A (correct)

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]

odd_numbers = numbers.select do |number|
                number.odd?
              end

even_numbers = numbers.select do |number|
                number.even?
              end

# B (correct)

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers = []
even_numbers = []

numbers.each do |number|
  if number.even?
    even_numbers << number
  elsif number.odd?
    odd_numbers << number
  end
end

# C (incorrect)

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers = []
even_numbers = []

for number in numbers
  next if number.odd?
  even_numbers << number
end

for number in numbers
  next unless number.odd? # should say even
  odd_numbers << number
end


# D (incorrect)

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers, even_numbers = numbers.partition do |number| # the order should be reversed
                              number.even?
                            end # => [[2, 4, 8, 10, 14], [1, 5, 7, 13]]

# odd_numbers = [2, 4, 8, 10, 14]
# even_numbers = [1, 5, 7, 13]
