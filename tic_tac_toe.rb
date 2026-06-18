# frozen_string_literal: true

# Human players can play with numeric choices on a GameBoard.
class GameBoard
  attr_accessor :top, :mid, :bot

  def initialize
    @top = " 1 | 2 | 3 "
    @mid = " 4 | 5 | 6 "
    @bot = " 7 | 8 | 9 "
  end
end

def play_game
  game = GameBoard.new
  puts "#{game.top}\n-----------\n#{game.mid}\n-----------\n#{game.bot}"
end

play_game
