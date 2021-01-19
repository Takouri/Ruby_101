# we will need 3 pieces of input
#   loan amount
#   APR
#   loan duration

# need to calculate
#   monthly interest rate
#   loan duration in months
#   monthly payment

# method for all prompts
def prompt(message)
  puts "=> #{message}"
end

# method for converting the years/months to just months
def get_months(years, months)
  if years > 0
    (years * 12) + months
  elsif years > 0 && months == 0
    years * 12
  else
    months
  end
end

# method for getting the monthly interest rate
def get_monthly_rate(apr)
  (apr / 100) / 12
end

# method for monthly payments
def get_monthly_payments(loan, interest, months)
  loan * (interest / (1 - (1 + interest)**(-months)))
end

# method for validating numbers
def valid_number?(input)
  /^-?\d+$/.match(input)
end

# Welcome the user
prompt('Welcome to the Mortgage or Car Loan Calculator,
        please give us your name:')
# initiate name variable and set it to empty
name = ''
# validate name with loop and Capitalize their name
loop do
  name = gets.chomp.capitalize

  if name.empty?()
    prompt('Make sure to give a valid name.')
  else
    break
  end
end
# welcome the user
prompt("Welcome, #{name}")
# Create program loop for multiple calcualtions
loop do
  # Create a loop for the user to re-enter information if they made a mistake
  duration_years = ''
  duration_months = ''
  apr = ''
  loan_amount = ''
  duration_years = ''
  duration_months = ''

  loop do
    # Ask how much the loan is for
    loan_amount = ''
    loop do
      prompt("Please give loan amount")
      loan_amount = gets.chomp

      if valid_number?(loan_amount)
        loan_amount = loan_amount.to_i
        break
      else
        prompt("Please put a valid number")
      end
    end
    # Ask for the APR
    prompt('And what is the APR?')
    # apr = gets.chomp.to_f
    loop do
      apr = Kernel.gets().chomp()

      if apr.empty?() || apr.to_f() < 0
        prompt("Must enter positive number.")
      else
        apr = apr.to_f()
        break
      end
    end
    # Ask for the loan duration need 2 different inputs for years and months
    duration_prompt = <<-MSG
    Now we need the duration of the loan
    in years and months. First, how many
    years is the loan for?
    MSG
    prompt(duration_prompt)

    loop do
      duration_years = Kernel.gets().chomp()

      if duration_years.empty?() || duration_years.to_i() < 0
        prompt("Enter a valid number")
      else
        duration_years = duration_years.to_i()
        break
      end
    end
    prompt("And months?")

    loop do
      duration_months = Kernel.gets().chomp()

      if duration_months.empty?() || duration_months.to_i() < 0
        prompt("Enter a valid number")
      else
        duration_months = duration_months.to_i()
        break
      end
    end

    all_inputs_prompt = <<-MSG
    #{name}, thank you - 
    So, you have a loan for $#{loan_amount}.
    Your APR is #{apr}%.
    And the duration is for #{duration_years} years, and #{duration_months} months.
    Is this information correct?
    MSG
    prompt(all_inputs_prompt)
    correct_info_answer = gets.chomp
    break unless correct_info_answer.downcase().start_with?('n')
  end

  month_total = get_months(duration_years, duration_months)
  monthly_interest_rate = get_monthly_rate(apr)
  monthly_payments = get_monthly_payments(loan_amount,
                                          monthly_interest_rate,
                                          month_total)
  puts "Your monthly payment will be #{monthly_payments.round(2)}"
  # Ask User if they would like to do another calculation
  prompt('Do you have another loan you would like to calculate? (Y/N)')
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end
puts "Thank you for using the Loan Calculator #{name}"
