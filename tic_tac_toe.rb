# frozen_string_literal: true

# Human players can play with numeric choices on a GameBoard.
class GameBoard
  attr_accessor :grid_values, :top, :mid, :bot

  WIN_CONDITIONS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @grid_values = [nil, *1..9]
  end

  def write_grid_values
    @top = "\n #{@grid_values[1]} | #{@grid_values[2]} | #{@grid_values[3]} "
    @mid =   " #{@grid_values[4]} | #{@grid_values[5]} | #{@grid_values[6]} "
    @bot =   " #{@grid_values[7]} | #{@grid_values[8]} | #{@grid_values[9]} "
  end

  def display_grid
    puts "#{top}\n-----------\n#{mid}\n-----------\n#{bot}"
  end

  def switch_player
    @grid_values[0] = @grid_values[0] == 'X' ? 'O' : 'X'
  end

  def win?
    WIN_CONDITIONS.any? do |condition|
      board_values = condition.map { |index| @grid_values[index] }
      board_values.uniq == [@grid_values[0]]
    end
  end
end

# Cut this down with other methods
def choose(game)
  puts "\nChoose where #{game.grid_values[0]} will play next.\n "
  loop do
    input = gets.chomp
    if input.match?(/^[1-9]$/)
      index = input.to_i
      return index if game.grid_values[index].is_a?(Integer)

      puts "That space is already taken by #{game.grid_values[index]}.\nTry again.\n "

    else
      puts "I have no idea where #{input} is.\nTry again.\n "
    end
  end
end

def play_game
  game = GameBoard.new
  9.times do
    game.write_grid_values
    game.display_grid
    game.switch_player
    game.grid_values[choose(game)] = game.grid_values[0]
    if game.win?
      puts "\n#{game.grid_values[0]} has won the game!"
      break
    end
  end
  game.write_grid_values
  game.display_grid
  puts "\nWould you like to play again?\n "
end

play_game
