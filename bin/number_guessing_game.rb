class Game
  def welcome
    "Welcome to the Number Guessing Game."
  end

  def prompt
    # gets.chomp.to_i
    50 # test value
  end

  def random_number
    number = 50 # default for testing
    # number = rand(1..100)
  end

  def check_guess(number, guess, guesses)
    if guess > random_number
      guesses.push(guess)
      "Too high"
    elsif guess < random_number
      guesses.push(guess)
      "Too low"
    else
      "You got it!"
    end
  end

  def play(num)
    welcome
    guesses = []
    number = random_number
    check_guess(number, num, guesses)
    #loop here for guesses
  end
end


#method (prompt, count)
# too hi/lo/got it/too many guesses
