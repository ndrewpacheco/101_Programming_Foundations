VALID_CHOICES = ["Rock", "Paper", "Scissors"]

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(choice, computer)
  if (choice == "Rock" && computer == "Scissors") ||
     (choice == "Paper" && computer == "Rock") ||
     (choice == "Scissors" && computer == "Paper")
     prompt("You won")
  elsif
     (choice == "Rock" && computer == "Paper") ||
     (choice == "Paper" && computer == "Scissors") ||
     (choice == "Scissors" && computer == "Rock")
    prompt("You lose")
  else
    prompt("It's a tie")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You choose #{choice}, Computer choose #{computer_choice}")
  display_results(choice, computer_choice)

  prompt("Do you want to play again? Say 'y' if so")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end
