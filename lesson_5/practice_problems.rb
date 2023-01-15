# Problem 1
arr = ['10', '11', '9', '7', '8']

arr.sort_by do |str|
  str.to_i
end.reverse

# Problem 2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |hash|
  hash[:published].to_i
end

# Problem 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0]
hsh1['b'][1]
hsh2[:third].key(0)

# Problem 4

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4

# Problem 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.select { |_, value| value["gender"] == "male" }.map do |_, value|
  value["age"]
end.sum

# Alternative method

sum = 0
munsters.each do |_, value|
  sum += value["age"] if (value["gender"] == "male")
end

# Problem 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  puts "#{key} is a #{value['age']} old #{value['gender']}"
end

# Problem 7

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a = 2
# b = [3, 8]

# Problem 8

hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.each do |key, value|
  value.each do |word|
    word.each_char do |char|
      puts char if %w(a e i o u).include?(char.downcase)
    end
  end
end

# Problem 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]


arr.map do |subarr|
  subarr.sort.reverse
end

# Problem 10

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hash|
  copy = hash.dup
  copy.each_value do |value|
    value += 1
  end
  copy
end

# Problem 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |subarr|
  subarr.select do |int|
    int % 3 == 0
  end
end

# Problem 12

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr.each_with_object({}) do |subarr, obj|
  obj[subarr[0]] = subarr[1]
end

# Problem 13

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |subarr|
  subarr.select { |int| int % 2 != 0 }
end

# Problem 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.each_with_object([]) do |(_, value), obj|
  obj << value[:colors].map { |w| w.capitalize } if value[:type] == 'fruit'
  obj << value[:size].upcase if value[:type] == 'vegetable'
end

# Problem 15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, value|
    value.all? do |int|
      int.even?
    end
  end
end

# Problem 16

def uuid
  hexchars = %w(1 2 3 4 5 6 7 8 9 a b c d e f)
  hexstring = 'f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91'.chars
  hexstring.map! do |char|
    case char
    when '-'
      '-'
    else
      hexchars.sample
    end
  end
  hexstring.join
end

p uuid
