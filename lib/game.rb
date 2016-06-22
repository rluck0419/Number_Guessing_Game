class Game

  def welcome
    system('clear')
    # previously for testing:
    # "Welcome to the Number Guessing Game."
    make_header
    puts "\nWelcome to the Number Guessing Game.\nCan you guess the secret number?\n\n"
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

  def make_header
    # "The Number Guessing Game."
    puts "The Number Guessing Game."
  end

  def display_guesses(guessed_nums)
    guessed = guessed_nums.join(", ")
    "Guessed so far: #{guessed}"
  end

  def guessed_already
    puts "\nReally? You already tried that.\n\n"
    puts display_guesses(guesses)
  end

  def invalid_input
    puts "\nSorry? It's not that hard.\n\n"
    puts display_guesses(guesses) unless guesses.empty?
  end

  def play(number = random_number)
    welcome
    guesses = []

    while guesses.length < 5
      num = prompt
      system('clear')
      make_header

      while guesses.include?(num)
        guessed_already
        num = prompt
        system('clear')
      end

      while num == 0 || num > 100
        invalid_input
        num = prompt
        system('clear')
      end

      whoops = false
      guesses.each do |guess|
        diff_current = number - num
        diff_prev = number - guess
        if diff_current > 0 && diff_prev > 0
          if diff_current > diff_prev
            whoops = true
          end
        elsif diff_current < 0 && diff_prev < 0
          if diff_current < diff_prev
            whoops = true
          end
        end
      end
      print "Wasting your guesses, huh?" if whoops

      response = check_guess(number, num, guesses)
      # system('clear')
      puts "\nYou guessed #{num}: #{response}\n\n"
      break if response == "You got it!"
      puts display_guesses(guesses)
    end
    puts "You lose! The number was #{number}" unless response == "You got it!"
  end
end
