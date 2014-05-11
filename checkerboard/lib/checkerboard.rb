class Checkerboard
  attr_reader :size
  def initialize(size)
    @size = size
  end

  def to_s
    rows = []
    size.times {|y|
      row = []
      size.times {|x|
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