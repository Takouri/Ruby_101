# monthly_payment = 500.00
# puts "Your monthly payment is: $#{format('%.1f', monthly_payment)}"
def add_name(arr, name)
  arr.push(name)
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names