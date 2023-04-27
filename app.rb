require 'bundler'
Bundler.require


$:.unshift File.expand_path("./../lib", __FILE__)
require 'game'
require 'player'
require 'board'
require 'board_case'
#require 'show'


def perform
  game = Game.new
  game.turn
  while  game.again?
      game.board=Board.new
      game.turn
  end
  game.result
end

perform