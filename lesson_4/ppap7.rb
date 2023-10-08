statement = "The Flintstones Rock"

statement.delete(" ").chars.sort.each_with_object({}) do |char, hash|
  hash.store(char, statement.count(char))
end
