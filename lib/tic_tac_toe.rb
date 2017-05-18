class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(board = nil)
   @board =  [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
  end

  def move(position, char)
    @board[position] = char
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      return false
    else return true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      return true
    end
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    input_to_index_var = input_to_index(input)
    if valid_move?(input_to_index_var)
      move(input_to_index_var, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |plays|
      if (plays == "X" || plays == "O")
       counter += 1
      end
    end
    return counter
  end

  def won?

    counterX = 0
    counterO = 0

    WIN_COMBINATIONS.each do |win|
      counterX = 0
      counterO = 0
     win.each do |position|
        if @board[position] == "X"
          counterX += 1
        end
        if @board[position] == "O"
          counterO += 1
        end
        if counterX == 3 || counterO == 3
          return win
        end
     end
    end
    return false
  end

  def current_player
    if turn_count(@board) % 2 == 0
      return "X"
    else
      return "O"

    end
  end

  def full?
    @board.each do |position|
     if position != "O" && position != "X"
      return false
     end
    end
    return true
  end

  def draw?
     if !won? && full?
       return true
     end
  end


  def over?
   if won? || full? || draw?
     return true
   end
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"

    end
  end


  def winner
    if won?
       won?.each do |pos|
         if @board[pos] == "X"
           return "X"
        end
        if @board[pos] == "O"
          return "O"
        end
      end
    end
  end

  def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end

  end

end
