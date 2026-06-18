# frozen_string_literal: true

# Human players can play with numeric choices on a GameBoard.
class GameBoard
  attr_accessor :grid_values
  attr_reader :top, :mid, :bot

  def initialize
    @grid_values = [*1..9]
    @top = " #{@grid_values[0]} | #{@grid_values[1]} | #{@grid_values[2]} "
    @mid = " #{@grid_values[3]} | #{@grid_values[4]} | #{@grid_values[5]} "
    @bot = " #{@grid_values[6]} | #{@grid_values[7]} | #{@grid_values[8]} "
  end
end

def play_game
  game = GameBoard.new
  puts "#{game.top}\n-----------\n#{game.mid}\n-----------\n#{game.bot}"
end

play_game
