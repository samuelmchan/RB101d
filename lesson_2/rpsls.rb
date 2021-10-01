VALID_MOVES = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'l' => 'lizard',
  'k' => 'spock'
}

GAME_RULES = {
  'cuts' => [%w(scissors paper)],
  'covers' => [%w(paper rock)],
  'crushes' => [%w(rock lizard), %w(rock scissors)], # rock only has one verb
  'posions' => [%w(lizard spock)],
  'smashes' => [%w(spock scissors)],
  'decapitates' => [%w(scissors lizard)],
  'eats' => [%w(lizard paper)],
  'disproves' => [%w(paper spock)],
  'vaporizes' => [%w(spock rock)]
}

def prompt(msg)
  puts "=> #{msg}"
end

def line
  puts('_______________________________________________________________')
end

def thinking
  sleep(0.5)
  prompt('...')
  sleep(0.5)
  prompt('.........')
  sleep(0.5)
end

def display_movelist
  prompt('') # spacer
  VALID_MOVES.each do |key, value|
    prompt("    #{key.upcase} is for #{value.capitalize}")
  end
end

def valid_input?(user_input) # boolean, validates user input
  VALID_MOVES.map { |_key, value| value }.include?(user_input) ||
    VALID_MOVES.map { |key, _value| key }.include?(user_input)
end

def convert_input(user_input) # convert user shortcut input to a valid move
  if VALID_MOVES.map { |_key, value| value }.include?(user_input)
    user_input
  elsif VALID_MOVES.map { |key, _value| key }.include?(user_input)
    VALID_MOVES[user_input]
  end
end

def tie?(player_move, computer_move)
  player_move == computer_move # boolean, checks for a tie
end

def win?(winner, loser) # boolean, checks if winner has a winning combination
  (GAME_RULES.map { |_key, value| value }).flatten(1).include?([winner, loser])
end

def verb(winner, loser) # iterates through GAME_RULES and returns verb
  GAME_RULES.each do |key, value|
    return key if value.include?([winner, loser])
  end
end

def flavor_text(subject, object)
  prompt("#{subject.capitalize} #{verb(subject, object)} #{object}!")
end

def display_results(player, computer)
  if tie?(player, computer)
    prompt("The game is a tie!")
  elsif win?(player, computer) # You win
    flavor_text(player, computer)
    prompt("You win this round")
  else # You lose
    flavor_text(computer, player)
    prompt("The computer wins this round")
  end
end

def update_score(player, computer, score_board)
  if win?(player, computer)
    score_board[0] += 1
  elsif win?(computer, player)
    score_board[1] += 1
  end
end

def display_score(score_board)
  prompt("Current score: Player #{score_board[0]} | Computer #{score_board[1]}")
end

def match_result(score_board)
  if score_board[0] > score_board[1]
    prompt("You beat the computer #{score_board[0]} to #{score_board[1]}!")
  else
    prompt("The computer beat you #{score_board[1]} to #{score_board[0]}")
    prompt("Better luck next time!")
  end
end

loop do
  prompt <<-MSG
Welcome to '#{VALID_MOVES.map { |_key, value| value }.join(' ').capitalize}'!
=> I'm not explaining the rules, so figure it out yourself
=> Be the first to win three rounds against the computer
MSG

  display_movelist()

  score_board = [0, 0] # [player score, comptuer score]
  round_counter = 1

  loop do
    user_input = ''
    line()
    display_score(score_board)
    prompt("Choose your move for round ##{round_counter}")

    loop do
      user_input = gets.chomp.downcase
      break if valid_input?(user_input)
      prompt('Thats not a valid move, try again: ')
    end

    player_move = convert_input(user_input)
    computer_move = VALID_MOVES.map { |_key, value| value }.sample

    prompt("You have chosen #{player_move}")
    thinking()
    prompt("The computer has chosen #{computer_move}")

    display_results(player_move, computer_move)
    update_score(player_move, computer_move, score_board)
    round_counter += 1
    break if score_board.include?(3)
    sleep(1)
  end

  line()
  match_result(score_board)
  prompt('')
  prompt("Would you like to play again?: Y/N ")
  break unless gets.chomp.downcase.start_with?('y')
  system 'clear'
end
