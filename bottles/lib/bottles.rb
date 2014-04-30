require 'forwardable'
class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|i| verse(i)}.join("\n")
  end

  def verse(verse_number)
    Verse.new(verse_number).to_s
  end
end

class Verse
  extend Forwardable
  delegate [:quantity, :action, :name, :succ] => :bottlish_number
  attr_reader :bottlish_number

  def initialize(verse_number)
    @bottlish_number = verse_number.to_beersongbotnum
  end

  def to_s
    "#{bottlish_number} of beer on the wall, ".capitalize +
    "#{bottlish_number} of beer.\n" +
    "#{action}, " +
    "#{succ} of beer on the wall.\n"
  end
end

class BottleNumber
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
    number.pred.to_BottleNumber
  end

  def name
    'bottles'
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    "no more"
  end

  def succ
    99.to_BottleNumber
  end
end

class BottleNumber1 < BottleNumber
  def name
    'bottle'
  end
end

class BottleNumber6 < BottleNumber
  def name
    'six pack'
  end

  def quantity
    (number / 6).to_s
  end
end

class BeerSongBottleNumber
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

  def method_missing(msg, *args)
    bottlish_number.send(msg, args)
  end
end

class BeerSongBottleNumber1 < BeerSongBottleNumber
  def pronoun
    'it'
  end
end

class BeerSongBottleNumber0 < BeerSongBottleNumber
  def action
    "Go to the store and buy some more"
  end
end

class Fixnum
  def to_BottleNumber
    begin
      Object.const_get("BottleNumber#{self}")
    rescue
      BottleNumber
    end.new(self)
  end

  def to_beersongbotnum
    begin
      Object.const_get("BeerSongBottleNumber#{self}")
    rescue
      BeerSongBottleNumber
    end.new(self.to_BottleNumber)
  end
end