VALID_CHOICES = {
  rock: "r",
  paper: "p",
  scissors: "sc",
  lizard: "l",
  spock: "sp"
}

display_choices = VALID_CHOICES.map {|k,v| "#{k.capitalize}; type (#{v})"}.join(", ")

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == "r" && second == "sc") ||
    (first == "p" && second == "r") ||
    (first == "sc" && second == "p") ||
    (first == "r" && second == "l") || 
    (first == "l" && second == "sp") ||
    (first == "sp" && second == "sc") ||
    (first == "sc" && second == "l") ||
    (first == "l" && second == "p") ||
    (first == "p" && second == "sp") ||
    (first == "sp" && second == "r")  
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won")
  elsif win?(computer, player)
    prompt("You lose")
  else
    prompt("It's a tie")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{display_choices}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.has_value?(choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.to_a.sample[1].to_s
  choice_to_str = VALID_CHOICES.key(choice)
  computer_choice_to_str = VALID_CHOICES.key(computer_choice)

  prompt("You chose #{choice_to_str}, Computer chose #{computer_choice_to_str}")
  display_results(choice, computer_choice)

  prompt("Do you want to play again? Say 'y' if so")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end
