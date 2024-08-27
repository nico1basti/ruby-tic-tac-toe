class Game 
  attr_accessor :player1
  def initialize
    puts '
    Game starts!
    '
    enter_players
    @board = Board.new
    play_turn
  end
  
  def enter_players
    puts 'insert player1 name:'
    player1_name = gets.chomp
    puts 'choose player1 symbol between x and o'
    player1_symbol = gets.chomp
    puts 'insert player2 name:'
    player2_name = gets.chomp
    puts 'choose player2 symbol between x and o'
    player2_symbol = gets.chomp
    @player1 = Player.new player1_name, player1_symbol
    @player2 = Player.new player2_name, player2_symbol
    
  end

  def play_turn
    until board_full?
      Turn.new @player1, @board
      break if @board.game_over? @player1
      Turn.new @player2, @board
      break if @board.game_over? @player2
    end

    puts "End of Game"
  end

  def board_full? 
    @board.board_values.all? do |value| 
      value.to_s !~ /^[0-8]$/
    end
  end

end