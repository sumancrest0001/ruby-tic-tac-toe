# frozen_string_literal: true

class GameLogic
  attr_accessor :winner, :player1_array, :player2_array, :cells, :player1, :player2, :current_player, :mark
  @@wining_compositions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  def initialize
    @winner = nil
    @player1 = nil
    @player2 = nil
    @current_player = nil
    @player1_array = []
    @player2_array = []
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  def check_winner
  for i in 0...8
    if (@@wining_compositions[i] - @player1_array).empty?
       @winner = @player1
    elsif(@@wining_compositions[i] - @player2_array).empty?
      @winner = @player2
    end
  end
  @winner
end

def check_empty_space
  @cells.any?(Integer)
end


def game_end
  return true if @winner != nil || check_empty_space == false
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

def update_cell
    @cells[@mark - 1] = @current_player
end

end
