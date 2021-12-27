INPUT = File.readlines('input.txt').map(&:to_i)

puts "count #{INPUT.count}"
puts "first #{INPUT.first}"
puts "last  #{INPUT.last}"

larger = 0
for i in 0..(INPUT.length - 2) do

  larger += 1 if INPUT[i] < INPUT[i+1]
end
puts "larger #{larger}"
