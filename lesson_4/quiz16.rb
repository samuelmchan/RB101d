# Question 16

pets = ['cat', 'parrot', 'dog', 'fish']
pets.map do |pet|
  pet.size == 3 # false
end

# => [false, false, false, false]

# A The method called on the pets array considers the return value of the block. Yes
# B The method called on the pets array will return the original array. No
# C The method called on the pets array will return a new array. Yes
# D The method called on the pets array will return only the items from the array which meet the criteria set in the block. No

#answer A, C
