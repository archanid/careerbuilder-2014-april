class House

  def recite
    1.upto(12).map {|i| Foo.new(i).line}.join("\n")
  end

  def random_recite
    1.upto(11).map {|i| Foo.new(i).random_line}.join("\n")
  end

  def line(n)
    Foo.new(n).line
  end
  
  def random_line(n)
    Foo.new(n).random_line
  end
end

class Foo 
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def line
    case num
    when 1
      "This is %s.\n" % [last_phrase]
    else
      "This is %s %s.\n" % [sequence_segments, last_phrase]
    end
  end
  
  def random_line
    case num
    when 1
      "This is %s.\n" % [last_phrase]
    else
      "This is %s %s.\n" % [randomize_segments, last_phrase]
    end
  end

  def sequence_segments
    segments.last(num-1).join(" ")
  end

  def randomize_segments
    segments.shuffle.last(num-1).join(" ")
  end

  private

  def last_phrase
    "the house that Jack built"
  end

  def segments
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

class Variant

end