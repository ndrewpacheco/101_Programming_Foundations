# ask the user for two numbers
# as the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i.to_s() == number
end

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end
prompt("Hello #{name}!")
loop do # main loop
  number1 = ''
  number2 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must be 1, 2, 3 or 4")
    end
  end

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  def operation_to_message(op)
    case op
    when '1' then "Adding"
    when '2' then "Subtracting"
    when '3' then "Multiplying"
    when '4' then "Dividing"
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? Press Y to continue")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Goodbye!")
