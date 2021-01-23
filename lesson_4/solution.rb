def sum_even_number_row(row_number)
  # 1. Create an empty 'rows' array to contain all of the rows
  rows = []
  start_integer = 2
  # 2. Create a 'row' array and add it to the overall 'rows' array
  # 3. Repeat step 2 until all the necessary rows have been created
  #    1. All rows have been created when the length of the 'rows' array is equal to the input integer
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  # 4. Sum the final row
  rows = rows.last.sum
  # 5. Return the sum of the final row
  rows
end

def create_row(start_integer, row_length)
  # 1. Create an empty 'row' array to contain the integers
  row = []
  # Change the variable from start_integer to current_integer for clarity
  current_integer = start_integer
  # 2. Add the starting integer
  # 3. Increment the starting integer by 2 to get the next integer in the sequence
  # 4. Repeat steps 2 and 3 until the array has reached the correct length

  # Start the loop
  loop do
    #	-Add the start integer to the row
    row << current_integer
    #	-Increment the starting integer by 2
    current_integer += 2
    #	-Break out of the loop if length of row == row_length
    break if row.length == row_length
  end
  # 5. Return the 'row' array
  row
end

p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10 # true
p sum_even_number_row(4) == 68 # true

#  p create_row(2, 1) == [2] # true
#  p create_row(4, 2) == [4, 6] # true
# p create_row(14, 4) == [14, 16, 18, 20] # true

# 1. Create an empty 'row' array to contain the integers
# 2. Add the starting integer
# 3. Increment the starting integer by 2 to get the next integer in the sequence
# 4. Repeat steps 2 and 3 until the array has reached the correct length
# 5. Return the 'row' array