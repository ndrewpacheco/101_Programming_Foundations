# # m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# user input: 
# loan_duration
# apr
# loan_amount

def prompt(message)
  puts "=> #{message}"
end

def no_dollar_signs(number)
  # number.delete! "$" if number[0] == "$"
  number.delete! "$"
end

prompt("Welcome to the mortgage calculator!")
prompt("How much is your loan?")
loan_amount = gets.chomp
puts loan_amount
no_dollar_signs(loan_amount)
puts loan_amount
# puts valid_number(loan_amount)

