require_relative 'lib/game'

puts 'Play against the computer? (y/n)'
computer_game = gets.chomp.downcase == 'y'

game = Game.new('X', 'O', computer_game)
game.play
