# Part One

# Convert input to arrays of integers
INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).map { |l| l.each_char.map(&:to_i) }
# Compare sums on each bit index to get average bits as gamma
avg = INPUT.count / 2
gam = INPUT.transpose.map { |l| l.sum / avg}.join.to_i(2)
# Epsilon is one's complement of gamma
eps = gam ^ 0xfff # Flip only 12 bits
# Power consumption is gamma * epsilon
pow = gam * eps
puts "gamma   #{gam}"
puts "epsilon #{eps}"
puts "power   #{pow}"

#Part Two
