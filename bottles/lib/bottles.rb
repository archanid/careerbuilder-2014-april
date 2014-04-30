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
  delegate [:quantity, :action, :name, :succ] => :bottlish_number
  attr_reader :bottlish_number

  def initialize(num)
    @bottlish_number = num.to_beersongbotnum
  end

  def to_s
    "#{bottlish_number.to_s.capitalize} of beer on the wall, " +
    "#{bottlish_number} of beer.\n" +
    "#{action}, " +
    # "#{succ.quantity} #{succ.name} of beer on the wall.\n"
    "#{succ} of beer on the wall.\n"
  end
end

class BottlishNumber
  extend Forwardable
  delegate [:to_beersongbotnum] => :number
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

  def succ
    number.pred.to_bottlishnumber
  end

  def name
    'bottles'
  end
end

class BottlishNumber0 < BottlishNumber
  def quantity
    "no more"
  end

  def succ
    99.to_bottlishnumber
  end
end

class BottlishNumber1 < BottlishNumber
  def name
    'bottle'
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

class BeerSongBottlishNumber
  extend Forwardable
  delegate [:quantity, :name] => :bottlish_number
  attr_reader :bottlish_number

  def initialize(bottlish_number)
    @bottlish_number = bottlish_number
  end

  def to_s
    "#{quantity} #{name}"
  end

  def succ
    bottlish_number.succ.to_beersongbotnum
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end
end

class BeerSongBottlishNumber1 < BeerSongBottlishNumber
  def pronoun
    'it'
  end
end

class BeerSongBottlishNumber0 < BeerSongBottlishNumber
  def action
    "Go to the store and buy some more"
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

  def to_beersongbotnum
    begin
      Object.const_get("BeerSongBottlishNumber#{self}")
    rescue
      BeerSongBottlishNumber
    end.new(self.to_bottlishnumber)
  end
end