# ask for two numbers
# ask for the type of operation to perform: add, subtract, multipy or divide
# displays the result
# output the result

def prompt(message)
  puts "=>#{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation(x, y, z)
  case z
  when '1'
    x.to_i + y.to_i
  when '2'
    x.to_i - y.to_i
  when '3'
    x.to_i * y.to_i
  when '4'
    x.to_f / y.to_f
  end
end

name = ''
number1 = 0
number2 = 0
operator = ''
prompt('Welcome to Calculator! Enter name:')

loop do
  name = gets.chomp
  if name.empty?
    prompt('Make sure to use a valid name')
  else
    break
  end
end

puts "Hi #{name}!"

loop do
  loop do
    prompt('What is the first number?')
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmm, that's not a valid number, try again")
    end
  end

  loop do
    prompt('What is the second number?')
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmm, that's not a valid number, try again")
    end
  end

  loop do
    operation_prompt = <<-OPROMPT
      What operation would you like to preform?
        Enter 1 to add
        Enter 2 to subtract
        Enter 3 to multiply
        Enter 4 to divide
    OPROMPT
    prompt(operation_prompt)
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Invalid option, Try again')
    end
  end

  prompt('Calculating...')
  prompt("Your result is #{operation(number1, number2, operator)}")
  prompt('Would you like to perform another calculation? Y/N: ')
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y')
end
