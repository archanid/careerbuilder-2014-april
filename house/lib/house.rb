class House

  def recite
    1.upto(12).map {|i| Foo.line(i)}.join("\n")
  end

  def random_recite
    1.upto(11).map {|i| Foo.random_line(i)}.join("\n")
  end

  def line(num)
    Foo.line(num)
  end
  
  def random_line(num)
    Foo.random_line(num)
  end
end

class Foo 
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def self.line(num)
    if num == 1
      "This is %s.\n" % [last_phrase]
    else
      "This is %s %s.\n" % [sequence_segments(num), last_phrase]
    end
  end
  
  def self.random_line(num)
    if num == 1
      "This is %s.\n" % [last_phrase]
    else
      "This is %s %s.\n" % [randomize_segments(num), last_phrase]
    end
  end

  def self.sequence_segments(num)
    segments.last(num-1).join(" ")
  end

  def self.randomize_segments(num)
    segments.shuffle.last(num-1).join(" ")
  end

  private

  def self.last_phrase
    "the house that Jack built"
  end

  def self.segments
    [ "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate", 
      "the malt that lay in"]
  end
end