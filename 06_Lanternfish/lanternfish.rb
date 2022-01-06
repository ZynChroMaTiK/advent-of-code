days = 80
fishes = File.read("#{__dir__}/input.txt").strip.split(',').map(&:to_i)

days.times do
  pregs = fishes.count(0)
  fishes.map! { |f| f == 0 ? 6 : f - 1 }
  fishes += [8] * pregs
end

p fishes.count
