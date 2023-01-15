# Question 17

flavors = ['chocolate', 'strawberry', 'mint', 'vanilla']
flavors.reject { |flavor| puts flavor # => nil}

# outputs: chocolate / strawberry / mint / vanilla
# => ['chocolate', 'strawberry', 'mint', 'vanilla']



# A The method called on the flavors array will return an empty array. False
# B The method called on the flavors array ignores the return value of the block. False
# C The method called on the flavors array returns a reference to the original array. False
# D The method called on the flavors array considers only the truthiness of the block's return value. True


# A, B, C
