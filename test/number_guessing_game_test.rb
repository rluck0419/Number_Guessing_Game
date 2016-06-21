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

  def test_rand_number
    # skip # skip when number is actually generated; 50 is a default value
    assert_equal 50, game.random_number
  end

  def test_check_guess_got_it
    assert_equal "You got it!", game.play(50)
  end

  def test_check_guess_too_high
    assert_equal "Too high", game.play(75)
  end

  def test_check_guess_too_low
    assert_equal "Too low", game.play(25)
  end
end
