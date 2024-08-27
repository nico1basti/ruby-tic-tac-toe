require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'turn.rb'
require_relative 'player.rb'

def play_game
  game = Game.new
  repeat_game
end


def repeat_game
  puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
  repeat_input = gets.chomp.downcase
  if repeat_input == 'y'
    play_game
  else
    puts 'Thanks for playing!'
  end
end

play_game