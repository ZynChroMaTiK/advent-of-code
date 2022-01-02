# frozen_string_literal: true

# New Array instance methods for lines
class Array
  def range
    self[0] < self[1] ? self[0].upto(self[1]).to_a : self[0].downto(self[1]).to_a
  end

  def ortho?
    self[0][0] == self[1][0] || self[0][1] == self[1][1]
  end

  def points
    ps = transpose.map(&:range)
    return ps[1].map! { |p| [ps[0].first, p] } if ps[0].count == 1
    return ps[0].map! { |p| [p, ps[1].first] } if ps[1].count == 1

    ps.transpose
  end
end

diagram = Hash.new(0)

File.readlines("#{__dir__}/input.txt", chomp: true).each do |l|
  l = l.split(' -> ').map! { |p| p.split(',').map!(&:to_i) }
  l.points.each { |p| diagram[p] += 1 } if l.ortho?
end

diagram = diagram.values.group_by(&:itself).transform_values!(&:count)
puts diagram
