# Identify all of the code implementations that correctly meet the following set of requirements.
# Given an array of integers, for each integer output all integers from 1 to that integer;
# e.g. if the integer was 5, you would output 1, 2, 3, 4, 5.
# As with question two, try to answer without simply running the complete code examples.

# A (correct)
numbers = [7, 3, 5, 2, 1, 8, 4]
counter = numbers.size # 7

loop do
  number = numbers[-counter] # numbers[-7] == 7
  for num in 1..number # 1..7
    puts num # outputs 1, 2, 3, 4, 5, 6, 7
  end

  break if counter == 1 # counter == 7
  counter -=1
  # counter == 6
end

# B (incorrect)

numbers = [7, 3, 5, 2, 1, 8, 4]
counter = 0

loop do
  number = numbers[counter] # numbers[0] == 7
  counter = 0 # assigns counter inside of loop, need to use a different variable here

  loop do
    counter += 1
    puts counter

    break if counter >= number # break when counter hits 7
  end
  # counter is 7 here
  counter += 1
  # counter is 8 here
  break if counter >= numbers.size # 8 > 7
  # this loop will break after first iteration
end
