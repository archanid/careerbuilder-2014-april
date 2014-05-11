class Checkerboard

  def initialize(size)
  end

  def to_s
    rows = []
    rows << "B W"
    rows << "W B"
    
    ["B W", "W B"].map {|row| row + "\n"}.join
  end

end