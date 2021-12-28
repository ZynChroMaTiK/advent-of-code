# Part One

# Convert input to arrays of integers
INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).map { |n| n.each_char.map(&:to_i) }
# Compare sums on each bit index to get average bits as gamma
sum = INPUT.transpose.map { |n| n.sum / (INPUT.count / 2) }
# Gamma bits to decimal
gam = sum.join.to_i(2)
# Epsilon is one's complement of gamma
eps = gam ^ 0xfff # Flip only 12 bits

puts "gamma   #{gam}"
puts "epsilon #{eps}"
# Power consumption is gamma * epsilon
puts "power   #{gam * eps}"


# Part Two

# First selections can already be done with first gamma bit
oxy = INPUT.select {|n| n[0] == sum[0] }
co2 = INPUT - oxy
# Next selections on next bits, for both oxygen and co2
(1..11).each do |i|
  # Oxygen generator
  if oxy.count > 1
    oxy_ct = oxy.count
    hlf = (oxy_ct / 2.0).ceil
    sum = oxy.map {|n| n[i]}.sum
    # Select most common or 1 if equal
    avg = (sum == hlf && hlf * 2 == oxy_ct) ? 1 : sum / hlf
    oxy = oxy.select { |n| n[i] == avg }
  end
  # CO2 scrubber
  if co2.count > 1
    co2_ct = co2.count
    hlf = (co2_ct / 2.0).ceil
    sum = co2.map {|n| n[i]}.sum
    # Select least common or 0 if equal
    avg = (sum == hlf && hlf * 2 == co2_ct) ? 1 : sum / hlf
    co2 = co2.select { |n| n[i] == avg ^ 1 }
  end
end
# Bits to decimal
oxy = oxy[0].join.to_i(2)
co2 = co2[0].join.to_i(2)

puts "oxygen  #{oxy}"
puts "co2     #{co2}"
# Life support is oxygen * co2
puts "life    #{oxy * co2}"
