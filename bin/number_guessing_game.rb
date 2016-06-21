class Game
  def welcome
    "Welcome to the Number Guessing Game."
  end

  def prompt
    gets.chomp.to_i
  end

  def random_number
    number = 50 # default for testing
    # number = rand(1..100)
  end

  def play
    welcome
  end
end
