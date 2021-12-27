INPUT = File.readlines("#{__dir__}/input.txt").map do |i|
  cmd = i.split
  {dir: cmd[0], stp: cmd[1].to_i}
end

puts INPUT.first
