require 'rspec'
require_relative '../lib/player'
require_relative '../lib/computer_player'
require_relative '../lib/game'

describe Player do
  let(:player) { Player.new('X') }

  it 'has a symbol' do
    expect(player.symbol).to eq('X')
  end
end

describe ComputerPlayer do
  let(:computer) { ComputerPlayer.new('O') }

  it 'has a symbol' do
    expect(computer.symbol).to eq('O')
  end

  it 'chooses a valid move' do
    board = ['X', 'O', ' ', ' ', 'X', ' ', 'O', ' ', ' ']
    move = computer.get_move(board)
    expect(move).to be_between(0, 8).or(be_nil)
    expect(board[move - 1]).to eq(' ') if move
  end
end

describe Game do
  let(:game) { Game.new('X', 'O') }

  it 'creates a new game with an empty board' do
    expect(game.board).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  end

  it 'switches players' do
    expect(game.current_player.symbol).to eq('X')
    game.switch_player
    expect(game.current_player.symbol).to eq('O')
  end

  it 'makes a valid move' do
    expect(game.make_move(1)).to be true
    expect(game.board[0]).to eq('X')
  end

  it 'does not make an invalid move' do
    game.make_move(1)
    expect(game.make_move(1)).to be false
    expect(game.make_move(10)).to be false
  end

  it 'detects a winner' do
    game.board[0] = 'X'
    game.board[1] = 'X'
    game.board[2] = 'X'
    expect(game.winner?).to eq('X')
  end

  it 'detects a draw' do
    game.board = %w[X O X O X O O X O]
    expect(game.draw?).to be true
  end

  it 'detects no winner and no draw' do
    game.board = ['X', 'O', 'X', 'O', ' ', 'O', 'O', 'X', 'O']
    expect(game.draw?).to be false
    expect(game.winner?).to be_nil
  end
end
