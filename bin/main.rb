# frozen_string_literal: true
require_relative '../lib/game_logic'
require_relative '../lib/board_players'

class Ui
  attr_reader :player1, :player2, :current_player, :mark, :again

  def intitialize
    @player1 = nil
    @player2 = nil
    @current_player = nil
  end

  def display_instructions
    puts '*' * 50
    puts 'Welcome To Our Tic-Tac-Toe Game!'.center(50, '*')
    puts '*' * 50
    puts '=' * 50
    puts 'RULES'.center(50, '*')
    puts 'Atmost, Two players can play this game'.center(46, ' ').center(50, '*')
    puts 'and they mark the 3x3 grid board.'.center(46, ' ').center(50, '*')
    puts 'The player who manages to place mark on'.center(46, ' ').center(50, '*')
    puts 'all three spaces of a horizontal,'.center(46, ' ').center(50, '*')
    puts 'vertical, or diagonal row wins the game.'.center(46, ' ').center(50, '*')
    puts 'When nobody is able to do so and no more'.center(46, ' ').center(50, '*')
    puts 'spaces remain on the board then the game'.center(46, ' ').center(50, '*')
    puts 'is considered as a draw. To place a mark on'.center(46, ' ').center(50, '*')
    puts 'the grid, type the number of an empty space'.center(46, ' ').center(50, '*')
    puts 'that you would like to mark. Good luck!'.center(46, ' ').center(50, '*')
    puts '*' * 50
    puts '=' * 50
    puts '*' * 50
  end

  # this code defines each players symbol-
  def set_players
    loop do
      puts 'Player1, which one would you like to take: X or O ?'
      @player1 = gets.chomp.upcase

      break if @player1 == 'X' || @player1 == 'O'

      puts 'That is not a valid input'
    end
    @player2 = @player1 == 'X' ? 'O' : 'X'
    puts "Player1, Your Symbol is #{@player1} and Player2, your symbol is #{@player2}"
    @current_player = @player1
  end

  # this code gets where the user marks
  def get_mark
    puts "Player, #{current_player}. Please choose a box that you want to mark"
    @mark = gets.chomp
    while board.is_available ==false
      puts "That cell has already been selected. Please choose new one."
      @mark = gets.chomp
    end
    # board logic needed for this one
  end

  def end_message
    puts '*' * 50
    puts '*' * 50
    puts 'Thank you for playing Tic-Tac-Toe'.center(50, '*')
    puts '*' * 50
    puts '*' * 50
  end

  def winner_message
    puts '*' * 50
    puts '=' * 50
    if game_logic.winner.nil?
      puts 'the game is a draw'.center(50, '*')
    else
      puts "#{winner} wins".center(50, '*')
    end
    puts '=' * 50
    puts '*' * 50
  end

  def play_again

    puts 'do you want to play again? [y/n] ' .center(50, '*')
    @again = gets.chomp.upcase
    loop do
      break unless @again != Y && @again != N

      puts 'that is not a valid answer, please type y or n ' .center(50, '*')
      @again = gets.chomp.upcase
    end
    @again
  end

  def display_board(cells)
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ".center(40, ' ').center(50, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} ".center(40, ' ').center(50, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} ".center(40, ' ').center(50, '*')
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts '*' * 50
    puts '*' * 50
  end
end
ui = Ui.new
players = Players.new
board = Board.new
game_logic = GameLogic.new
ui.display_instructions
ui.set_players
ui.display_board (board.cells)

until game_logic.game_end
  ui.get_mark
  players.store_mark
  board.update_cell
  ui.display_board
  game_logic.check_winner
  players.change_players
end
ui.winner_message
ui.end_message
