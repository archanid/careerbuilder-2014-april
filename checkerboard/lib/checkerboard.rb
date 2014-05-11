class Checkerboard

  def initialize(size)
  end

  def to_s
    ["B W", "W B"].map {|row| row + "\n"}.join
  end

end