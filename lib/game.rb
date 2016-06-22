class Game

  def welcome
    system('clear')
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

      while num == 0 || num > 100
        puts "Sorry? It's not that hard."
        puts display_guesses(guesses) unless guesses.empty?
        num = prompt
      end

      while guesses.include?(num)
        puts "Really? You already tried that."
        puts display_guesses(guesses)
        num = prompt
      end

      whoops = false
      guesses.each do |guess|
        diff_current = number - num
        diff_prev = number - guess
        if diff_current.abs > diff_prev.abs
          whoops = true
        end
      end
      puts "Wrong way! Don't waste your guesses!" if whoops

      response = check_guess(number, num, guesses)
      # system('clear')
      puts "You guessed #{num}: #{response}"
      break if response == "You got it!"
      puts display_guesses(guesses)
    end
    puts "You lose! The number was #{number}" unless response == "You got it!"
  end
end
