# Question 12

['a', 'b', 'c'].some_method do |item|
  puts item # => nil
end
# => []

# some_method = each => ['a', 'b', 'c']
# some_method = select => []
# some_method = map => [nil, nil, nil]

# answer is Select, nil is falsy therefore nothing is selected
