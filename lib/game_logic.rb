# frozen_string_literal: true

class GameLogic
  attr_reader :player1_array, :player2_array, :wining_compositions, :cells, :winner
  attr_accessor :player1, :player2, :current_player, :mark
  def initialize
    @wining_compositions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @winner = nil
    @player1 = nil
    @player2 = nil
    @current_player = nil
    @player1_array = []
    @player2_array = []
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def check_winner
    (0...8).each do |i|
      if (@wining_compositions[i] - @player1_array).empty?
        @winner = @player1
      elsif (@wining_compositions[i] - @player2_array).empty?
        @winner = @player2
      end
    end
    @winner
  end

  def check_empty_space
    @cells.any?(Integer)
  end

  def game_end
    return true if !@winner.nil? || check_empty_space == false
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

class UserInterface
  attr_reader :game
  def initialize
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
      @game.player1 = gets.chomp.upcase

      break if @game.player1 == 'X' || @game.player1 == 'O'

      puts 'That is not a valid input'
    end
    @game.player2 = @game.player1 == 'X' ? 'O' : 'X'
    puts "Player1, Your Symbol is #{game.player1} and Player2, your symbol is #{game.player2}"
    @game.current_player = @game.player1
  end

  # this code gets where the user marks
  def choose_mark

      puts "Player, #{game.current_player}. Please choose a box that you want to mark"
      @game.mark = gets.chomp.to_i
      loop do
      break if @game.cells.include? @game.mark
      if(@game.mark >9 || @game.mark < 1)
        puts 'This is an invalid input Please select one of the rremaining cells number'
      end
        if (@game.cells.include? @game.mark) == false
          puts 'This cell is already marked please select new one'
        end
        @game.mark = gets.chomp.to_i
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
    display_board
    set_players
    until @game.game_end
      choose_mark
      @game.store_mark
      @game.update_cell
      display_board
      @game.check_winner
      @game.change_players
    end
    winner_message
    play_again == 'Y' ? UserInterface.new.play_game : end_message
  end
end
UserInterface.new.play_game
