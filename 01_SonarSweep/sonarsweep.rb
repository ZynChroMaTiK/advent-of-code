INPUT = File.readlines('input.txt')

larger = 0
for i in 0..(INPUT.length - 2) do
  larger += 1 if INPUT[i] < INPUT[i+1]
end
puts larger
