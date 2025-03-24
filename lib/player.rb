class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def get_move(board)
    print "#{symbol}'s turn. Enter a position (1-9): "
    gets.chomp.to_i
  end
end
