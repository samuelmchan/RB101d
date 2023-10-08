# Problem 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_object({}) do |value, object|
  object.store(value, flintstones.index(value))
end

# Problem 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.sum

# Problem 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! do |key, value|
  value <= 100
end

# Problem 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# Problem 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index do |str|
  str.start_with?('Be')
end

# Problem 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |str|
  str[0, 3]
end

# Problem 7

statement = "The Flintstones Rock"
letters = statement.chars
letters.delete(' ')
letters.uniq.each_with_object({}) do |value, obj|
  obj.store(value, letters.count(value))
end

# Problem 8

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1
# 3
# [1,4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1
# 2
# [1,4]

# Problem 9

words = "the flintstones rock"
def titleize(str)
  words = str.split(' ')
  words.each do |word|
    word.capitalize!
  end
  words.join(' ')
end

p titleize(words)

# Problem 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  if (0..17).include?(value['age'])
    value.store('age_group', 'kid')
  elsif (18..64).include?(value['age'])
    value.store('age_group', 'adult')
  else
    value.store('age_group', 'senior')
  end
end
