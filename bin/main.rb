# frozen_string_literal: true

require_relative '../lib/game_logic'
class UserInterface
  attr_accessor :game
  attr_writer :again
  def initialize
    @game = GameLogic.new
  end
  def display
    @game.wining_compositions
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
      @game.player1 = gets.chomp.upcase

      break if @game.player1 == 'X' || @game.player1 == 'O'

      puts 'That is not a valid input'
    end
    @game.player2 = @game.player1 == 'X' ? 'O' : 'X'
    puts "Player1, Your Symbol is #{game.player1} and Player2, your symbol is #{game.player2}"
    @game.current_player = @game.player1
  end

  # this code gets where the user marks
  def get_mark
    loop do
      puts "Player, #{game.current_player}. Please choose a box that you want to mark"
      @game.mark = gets.chomp.to_i
      break if @game.cells.include?@game.mark
    end
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
    if @game.winner.nil?
      puts 'The game is draw'.center(50, '*')
    else
      puts "Congratulation,#{game.winner}. You win the game".center(50, '*')
    end
    puts '=' * 50
    puts '*' * 50
  end

  def play_again
    puts 'Do you want to play again? [y/n] ' .center(50, '*')
    @again = gets.chomp.upcase
    loop do
      break unless @again != "Y" && @again != "N"

      puts 'That is not a valid answer, please type y or n ' .center(50, '*')
      @again = gets.chomp.upcase
    end
    @again
  end

  def display_board
    cells = @game.cells
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
first = UserInterface.new
first.display_instructions
first.set_players
first.get_mark
first. end_message
first.display_board
first.play_again
