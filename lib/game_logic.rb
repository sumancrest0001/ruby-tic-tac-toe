class GameLogic
@wining_compositions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
def initialize
  @winner = nil
end

def check_winner
  for i in 0...8
  if (@wining_compositions[i] - @player1_array).empty?
     @winner = @player_1
  elsif(@wining_compositions[i] - @player2_array).empty?
    @winner = @player_2
  end
  @winner
end

def check_empty_space
  @cell.include?(integer)
end

def game_end
  return true if @winner != nil || check_empty_space == false
end
