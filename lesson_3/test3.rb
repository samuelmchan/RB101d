def some_method
  ["sam", "robyn", "darren"]
end

s = "steve"
r = "robert"
d = "danny"

p s
p r
p d

s, r, d = some_method

p s
p r
p d
