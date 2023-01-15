# Question 6

sentence = 'The sky was blue'
upper_snake(sentence) # => 'THE_SKY_WAS_BLUE'


def upper_snake(str) # suppose upper_snake(sentence)
  words = str.split # ['The', 'sky', 'was', 'blue']
  current_word = 0

  loop do
    current_word += 1 # this line should occur after words[current_word].upcase!
    break if current_word == words.size # 1 != 4

    words[current_word].upcase!  # => #SKY
  end

  words.join('_') # 'The_SKY_WAS_BlUE'
endD
