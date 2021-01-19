VALID_CHOICES = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'Rock' && (second == 'Scissors' || second == 'Lizard')) ||
    (first == 'Paper' && (second == 'Rock' || second == 'Spock')) ||
    (first == 'Scissors' && (second == 'Paper' || second == 'Lizard')) ||
    (first == 'Lizard' && (second == 'Spock' || second == 'Paper')) ||
    (first == 'Spock' && (second == 'Scissors' || second == 'Rock'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a draw!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().capitalize()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice!")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  display_results(choice, computer_choice)

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  prompt("Do you want to play again? (y/n)")
  answer = Kernel.gets().chomp().downcase()
  break unless answer.start_with?('y')
end

prompt("Thank you for playing, good bye!")
