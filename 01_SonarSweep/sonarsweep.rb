INPUT = File.readlines('input.txt').map(&:to_i)

puts "count #{INPUT.count}"
puts "first #{INPUT.first}"
puts "last  #{INPUT.last}"

larger1 = 0
larger2 = 0

# Part One
# Compare between each measurement and the next one
for i in 0..(INPUT.length - 2) do
  larger1 += 1 if INPUT[i] < INPUT[i+1]
end
puts "larger1 #{larger1}"

# Part Two
# No need to sum common elements between a window and the next one
# Compare between first of A and last of B, and so on
for i in 0..(INPUT.length - 4) do
  larger2 += 1 if INPUT[i] < INPUT[i+3]
end
puts "larger2 #{larger2}"
