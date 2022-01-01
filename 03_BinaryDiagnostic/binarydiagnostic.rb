# frozen_string_literal: true

# PART ONE

# Convert input to arrays of integers
INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).map { |n| n.each_char.map(&:to_i) }
# Compare sums on each bit index to get average bits as gamma
sum = INPUT.transpose.map { |n| n.sum / (INPUT.count * 0.5).ceil }

gam = sum.join.to_i(2)  # Gamma bits to decimal
eps = gam ^ 0xfff       # Epsilon is one's complement of gamma. Flip only 12 bits

puts "gamma   #{gam}"       # 3516
puts "epsilon #{eps}"       # 579
puts "power   #{gam * eps}" # 2035764

# PART TWO

oxy = INPUT.select { |n| n[0] == sum[0] } # First selections can already be done with first gamma bit
co2 = INPUT - oxy

(1..11).each do |i| # Next selections on next bits, for both oxygen and co2
  if oxy.count > 1          # Oxygen generator : select most common or 1 if equal
    avg = oxy.map { |n| n[i] }.sum / (oxy.count * 0.5).ceil
    oxy = oxy.select { |n| n[i] == avg }
  end
  next unless co2.count > 1 # CO2 scrubber : Select least common or 0 if equal

  avg = co2.map { |n| n[i] }.sum / (co2.count * 0.5).ceil
  co2 = co2.select { |n| n[i] == avg ^ 1 }
end

oxy = oxy[0].join.to_i(2) # Bits to decimal
co2 = co2[0].join.to_i(2)

puts "oxygen  #{oxy}"       # 3311
puts "co2     #{co2}"       # 851
puts "life    #{oxy * co2}" # 2817661
