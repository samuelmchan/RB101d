# Question 1

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0] # 42

  a_outer_id = a_outer.object_id # 85
  b_outer_id = b_outer.object_id # 280
  c_outer_id = c_outer.object_id # 300
  d_outer_id = d_outer.object_id # 85

  puts "a_outer is #{42} with an id of: #{85} before the block."
  puts "b_outer is #{"forty two"} with an id of: #{280} before the block."
  puts "c_outer is #{[42]} with an id of: #{300} before the block."
  puts "d_outer is #{42} with an id of: #{85} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id # 85
    b_outer_inner_id = b_outer.object_id # 280
    c_outer_inner_id = c_outer.object_id # 300
    d_outer_inner_id = d_outer.object_id # 85

    puts "a_outer id was #{85} before the block and is: #{85} inside the block."
    puts "b_outer id was #{280} before the block and is: #{280} inside the block."
    puts "c_outer id was #{300} before the block and is: #{300} inside the block."
    puts "d_outer id was #{85} before the block and is: #{85} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0] # 44

    puts "a_outer inside after reassignment is #{22} with an id of: #{85} before and: #{45} after."
    puts "b_outer inside after reassignment is #{"thirty three"} with an id of: #{280} before and: #{320} after."
    puts "c_outer inside after reassignment is #{[44]} with an id of: #{300} before and: #{340} after."
    puts "d_outer inside after reassignment is #{44} with an id of: #{85} before and: #{89} after."
    puts


    a_inner = a_outer # 22
    b_inner = b_outer # "thirty three"
    c_inner = c_outer # [44]
    d_inner = c_inner[0] # 44

    a_inner_id = a_inner.object_id # 45
    b_inner_id = b_inner.object_id # 320
    c_inner_id = c_inner.object_id # 340
    d_inner_id = d_inner.object_id # 89

    puts "a_inner is #{22} with an id of: #{45} inside the block (compared to #{45} for outer)."
    puts "b_inner is #{"thirty three"} with an id of: #{320} inside the block (compared to #{320} for outer)."
    puts "c_inner is #{[44]} with an id of: #{340} inside the block (compared to #{340} for outer)."
    puts "d_inner is #{44} with an id of: #{89} inside the block (compared to #{89} for outer)."
    puts
  end

  puts "a_outer is #{22} with an id of: #{85} BEFORE and: #{45} AFTER the block."
  puts "b_outer is #{"thirty three"} with an id of: #{280} BEFORE and: #{320} AFTER the block."
  puts "c_outer is #{[44]} with an id of: #{300} BEFORE and: #{340} AFTER the block."
  puts "d_outer is #{44} with an id of: #{85} BEFORE and: #{89} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # a_inner does not exist outside of block
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # b_inner does not exist outside of block
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # c_inner does not exist outside of block
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # d_inner does not exist outside of block
end

# Question 2

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id) # The method call has no effect becuase assignement is not mutating


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end

# Question 3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # Non Mutating
  an_array_param << "rutabaga" # Mutating
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkins"
puts "My array looks like this now: #{my_array}" # ["pumpkins","rutabaga"]

# Question 4

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}" # ["pumpkins"]

# Question 5

def add_rutabaga!(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

def add_rutabaga(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += "rutabaga"
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
add_rutabaga!(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6

def color_valid(color)
  color == 'blue' || color == 'green'
end
