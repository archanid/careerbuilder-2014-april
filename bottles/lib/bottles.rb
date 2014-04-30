require 'forwardable'
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

class SuitableVariant
  def self.bottle_number_for(num)
    begin
      Object.const_get("BottlishNumber#{num}")
    rescue
      BottlishNumber
    end.new(num)
  end
end

class Verse
  extend Forwardable
  delegate [:quantity, :action, :name, :following] => :bottle_number
  attr_reader :num, :bottle_number, :ending_bottle_number

  def initialize(num)
    @bottle_number = SuitableVariant.bottle_number_for(num)
  end

  def to_s
    "#{quantity.capitalize} #{name} of beer on the wall, " +
    "#{quantity} #{name} of beer.\n" +
    "#{action}, " +
    "#{following.quantity} #{following.name} of beer on the wall.\n"
  end
end

class BottlishNumber
  attr_reader :bottle_number

  def initialize(number)
    @bottle_number = number
  end

  def quantity
    bottle_number.to_s
  end

  def following
    SuitableVariant.bottle_number_for(bottle_number.pred)
  end

  def name
    'bottles'
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end
end

class BottlishNumber0 < BottlishNumber
  def action
    "Go to the store and buy some more"
  end

  def quantity
    "no more"
  end

  def following
    SuitableVariant.bottle_number_for(99)
  end
end

class BottlishNumber1 < BottlishNumber
  def name
    'bottle'
  end

  def pronoun
    'it'
  end
end

class BottlishNumber6 < BottlishNumber
  def name
    'six pack'
  end

  def quantity
    (bottle_number / 6).to_s
  end
end