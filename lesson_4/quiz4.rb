# Question 4
sentence = 'The sky was blue'
snake(sentence) # => 'the_sky_was_blue'


def snake(str)
  words = str.split # ['The', 'sky', 'was', 'blue']
  current_word = 1 # error: this should be 0 instead of 1

  loop do
    words[current_word].downcase! # words[current_word] == 'sky'

    current_word += 1 # 2
    break if current_word >= words.size # 2 < 4  => false
  end
# ..after 2 more iterations
# words = ['The', 'sky', 'was', 'blue']
  words.join('_') # => 'The_sky_was_blue'
end

# answer A current_word = 1
