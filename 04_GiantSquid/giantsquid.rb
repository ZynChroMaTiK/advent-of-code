# Part One

INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).reject(&:empty?)
draws = INPUT.shift.split(',').map(&:to_i)
boards = INPUT.each_slice(5).map { |b| b.map { |l| l.split.map(&:to_i) } }
