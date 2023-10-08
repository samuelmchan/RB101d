# def add_rutabaga_to_string(string_param)
#   string_param = string_param + "rutabaga"
# end
#
# def add_rutabaga_to_array(array_param)
#   array_param += ["rutabaga"]
# end

def add_rutabaga(string, array)
  string += "rutabaga"
  array += ["rutabaga"]
  return string, array
end

my_string = "pumpkins"
my_array = ["pumpkins"]

# add_rutabaga(my_string, my_array) # ["pumpkins", ["pumpkins", "rutabaga"]]

my_string, my_array = add_rutabaga(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
