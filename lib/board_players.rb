class Board
  @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def update_cell
      @cell[@mark -1] == @current_player
  end
  def is_available
    @cell[@mark-1].is_a?(integer)
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
