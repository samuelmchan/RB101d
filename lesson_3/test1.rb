def add_rutabaga_to_string(string_param)
  string_param = string_param + "rutabaga"
end

def add_rutabaga_to_array(array_param)
  array_param += ["rutabaga"]
end

my_string = "pumpkins"
my_string = add_rutabaga_to_string(my_string)

puts "My string looks like this now: #{my_string}"

my_array = ["pumpkins"]
my_array = add_rutabaga_to_array(my_array)


puts "My array looks like this now: #{my_array}"
