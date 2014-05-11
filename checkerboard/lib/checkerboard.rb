class Checkerboard

  def initialize(size)
  end

  def to_s
    rows = []


    2.times {|y|

      row = []

      2.times {|x|
        if (x+y).even?
          row << "B"
        else
          row << "W"
        end
      }
      rows << row
    }
    rows.map {|row| row.join(" ") + "\n"}.join
  end

end