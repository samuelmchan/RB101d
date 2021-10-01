VALID_CHOICES = %w(rock paper scissors)

def prompt(msg)
  puts "=> #{msg}"
end

puts 'Welcome to Rock Paper and Scissors'
loop do
  player_choice = ''
  prompt('To Begin, Choose Rock, Paper or Scissors')

  loop do
    player_choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(player_choice)
    prompt("That's not a valid choice, choose rock, paper or scissors. Please try again: ")
  end

  puts "You have chosen #{player_choice}"

  computer_choice = VALID_CHOICES.sample

  puts "The computer has chosen #{computer_choice}"

  winner =  if player_choice == computer_choice
              'tie'
            elsif player_choice == 'rock' && computer_choice == 'paper'
              'computer'
            elsif player_choice == 'rock' && computer_choice == 'scissors'
              'player'
            elsif player_choice == 'paper' && computer_choice == 'rock'
              'player'
            elsif player_choice == 'paper' && computer_choice == 'scissors'
              'computer'
            elsif player_choice == 'scissors' && computer_choice == 'rock'
              'computer'
            elsif player_choice == 'scissors' && computer_choice == 'paper'
              'player'
            end

  case winner
  when 'player' then puts "You are the winner"
  when 'computer' then puts "The computer is the winner"
  else puts "It's a tie!"
  end
  prompt('Would you like to play again? Y/N: ')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing, good-bye!')
