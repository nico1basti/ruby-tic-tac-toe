class Turn 
  def initialize (player, board)
    @board = board
    @player = player
    puts "Its #{player.name}'s turn chosee between 0,1,2,3,4,5,6,7,8
    "
    choose_square
  end

  def choose_square 
    index_choosen = gets.chomp.to_i
    if check_choosen_index(index_choosen)
      @board.board_values[index_choosen] = @player.symbol
      @board.show_board
    else
      puts 'its either a wrong character or the square is already chosen'
      @board.show_board
      initialize @player, @board
    end
  end

  def check_choosen_index (index_choosen) 
    condition1 = @board.board_values[index_choosen] == index_choosen
    condition2 = /^[0-8]$/.match(index_choosen.to_s)
    total_condition = condition1 & condition2
  end
end