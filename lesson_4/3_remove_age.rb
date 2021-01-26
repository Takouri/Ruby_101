ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# new_arr, old_arr = ages.partition do |key, value|
#   value > 100
# end

# p old_arr.to_h

ages.keep_if { |name, _| name == 'Herman' }
p ages