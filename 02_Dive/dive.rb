# frozen_string_literal: true

x = y1 = y2 = a = 0

INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).each do |i| # Iteration on each input line
  d, u = i.split # Direction, Units
  u = u.to_i

  case d
  when 'forward'
    x += u      # P12
    y2 += u * a # P2
  when 'down'
    y1 += u     # P1
    a += u      # P2
  else # when 'up'
    y1 -= u     # P1
    a -= u      # P2
  end
end

puts "P1- #{x} * #{y1} = #{x * y1}" # 2272262
puts "P2- #{x} * #{y2} = #{x * y2}" # 2134882034
