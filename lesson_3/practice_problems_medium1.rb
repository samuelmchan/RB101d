# Question 1

10.times { |u| puts ('The Flintstones Rock'.rjust(20 + u)) }
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2

puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Question 3

def factors(num)
  factor = []
  for int in (1..num) do
    factor << num / int if num % int == 0
  end
  factor
end

# Question 4

# rolling_buffer1 mutates the caller / rolling_buffer2 does not

# Question 5

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# Question 6

answer = 42

def mess_with_it(some_number)
  some_number += 8 # assignment is not mutating
end

new_answer = mess_with_it(answer)

p answer - 8 # 34

# Question 7

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42 # indexed assignment IS mutating
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# Question 8

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# puts rps(rps("paper", rps("rock", "scissors")), "rock")
# puts rps(rps("paper", "rock"), "rock")
# puts rps("paper", "rock")
# puts "paper"

# Question 9

def foo(param = "no") # default's to no
  "yes" # returns yes
end

def bar(param = "no") # "yes"
  param == "no" ? "yes" : "no"
end

bar(foo) # no
