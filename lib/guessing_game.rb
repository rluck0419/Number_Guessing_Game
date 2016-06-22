class Game

  def welcome
    puts "Welcome to the Number Guessing Game."
  end

  def prompt
    print "Please enter a number 1-100: > "
    gets.chomp.to_i
    # 50 # test value
  end

  def random_number
    rand(1..100)
  end

  def check_guess(actual_number, guessed_number, guesses_array)
    if guessed_number > actual_number
      guesses_array.push(guessed_number)
      "Too high"
    elsif guessed_number < actual_number
      guesses_array.push(guessed_number)
      "Too low"
    else
      "You got it!"
    end
  end

  def play(number = random_number)
    welcome
    guesses = []

    while guesses.length < 5
      num = prompt
      response = check_guess(number, num, guesses)
      puts response
      break if response == "You got it!"
    end
  end
end
