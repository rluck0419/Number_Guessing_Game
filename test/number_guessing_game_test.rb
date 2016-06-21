require 'minitest/autorun'
require 'minitest/pride'
require_relative '../bin/number_guessing_game.rb'

class NumberGuessingGameTest < MiniTest::Test
  def game
    ::Game.new
  end

  def test_game_exists
    assert game
  end

  def test_welcome_msg
    assert_equal "Welcome to the Number Guessing Game.", game.welcome
  end
end
