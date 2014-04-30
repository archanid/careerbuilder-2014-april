class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|i| verse(i)}.join("\n")
  end

  def verse(num)
    Verse.new(num).verse(num)
  end
end


class Verse
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def verse(num)
    "#{quantity.capitalize} #{container} of beer on the wall, " +
    "#{quantity} #{container} of beer.\n" +
    "#{action}, " +
    "#{quantity(num-1)} #{container(num-1)} of beer on the wall.\n"
  end

  private

  def quantity(num=self.num)
    case num
    when -1
      99.to_s
    when 0
      'no more'
    else
      num.to_s
    end
  end

  def container(num=self.num)
    case num
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def action(num=self.num)
    case num
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(num)} down and pass it around"
    end
  end

  def pronoun(num=self.num)
    case num
    when 1
      'it'
    else
      'one'
    end
  end
end