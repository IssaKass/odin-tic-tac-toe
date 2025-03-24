require_relative 'player'
require_relative 'computer_player'

class Game
  attr_accessor :board
  attr_reader :player1, :player2, :current_player

  def initialize(player1_symbol, player2_symbol, computer_player = false)
    @board = Array.new(9, ' ')
    @player1 = Player.new(player1_symbol)
    @player2 = computer_player ? ComputerPlayer.new(player2_symbol) : Player.new(player2_symbol)
    @current_player = @player1
  end

  def display_board
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '---+---+---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '---+---+---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n\n"
  end

  def make_move(position)
    position -= 1
    return false unless valid_move?(position)

    @board[position] = @current_player.symbol
    switch_player
    true
  end

  def valid_move?(position)
    position.between?(0, 8) && @board[position] == ' '
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def winner?
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [7, 8, 9],  # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
      [0, 4, 8], [2, 4, 6]              # Diagonals
    ]

    winning_combinations.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != ' '
        return @board[combo[0]]
      end
    end
    nil
  end

  def draw?
    @board.none?(' ')
  end

  def play
    puts 'Tic Tac Toe!'
    display_board

    until winner? || draw?
      position = @current_player.get_move(@board)

      puts 'Invalid move. Try again.' unless make_move(position)

      display_board
    end

    if winner?
      puts "#{winner?} wins!"
    else
      puts "It's a draw!"
    end
  end
end
