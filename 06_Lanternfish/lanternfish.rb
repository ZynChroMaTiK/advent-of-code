# frozen_string_literal: true

fishes = File.read("#{__dir__}/input.txt").strip.split(',').map(&:to_i)

# Part One

def p1_spawn(fishes, days)
  fishes = fishes.dup
  days.times do
    pregs = fishes.count(0)
    fishes.map! { |f| f.zero? ? 6 : f - 1 }
    fishes += [8] * pregs
  end
  fishes.count
end

p p1_spawn(fishes, 80)

# Part Two

# Define a math function instead of a loop to get same results
