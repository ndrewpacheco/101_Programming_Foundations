
VALID_CHOICES = {
  rock: "r",
  paper: "p",
  scissors: "sc",
  lizard: "l",
  spock: "sp"
}

WINNING_COMBOS = {
  r: ['sc', 'l'],
  p: ['r', 'p'],
  sc: ['p', 'l'],
  l: ['sp', 'p'],
  sp: ['r', 'sc']
}
loop do
  player_score = 0
  computer_score = 0
  display_choices = VALID_CHOICES.map { |k, v| "#{k.capitalize}; type (#{v})" }
  display_choices = display_choices.join(", ")

  def prompt(message)
    Kernel.puts("=> #{message}")
  end

  def win?(first, second)
    WINNING_COMBOS[first.to_sym].include?(second)
    # original logic:
    # (first == "r" && second == "sc") ||
    #   (first == "p" && second == "r") ||
    #   (first == "sc" && second == "p") ||
    #   (first == "r" && second == "l") ||
    #   (first == "l" && second == "sp") ||
    #   (first == "sp" && second == "sc") ||
    #   (first == "sc" && second == "l") ||
    #   (first == "l" && second == "p") ||
    #   (first == "p" && second == "sp") ||
    #   (first == "sp" && second == "r")
  end

  def display_results(player, computer)
    if win?(player, computer)
      prompt("You won this round")
    elsif win?(computer, player)
      prompt("You lose this round")
    else
      prompt("It's a tie")
    end
  end

  loop do
    choice = ''
    loop do
      prompt("Choose one: #{display_choices}")
      choice = Kernel.gets().chomp()
      if VALID_CHOICES.value?(choice)
        break
      else
        prompt("That is not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.to_a.sample[1].to_s
    choice_to_str = VALID_CHOICES.key(choice)
    computer_choice_to_str = VALID_CHOICES.key(computer_choice)

    prompt("You chose #{choice_to_str},
      Computer chose #{computer_choice_to_str}")
    display_results(choice, computer_choice)

    player_score += 1 if win?(choice, computer_choice)
    computer_score += 1 if win?(computer_choice, choice)
    prompt("Score so far is You: #{player_score}, Computer: #{computer_score}")

    if player_score == 5
      prompt("You Won!")
      break
    elsif computer_score == 5
      prompt("Computer Won!")
      break
    end
  end

  prompt("Do you want to play again? Say 'y' if so")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end
