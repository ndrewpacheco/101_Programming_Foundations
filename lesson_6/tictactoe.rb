
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_SCORE = 1

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd, score)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}"
  puts "The first player to #{WINNING_SCORE} points is the winner!"
  puts "Player: #{score[:player]} Computer: #{score[:computer]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, seperator = ', ', last_word = 'or')
  string = ''
  array.each do |item|
    string += if item == array.first && array.size <= 2
                "#{item} "
              elsif item == array.last
                "#{last_word} #{item}"
              else
                "#{item}#{seperator}"
              end
  end
  puts string
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def threat(brd)
  threats = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).any?(INITIAL_MARKER)
  end
  if threats.size >= 1
    threats.first.select { |num| brd[num] == INITIAL_MARKER }[0]
  else
    0
  end
end

def winning_number(brd)
  winning_numbers = WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
      brd.values_at(*line).any?(INITIAL_MARKER)
  end
  if winning_numbers.size >= 1
    winning_numbers.first.select { |num| brd[num] == INITIAL_MARKER }[0]
  else
    0
  end
end

def find_at_risk_square(brd)
  if winning_number(brd) >= 1
    winning_number(brd)
  elsif threat(brd) >= 1
    threat(brd)
  end
end

def computer_places_piece!(brd)
  square = if find_at_risk_square(brd)
             find_at_risk_square(brd)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def place_piece!(board, current_player)
  player_places_piece!(board) if current_player == "player"
  computer_places_piece!(board) if current_player == "computer"
end

def alternate_player(current_player)
  return 'computer' if current_player == 'player'
  return 'player' if current_player == 'computer'
end

loop do
  score = {
    player: 0,
    computer: 0
  }
  choice = ""
  loop do
    prompt <<~MSG
    Who plays first?
      Type 'player' for Player
      Type 'computer' for Computer
      Type 'choose' for random"
    MSG

    choice = gets.chomp.downcase
    choices = ['player', 'computer', 'choose']
    break if choices.include?(choice)
    prompt "Not a valid answer, try again"
  end
  loop do
    board = initialize_board
    case choice
    when 'player' then current_player = 'player'
    when 'computer' then current_player = 'computer'
    when 'choose' then current_player = ['player', 'computer'].sample
    end

    loop do
      display_board(board, score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
    display_board(board, score)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won this set!"

    else
      prompt "It's a tie."
    end
    score[:player] += 1 if winner == "Player"
    score[:computer] += 1 if winner == "Computer"

    if score[:player] == WINNING_SCORE
      prompt "Player Wins!"
      break
    elsif score[:computer] == WINNING_SCORE
      prompt "Computer Wins!"
      break
    else
      prompt "Press any key to continue"
      gets.chomp
    end
  end
  answer = ''
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    valid_answers = ["y", "n"]
    break if valid_answers.include?(answer)
    prompt "That was not a valid answer, try again."
  end
  break unless answer == 'y'
end
prompt "Thanks for playing Tic Tac Toe"
