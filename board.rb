class Board
  attr_accessor :board_values
  def initialize
    @WINNER_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    @board_values = Array.new(9)
    @board_values.each_with_index do |value, index|
      @board_values[index] = index
    end
    show_board
  end

  def show_board 
    s_board_values = board_values.map do |value|
      new_value = /^[0-8]$/.match(value.to_s) ?  "  #{value.to_s}  " : " -#{value}- "
    end
    puts <<-HEREDOC

      #{s_board_values[0]}|#{s_board_values[1]}|#{s_board_values[2]}
      -----+-----+-----
      #{s_board_values[3]}|#{s_board_values[4]}|#{s_board_values[5]}
      -----+-----+-----
      #{s_board_values[6]}|#{s_board_values[7]}|#{s_board_values[8]}

    HEREDOC
  end

  def game_over? (player)
    @WINNER_COMBINATIONS.each do |combination|
      condition = @board_values.values_at(*combination).all? {|value| value == player.symbol}
      if condition 
        select_winner(player)
        return true
      end
    end
    return false
  end

  def select_winner (player)
    puts "The winner is #{player.name}"
  end
end