#!/usr/bin/env ruby
require_relative '../lib/gamelogic'
require_relative '../lib/players'
class UserInterface
  def initialize
    @again = nil
    @player = Players.new
    @game = GameLogic.new
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
    puts "\n"
  end

  # this code defines each players symbol-
  def set_players
    loop do
      puts 'Player1, which one would you like to take: X or O ?'
      @player.player1 = gets.chomp.upcase

      break if @player.player1 == 'X' || @player.player1 == 'O'

      puts 'That is not a valid input'
    end
    @player.player2 = @player.player1 == 'X' ? 'O' : 'X'
    puts "Player1, Your Symbol is #{@player.player1} and Player2, your symbol is #{@player.player2}"
    @player.current_player = @player.player1
  end

  # this code gets where the user marks
  def choose_mark
    puts "Player, #{@player.current_player}. Please choose a box that you want to mark"
    @player.mark = gets.chomp.to_i
    loop do
      break if @game.check_existance(@player.mark)

      if @player.check_invalid_input
        puts 'This is an invalid input Please select one of the remaining cells number'
      elsif !@game.check_existance(@player.mark)
        puts 'This cell is already marked please select new one'
      end
      @player.mark = gets.chomp.to_i
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
    if @player.winner.nil?
      puts 'The game is draw'.center(50, '*')
    else
      puts "Congratulation,#{@player.winner}. You win the game".center(50, '*')
    end
    puts '=' * 50
    puts '*' * 50
  end

  def play_again
    puts 'Do you want to play again? [y/n] ' .center(50, '*')
    @again = gets.chomp.upcase
    loop do
      break unless @again != 'Y' && @again != 'N'

      puts 'That is not a valid answer, please type y or n ' .center(50, '*')
      @again = gets.chomp.upcase
    end
    @again
  end

  def display_board
    cells = @game.cells
    puts '*' * 50
    puts '=' * 50
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ".center(40, ' ').center(50, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} ".center(40, ' ').center(50, '*')
    puts '----+----+----'.center(40, ' ').center(50, '*')
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} ".center(40, ' ').center(50, '*')
    puts '   |   |   '.center(40, ' ').center(50, '*')
    puts '*' * 50
    puts '*' * 50
    puts "\n"
  end

  def play_game
    display_instructions
    set_players
    until @game.game_end(@player.winner)
      choose_mark
      @player.store_mark
      @player.update_cell(@game.cells)
      display_board
      @player.check_winner(@game.wining_compositions)
      @player.change_players
    end
    winner_message
    play_again == 'Y' ? UserInterface.new.play_game : end_message
  end
end
UserInterface.new.play_game
