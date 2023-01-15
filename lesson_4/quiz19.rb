# Question 19

# Identify all of the code implementations that correctly meet the following set of requirements.

# Given the following hash which contains keys representing countries
# and values representing the capital cities of those countries,
# return a new hash containing all of the key-value pairs
# where the country begins with the letter 'B'.

countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}


# A (incorrect)

countries_and_capitals.select { |_, country| country[0] == 'B' }

# countries_and_capitals = {
#   'Belgium' => 'Brussels',
#   'Barbados' => 'Bridgetown',
#   'Brazil' => 'Brasilia'
# }

# B (correct)

countries_and_capitals.each_with_object({}) do |(k, v), obj|
  obj[k] = v if k.chr == 'B'
end

# countries_and_capitals = {

#   'Belgium' => 'Brussels',
#   'Barbados' => 'Bridgetown',
#   'Bolivia' => 'La Paz',
#   'Brazil' => 'Brasilia'
# }

# C (correct)

def select_countries(hsh)
  sub_set = {}
  hsh.each_key do |country|
    if country[0] == 'B'
      sub_set[country] = hsh[country]
    end
  end
  sub_set
end

select_countries(countries_and_capitals)

# countries_and_capitals = {

#   'Belgium' => 'Brussels',
#   'Barbados' => 'Bridgetown',
#   'Bolivia' => 'La Paz',
#   'Brazil' => 'Brasilia'
# }


# D (incorrect)

def begins_with_b(string)
  string[0] == 'B' # => true or false
end

countries_and_capitals.find_all do |country, capital|
  begins_with_b(country)
end

# => ['Brussels', 'Bridgetown', 'La Paz', 'Brasilia']


# answer B & C
