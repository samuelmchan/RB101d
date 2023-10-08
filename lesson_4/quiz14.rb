# Question 14

['green', 'blue', 'red'].some_method do |word|
  puts word # => nil, outputs green blue red
  word.upcase # => GREEN BlUE RED (truthy)
end
# => ['GREEN', 'BLUE', 'RED']


# some_method = each => ['green', 'blue', 'red']
# some_method = select => ['green', 'blue', 'red']
# some_method = map => ['GREEN', 'BLUE', 'RED']

# answer map
