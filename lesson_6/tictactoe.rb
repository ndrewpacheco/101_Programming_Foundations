require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
[[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
[[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}"
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  # new_board[1] = PLAYER_MARKER # test
  # new_board[2] = PLAYER_MARKER  # test
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, seperator = ', ', last_word = 'or')
  string = ''
  array.each do |item|
    if item == array.first && array.size <= 2
      string += "#{item} "
    elsif item == array.last
      string += "#{last_word} #{item}"
    else
      string += "#{item}#{seperator}"
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

def find_at_risk_square(brd)
  threats = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).any?(INITIAL_MARKER)
  end
  if threats.size >= 1
    threats.first.select {|num| brd[num] == INITIAL_MARKER}[0]
  end
end

def computer_places_piece!(brd)
  find_at_risk_square(brd)
 
     if find_at_risk_square(brd).nil?
      square = empty_squares(brd).sample
    else
      square = find_at_risk_square(brd)
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

loop do
  score = {
    player: 0,
    computer: 0
  }
  loop do
    board = initialize_board
    
    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won this set!"

    else
      prompt "It's a tie."
    end
    score[:player] += 1 if winner == "Player"
    score[:computer] += 1 if winner == "Computer"
    puts "The score is Player: #{score[:player]}, Computer: #{score[:computer]}"

    if score[:player] == 2 # should be 5, but for ease of testing its 2
      prompt "Player Wins!"
      break
    elsif score[:computer] == 2 # should be 5, but for ease of testing its 2
      prompt "Computer Wins!"
      break
    else
     prompt "Press any key to continue"
     answer = gets.chomp
   end
 end
 prompt "Play again? (y or n)"
 answer = gets.chomp
 break unless answer.downcase.start_with?('y')
end
prompt "Thanks for playing Tic Tac Toe"
