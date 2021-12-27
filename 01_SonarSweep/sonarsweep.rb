# frozen_string_literal: true

INPUT = File.readlines("#{__dir__}/input.txt").map(&:to_i)

# Part One
# Compare between each measurement and the next one
larger1 = 0
(0..(INPUT.length - 2)).each { |i| larger1 += 1 if INPUT[i] < INPUT[i + 1] }
puts "larger1 #{larger1}"

# Part Two
# No need to sum common elements between a window and the next one
# Compare between first of A and last of B, and so on
larger2 = 0
(0..(INPUT.length - 4)).each { |i| larger2 += 1 if INPUT[i] < INPUT[i + 3] }
puts "larger2 #{larger2}"
