# frozen_string_literal: true

class Players
  attr_accessor :player1, :player2, :mark, :current_player, :winner
  def initialize
    @player1_array = []
    @player2_array = []
  end

  def check_winner(compositions)
    (0...8).each do |i|
      if (compositions[i] - @player1_array).empty?
        @winner = @player1
      elsif (compositions[i] - @player2_array).empty?
        @winner = @player2
      end
    end
    @winner
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

  def update_cell(cell)
    cell[@mark - 1] = @current_player
  end
  
  def check_invalid_input
    @mark > 9 || @mark < 1
  end
end
