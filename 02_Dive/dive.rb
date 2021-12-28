# frozen_string_literal: true

INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).map do |i|
  cmd = i.split
  [cmd[0], cmd[1].to_i]
end

# Part One
x = y = 0
INPUT.each do |i|
  x += i[1] if i[0] == 'forward'
  y += i[1] if i[0] == 'down'
  y -= i[1] if i[0] == 'up'
end
puts "x #{x}, y #{y}"
puts "x*y = #{x * y}"

# Part Two
a = x = y = 0
INPUT.each do |i|
  if i[0] == 'forward'
    x += i[1]
    y += i[1] * a
  end
  a += i[1] if i[0] == 'down'
  a -= i[1] if i[0] == 'up'
end
puts "x #{x}, y #{y}"
puts "x*y = #{x * y}"
