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
    "#{quantity.capitalize} #{name} of beer on the wall, " +
    "#{quantity} #{name} of beer.\n" +
    "#{action}, " +
    "#{quantity(num-1)} #{name(num-1)} of beer on the wall.\n"
  end

  private

  def quantity(bottle_number=self.num)
    case bottle_number
    when -1
      99.to_s
    when 0
      'no more'
    else
      bottle_number.to_s
    end
  end

  def name(bottle_number=self.num)
    case bottle_number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def action(bottle_number=self.num)
    case bottle_number
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(bottle_number)} down and pass it around"
    end
  end

  def pronoun(bottle_number=self.num)
    case bottle_number
    when 1
      'it'
    else
      'one'
    end
  end
end

class BottlishNumber
  attr_reader :bottle_number

  def initialize(number)
    @bottle_number = number
  end

  def quantity(bottle_number=self.num)
    case bottle_number
    when -1
      99.to_s
    when 0
      'no more'
    else
      bottle_number.to_s
    end
  end

  def name(bottle_number=self.num)
    case bottle_number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def action(bottle_number=self.num)
    case bottle_number
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(bottle_number)} down and pass it around"
    end
  end

  def pronoun(bottle_number=self.num)
    case bottle_number
    when 1
      'it'
    else
      'one'
    end
  end
end