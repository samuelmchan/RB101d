['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# hash[]= is alias for the syntax hash.store(key, value)
# We will refactor 'hash[value[0]] = value' to 'hash.store(value[0], hash)' -
# for clarity

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash.store(value[0], value)
end

#--------------------------------First Iteration--------------------
# Enumerator => 0
# |value| => 'ant'
# |hash| => {} |hash| at the start of the iteration.
#  value[0] is 'ant'[0] => 'a'
# hash.store adds the key value pair 'a' => 'ant' to the end of the hash
# |hash| => {'a' => 'ant'} after iteration.

#--------------------------------Second Iteration--------------------
# Enumerator => 1
# |value| => 'bear'
# |hash| => {'a' => 'ant'} |hash| at the start of the iteration.
#  value[0] is 'bear'[0] => 'b'
# hash.store adds the key value pair 'b' => 'bear' to the end of the hash
# |hash| => {'a' => 'ant', 'b' => 'bear'} after iteration.

#--------------------------------Third Iteration--------------------
# Enumerator => 2
# |value| => 'cat'
# |hash| => {'a' => 'ant', 'b' => 'bear'} at the start of the iteration
#  value[0] is 'cat'[0] => 'c'
# hash.store adds the key value pair 'c' => 'cat' to the end of the hash
# |hash| is now: {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'} after iteration.

#--------------------------------Return Value of Method--------------------
# each_with_object method when invoked with a block returns -
# the object {} passed through the parameter. -
# therefore, the return value after all 3 iterations is:
#
# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
