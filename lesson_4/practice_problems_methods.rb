# Problem 1

[1, 2, 3].select do |num|
  num > 5
  'hi' # true
end
# [1, 2, 3]

# Problem 2

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# 2

# Problem 3

[1, 2, 3].reject do |num|
  puts num # nil
end

# [1, 2, 3]

# Problem 4

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# {'a' =>'ant', 'b' => 'bear', 'c' => 'cat'}

# Problem 5

hash = { a: 'ant', b: 'bear' }
hash.shift
# [a:, 'ant']
# Removes the first pair and returns as an array (destructive)

# Problem 6

['ant', 'bear', 'caterpillar'].pop.size
# 11
# Removes the last array item and returns it (destructive)

# Problem 7

[1, 2, 3].any? do |num|
  puts num
  num.odd? # reutrn value for block
end

# outputs
# 1
# returns true

# Problem 8
arr = [1, 2, 3, 4, 5]
arr.take(2)

# [1,2] (not destructive)

# Problem 9

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# [nil, 'bear']

# Problem 10

[1, 2, 3].map do |num|
  if num > 1
    puts num # nil
  else
    num #num
  end
end
# [1, nil, nil]
