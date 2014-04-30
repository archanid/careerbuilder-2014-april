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

class Verse
  extend Forwardable
  delegate [:quantity, :action, :name, :following] => :bottle_number
  attr_reader :num, :bottle_number

  def initialize(num)
    @bottle_number = num.to_bottlishnumber
  end

  def to_s
    "#{quantity.capitalize} #{name} of beer on the wall, " +
    "#{quantity} #{name} of beer.\n" +
    "#{action}, " +
    "#{following.quantity} #{following.name} of beer on the wall.\n"
  end
end

class BottlishNumber
  extend Forwardable
  delegate [:to_beersongbottlishnumber] => :number
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity}"
  end

  def quantity
    number.to_s
  end

  def following
    number.pred.to_bottlishnumber
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
    99.to_bottlishnumber
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
    (number / 6).to_s
  end
end

class Fixnum
  def to_bottlishnumber
    begin
      Object.const_get("BottlishNumber#{self}")
    rescue
      BottlishNumber
    end.new(self)
  end

  def to_beersongbottlishnumber
    begin
      Object.const_get("BeerSongBottlishNumber#{self.to_bottlishnumber}")
    rescue
      BeerSongBottlishNumber
    end.new(self.to_bottlishnumber)
  end
end

class BeerSongBottlishNumber
  attr_accessor :bottlish_number
  
  def initialize(bottlish_number)

  end

  def to_s
    "#{quantity} #{name}"
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end
end