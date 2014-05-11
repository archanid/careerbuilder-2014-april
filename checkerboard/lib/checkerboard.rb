class Checkerboard

  def initialize(size)
  end

  def to_s
    rows = []


    2.times {|y|

      row = []
      if y == 0
        row << "B"
        row << "W"
      else
        row << "W"
        row << "B"
      end
      rows << row
    }
    rows.map {|row| row.join(" ") + "\n"}.join
  end

end