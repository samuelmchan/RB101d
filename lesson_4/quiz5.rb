# Question 5

sentence = 'The sky was blue'
camel(sentence) # => 'TheSkyWasBlue'


def camel(str)
  words = str.split(' ') # ['The', 'sky', 'was', 'blue']
  counter = 0

  while counter > words.size # words.size == 4 counter == 0 => false !error
    words[counter] = words[counter].capitalize

    counter = counter + 1
  end

  words.join
end

# Answer B: while counter > words.size, > should be <
