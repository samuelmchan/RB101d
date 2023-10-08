require 'yaml'

MESSAGES = YAML.`load_file('mortgage_messages.yml')

def monthly_payment(loan_amount, interest_rate, duration)
  loan_amount * (interest_rate / (1 - (1 + interest_rate)**(-duration)))
end

def prompt(msg)
  puts "=>#{msg}"
end

def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
end

def number?(input)
  integer?(input) || float?(input)
end

loan_amount = ''
duration_input = ''
duration_period = ''
intrest_rate = ''

puts MESSAGES['welcome']
sleep(0.5)

prompt(MESSAGES['amt'])

loop do
  loan_amount = gets.chomp
  break if number?(loan_amount) && loan_amount.to_f > 0
  prompt(MESSAGES['invalid_amt'])
end

puts "Your loan amount is $#{format('%.2f', loan_amount)}."
sleep(0.5)

prompt(MESSAGES['verify_unit'])

loop do
  duration_period = gets.chomp
  break if %w(Y M).include?(duration_period.upcase)
  prompt(MESSAGES['invalid_input'])
end

duration_period_unit =  if duration_period.upcase.include?('Y')
                          'years'
                        elsif duration_period.upcase.include?('M')
                          'months'
                        end

prompt("How many #{duration_period_unit} is your loan term?: ")

loop do
  duration_input = gets.chomp
  break if integer?(duration_input)
  prompt(MESSAGES['invalid_amt'])
end

mduration = if duration_period.upcase.include?('Y')
              duration_input.to_i * 12
            elsif duration_period.upcase.include?('M')
              duration_input.to_i
            end

puts "Your loan duration is #{duration_input} #{duration_period_unit}"
sleep(0.5)

prompt(MESSAGES['rate'])

loop do
  intrest_rate = gets.chomp
  break if number?(intrest_rate) && intrest_rate.to_f > 0
  prompt(MESSAGES['invalid_amt'])
end

puts "Your qouted interest rate (APR) is #{intrest_rate} percent."

interest_rate = intrest_rate.to_f / 1200
sleep(0.5)

puts "Calculating your monthly payment amount....."
sleep(1)

result = monthly_payment(loan_amount.to_f, interest_rate.to_f, mduration.to_f)

puts "Your monthly payment ammount is: $#{format('%.2f', result)}."
