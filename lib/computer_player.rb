require_relative 'player'

class ComputerPlayer < Player
  def get_move(board)
    available_moves = board.each_index.select { |i| board[i] == ' ' }
    move = available_moves.sample
    puts "#{symbol}'s turn. Computer chose position #{move + 1}"
    move + 1
  end
end
