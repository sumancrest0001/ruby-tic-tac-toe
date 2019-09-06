class Players
  attr_accessor :player1, :player2, :current_player, :mark, :player1_array, :player2_array
  def initialize
    @player1_array = []
    @player2_array = []
  end
  def display_instructions
    puts "***************************************"
    puts "*** Welcome To My Tic-Tac-Toe Game! ***"
    puts "***************************************"
    puts "======================================="
    puts "**************** RULES ****************"
    puts "Atmost, Two players can play this game"
    puts "and they mark the3 x 3 grid board. "
    puts "The player who manage to place mark on "
    puts "all three spaces of a horizontal, vertical"
    puts ", or diagonal row wins the game."
    puts " When nobody is able to do so and no more"
    puts "spaces remain on the board then the game"
    puts "is considered as a draw.To place a mark on"
    puts "the grid, type the number of an empty space"
    puts "that you would like to mark. Good luck! \n "
  end

  def set_players
    loop do
      puts "Player1, which one would you like to take: X or O ?"
      @player1 = gets.chomp.upcase
      break if @player1 == "X" || @player1 == "O"
    end
    @player2 = player1 == "X" ? "O" : "X"
    puts "Player1, Your mark is #{player1} and Player2, your mark is #{@player2}"
    @current_player = @player1
  end

 def get_mark
   puts "#{current_player}, Please choose a box that you what to mark"
   @mark = gets.chomp
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
players1 = Players.new
players1.set_players
players1.get_mark
puts players1.store_mark
puts players1.change_players
