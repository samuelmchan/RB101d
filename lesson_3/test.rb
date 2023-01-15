def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  dot_separated_words.each do |word|
    if is_an_ip_number?(word)
      next
    else
      false
    end
    return true
  end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      next unless is_an_ip_number?(word)
      return false
    end
  return true
end   
