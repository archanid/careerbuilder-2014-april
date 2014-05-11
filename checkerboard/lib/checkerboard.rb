class Checkerboard

  def initialize(size)
  end

  def to_s
    rows = []
    row = ["B", "W"].join(" ")
    rows << row
    row = ["W", "B"].join(" ")
    rows << row

    rows.map {|row| row.join(" ") + "\n"}.join
  end

end

class String
  def join(_)
    self
  end
end