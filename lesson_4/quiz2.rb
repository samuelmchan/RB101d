# Question 2
# Given an array of strings representing integers,
# iterate through all of the items in the array.
# If the integer value of the string is odd add it
# to a new array of odd integer strings.
# Once iteration is complete the new array should
# contain all of the odd integer strings from the original array.

# A (incorrect)
numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
number = 0

until number == numbers.size
  odd_numbers << numbers[number] if number.to_i.odd?
  # number is 0 on the first iteration which is odd
  # numbers[number] == '2' which is even
  # the program will push '2' into the odd_numbers array
  number += 1
end

# B (correct)
numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []

for number in numbers
  if number.to_i.odd?
    odd_numbers.push(number)
  end
end

# C (correct)
numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
counter = 0

loop do
  number = numbers[counter].to_i

  odd_numbers << numbers[counter] unless number.even?

  counter += 1
  break if counter == numbers.size # 9
end

# D (correct)
numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []

numbers.each do |number|
  odd_numbers << number if number.to_i.odd?
end
