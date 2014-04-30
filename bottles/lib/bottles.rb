class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|i| verse(i)}.join("\n")
  end

  def verse(num)
    Verse.new(num).to_s
  end
end

class Verse
  attr_reader :num, :starting_bottle_number, :ending_bottle_number

  def initialize(num)
    @starting_bottle_number = BottlishNumber.new(num)
    @ending_bottle_number = BottlishNumber.new(num-1)
  end

  def to_s
    "#{starting_bottle_number.quantity.capitalize} #{starting_bottle_number.name} of beer on the wall, " +
    "#{starting_bottle_number.quantity} #{starting_bottle_number.name} of beer.\n" +
    "#{starting_bottle_number.action}, " +
    "#{ending_bottle_number.quantity} #{ending_bottle_number.name} of beer on the wall.\n"
  end
end

class BottlishNumber
  attr_reader :bottle_number

  def initialize(number)
    @bottle_number = number
  end

  def quantity
    case bottle_number
    when -1
      99.to_s
    when 0
      'no more'
    else
      bottle_number.to_s
    end
  end

  def name
    case bottle_number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def action
    case bottle_number
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    case bottle_number
    when 1
      'it'
    else
      'one'
    end
  end
end

class BottlishNumberZero < BottlishNumber

end