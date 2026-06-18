# frozen_string_literal: true

# Human players can play with numeric choices on a GameBoard.
class GameBoard
  attr_accessor :grid_values
  attr_reader :top, :mid, :bot

  def initialize
    @grid_values = [nil, *1..9]
    # change top, mid, bot to class methods
    @top = " #{@grid_values[1]} | #{@grid_values[2]} | #{@grid_values[3]} "
    @mid = " #{@grid_values[4]} | #{@grid_values[5]} | #{@grid_values[6]} "
    @bot = " #{@grid_values[7]} | #{@grid_values[8]} | #{@grid_values[9]} "
  end
end

# Cut this down with other methods
def choose(game)
  puts "Choose where #{game.grid_values[0]} will play next."
  loop do
    input = gets.chomp
    if input.match?(/^[1-9]$/)
      index = input.to_i
      if game.grid_values[index].is_a?(Integer)
        return index
      else
        puts "That space is already taken by #{game.grid_values[index]}.\nTry again."
      end
    else
      puts "I have no idea where #{input} is.\nTry again."
    end
  end
end

def play_game
  game = GameBoard.new
  # 9 times loop?
  puts "#{game.top}\n-----------\n#{game.mid}\n-----------\n#{game.bot}"
  # implement player switch
  game.grid_values[0] = "X"
  game.grid_values[choose(game)] = game.grid_values[0]
end

play_game
