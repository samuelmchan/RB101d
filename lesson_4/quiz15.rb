# Question 15


{a: 1, b: 2, c: 3, d: 4, e: 5}.some_method do |_, num|
  plus_one = num + 1 # => num + 1
  puts "#{num} plus 1 is #{plus_one}" # outputs string, returns nil
end
# => {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5}


# some_method = each => {a: 1, b: 2, c: 3, d: 4, e: 5}
# some_method = select => {}
# some_method = map => [nil, nil, nil, nil, nil]
