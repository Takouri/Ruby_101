# Welcome User
Kernel.puts("Welcome to the Calculator!")
# ask the user for two numbers
Kernel.puts("What is the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What is the second number?")
number2 = Kernel.gets().chomp()

# ask the user for an operation to perform
Kernel.puts("What operation would you like to perform? 1) Add 2) Subtract 3) Multiply 4) Divide")
operator = Kernel.gets().chomp()
# perform the operation on the two numbers
if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end
# output the result
Kernel.puts("The result is #{result}")