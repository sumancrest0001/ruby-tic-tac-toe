# frozen_string_literal: true

class GameLogic
  attr_reader :wining_compositions
  attr_accessor :cells
  def initialize
    @wining_compositions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def check_empty_space
    @cells.any?(Integer)
  end

  def game_end(winner)
    return true if !winner.nil? || check_empty_space == false
  end

  def check_existance(mark)
    @cells.include? mark
  end
end
