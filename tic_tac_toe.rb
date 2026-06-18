# frozen_string_literal: true

# Human players can play with numeric choices on a GameBoard.
class GameBoard
  attr_accessor :g1, :g2, :g3, :g4, :g5, :g6, :g7, :g8, :g9
  attr_reader :top, :mid, :bot

  def initialize
    @g1 = "1"
    @g2 = "2"
    @g3 = "3"
    @g4 = "4"
    @g5 = "5"
    @g6 = "6"
    @g7 = "7"
    @g8 = "8"
    @g9 = "9"
    @top = " #{@g1} | #{@g2} | #{@g3} "
    @mid = " #{@g4} | #{@g5} | #{@g6} "
    @bot = " #{@g7} | #{@g8} | #{@g9} "
  end
end

def play_game
  game = GameBoard.new
  puts "#{game.top}\n-----------\n#{game.mid}\n-----------\n#{game.bot}"
end

play_game
