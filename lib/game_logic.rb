# frozen_string_literal: true

class GameLogic
  attr_reader :winner, :cells, :player1_array, :player2_array, :current_player
  attr_writer :player1, :player2, :mark, :again
  def initialize
    @wining_compositions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @winner = nil
    @player1_array = []
    @player2_array = []
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
