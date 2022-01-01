# Part One

INPUT = File.readlines("#{__dir__}/input.txt", chomp: true).reject(&:empty?)
draws = INPUT.shift.split(',').map(&:to_i)
boards = INPUT.each_slice(5).map { |b| b.map { |l| l.split.map(&:to_i) } }

class Array
  # BOARD - Marks drawn number in board
  def mark(draw)
    ri = index { |r| r.include?(draw) }
    return unless ri

    r = self[ri]
    r[r.index(draw)] = '*'
  end

  # ROW - Removes marked numbers for row counting or scoring
  def clean
    self - ['*']
  end

  # BOARD - Checks in board if at least one row or column is fully marked
  def win?
    rows_win = ->(b) { b.map(&:clean).reject(&:empty?).count != 5 }
    rows_win.call(self) || rows_win.call(transpose)
  end

  # BOARD - Calculates score of winning board
  def score(draw)
    map(&:clean).flatten.sum * draw
  end
end

winners = []

draws.each do |d|
  boards.each do |b|
    b.mark(d)
    winners << b.score(d) if b.win?
  end
end

puts winners.first
