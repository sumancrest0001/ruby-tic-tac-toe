require_relative '../bin/main'
class Board
  attr_accessor :cells
  def initialize
  @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  def update_cell
      @cells[@mark -1] == @current_player
  end
  def is_available
    @cells[@mark-1].is_a?(integer)
  end
end

class Players
  attr_accessor :player1_array, :player2_array
  def initialize
    @player1_array = []
    @player2_array = []
  end
  def store_mark
    if @current_player == @player1
      @player1_array.push(@mark)
    else
      @player2_array.push(@mark)
    end
  end

  def change_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
