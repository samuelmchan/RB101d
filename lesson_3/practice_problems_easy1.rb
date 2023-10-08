# Question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers #

# 1
# 2
# 2
# 3
#________________________________________________
# Question 2
# what is != and where should you use it? '!= is not equal to'
# put ! before something, like !user_name '! is not, returns the opposite boolean value for user_name'
# put ! after something, like words.uniq! '! changes uniq in to mutating method'
# put ? before something 'when does this happen?'
# put ? after something 'part of a method'
# put !! before something, like !!user_name 'double negative'
#________________________________________________
# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
words = advice.split(' ')
words.map! { |word| word == 'important' ? ('urgent'):(word)}
advice = words.join(' ')
p advice

advice.gsub!('important', 'urgent')
# Question 4

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # deletes '2' returns deleted item (mutates array)
numbers.delete(1) # deletes '1' returns deleted item (mutates array)
# Question 5

p (10..100).cover?(40) # cover? is faster than include? when used on ranges

# Question 6
famous_words = "seven years ago..."
puts "Four score and " + famous_words
puts ("Four score and " << famous_words)

# Question 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten! # mutates the caller

# Question 8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# flintstones.keep_if { |key, value| key == "Barney" }
# flintstones.shift

# flintstones = flintstones.rassoc(2)
p flintstones.assoc('Barney')
p flintstones
