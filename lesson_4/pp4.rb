['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash.store(value[0], value)
end

{
  "a" => 'ant'
  "b" => 'bear'
  "c" => 'cat'
}
