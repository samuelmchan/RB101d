# Identify all the code samples which are examples of selection.

# A (not selection)
arr = [1, 2, 3, 4, 5]
counter = 0

new_arr = []

loop do
  num = arr[counter] # arr[0] => 1
  if num >= 3
    new_arr << 0
  else
    new_arr << num * 2 # selection is not supposed to return items that aren't in the orignal collection
  end

  counter += 1
  break if counter == arr.size
end


# B (selection)

hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
counter = 0

new_hsh = {}

for letter, fruit in hsh
  new_hsh[letter] = fruit if fruit.size > 4
end

# C (selection)

def some_method(words)
  arr = []
  counter = 0

  loop do
    word = words[counter]
    arr << word if word.size < 4

    counter += 1
    break if counter == words.size
  end

  arr
end

poem = %w(April is the cruelest month)
some_method(poem)

# D (not selection)

num_arr = [2, 4, 7, 8, 11, 15]
counter = 0

until counter == num_arr.size
  puts num_arr[counter] + 1

  counter += 1
end
