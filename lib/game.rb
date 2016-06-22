class Game

  def welcome
    system('clear')
    # for testing:
    "Welcome to the Number Guessing Game."
    #
    # puts "Welcome to the Number Guessing Game."
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

  def display_guesses(guessed_nums)
    guessed = guessed_nums.join(", ")
    "Guessed so far: #{guessed}"
  end

  def play(number = random_number)
    welcome
    guesses = []

    while guesses.length < 5
      num = prompt
      system('clear')
      puts "The Number Guessing Game"

      while guesses.include?(num)
        puts "\nReally? You already tried that.\n\n"
        puts display_guesses(guesses)
        num = prompt
        system('clear')
      end

      while num == 0 || num > 100
        puts "\nSorry? It's not that hard.\n\n"
        puts display_guesses(guesses) unless guesses.empty?
        num = prompt
        system('clear')
      end

      # this doesn't always work as intended
      # e.g. random number = 55
      # guess 1 = 50 - too low
      # guess 2 = 75 - too high
      # --> "wrong way" because difference 2 > difference 1 (20 > 5)
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
