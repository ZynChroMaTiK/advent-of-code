# frozen_string_literal: true

# New Array instance methods for lines
class Array
  # Get array of all numbers between array of 2 numbers
  def range
    self[0] < self[1] ? self[0].upto(self[1]).to_a : self[0].downto(self[1]).to_a
  end

  def ortho?
    self[0][0] == self[1][0] || self[0][1] == self[1][1]
  end

  # Get arrays of points of a line (array of 2 points)
  def points
    # Get ranges of xs and ys
    ps = transpose.map(&:range)
    # If one of the 2 ranges is a point
    return ps[1].map! { |p| [ps[0].first, p] } if ps[0].count == 1
    return ps[0].map! { |p| [p, ps[1].first] } if ps[1].count == 1

    # If line is diagonal
    ps.transpose
  end
end

# New Hash instance methods for counting danger zones
class Hash
  def regroup
    values.group_by(&:itself).transform_values!(&:count).values
  end
end

diagram1 = Hash.new(0)
diagram2 = Hash.new(0)

File.readlines("#{__dir__}/input.txt", chomp: true).each do |l|
  l = l.split(' -> ').map! { |p| p.split(',').map!(&:to_i) }
  l.points.each do |p|
    diagram1[p] += 1 if l.ortho?
    diagram2[p] += 1
  end
end

diagram1 = diagram1.regroup
diagram2 = diagram2.regroup
puts "P1- #{diagram1.drop(1).sum}" # 7297
puts "P2- #{diagram2.drop(1).sum}" # 21038
