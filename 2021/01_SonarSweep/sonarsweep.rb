# frozen_string_literal: true

INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).map(&:to_i)

# PART ONE : compare between each measurement and the next one
larger1 = 0
(0..(INPUT.length - 2)).each { |i| larger1 += 1 if INPUT[i] < INPUT[i + 1] }
puts "larger1 #{larger1}"

# PART TWO : compare between first of A and last of B, and so on
# No need to sum common elements between windows
larger2 = 0
(0..(INPUT.length - 4)).each { |i| larger2 += 1 if INPUT[i] < INPUT[i + 3] }
puts "larger2 #{larger2}"
