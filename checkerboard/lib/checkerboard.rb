class Checkerboard

  def initialize(size)
  end

  def to_s
    rows = []


    2.times {|y|

      row = []

      2.times {|x|
        if y == 0
          if x == 0
            row << "B"
          else
            row << "W"
          end
        else
          if x == 0
            row << "W"
          else
            row << "B"
          end
        end
      }
      rows << row
    }
    rows.map {|row| row.join(" ") + "\n"}.join
  end

end