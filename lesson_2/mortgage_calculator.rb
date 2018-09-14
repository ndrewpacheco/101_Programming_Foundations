def prompt(message)
  puts "=> #{message}"
end

def remove_dollar_signs(number)
  number.delete! "$"
end

def not_valid_number?(number)
  number.empty? || number.to_f < 0 || number.to_f.to_s() != number
end

prompt("Welcome to the mortgage calculator!")

loan_amount = ''
loop do 
  prompt("How much is your loan?")
  loan_amount = gets.chomp
  if not_valid_number?(loan_amount)
    prompt("Please enter a positive number")
  else
    remove_dollar_signs(loan_amount)
    break
  end
end

loan_duration_in_months = ''
loop do
  prompt("How many years is your loan?")
  loan_duration_in_years = gets.chomp
  if not_valid_number?(loan_duration_in_years)
    prompt("Please enter a positive number")
  else
    loan_duration_in_months = loan_duration_in_years.to_i * 12
    break
  end
end

interest_rate = ''
apr_prompt = <<-MSG
What is your Annual Percentage Rate?
Please choose a number from 1-99
MSG

loop do
  prompt(apr_prompt)
  interest_rate = gets.chomp.to_f
  if (interest_rate > 100) || (interest_rate < 1) || not_valid_number?(interest_rate)
    prompt("Number must be 1-99, try again")
  else
    break
  end
end

annual_interest_rate = interest_rate.to_f / 100
monthly_interest_rate = annual_interest_rate / 12
monthly_payment = loan_amount.to_i *
                  (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**-loan_duration_in_months))

prompt("Your monthly payment will be $#{format('%02.2f', monthly_payment)}")
