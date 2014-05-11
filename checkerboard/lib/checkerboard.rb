class Checkerboard

  def initialize(size)
  end

  def to_s
    rows = []

    row = []
    row << "B"
    row << "W"
    rows << row

    row = []
    row << "W"
    row << "B"
    rows << row

    rows.map {|row| row.join(" ") + "\n"}.join
  end

end