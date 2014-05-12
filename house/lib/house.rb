class House
  attr_reader :phrasing

  def initialize(phrasing=Phrasing.new(false))
    @phrasing = phrasing
  end

  def recite
    phrasing.sing
  end

  def random_recite
    phrasing.sing
  end

  def line(num)
    phrasing.line(num)
  end
end

class Phrasing
  attr_reader :random

  def initialize(random=false)
    @random = random
  end

  def sing
    1.upto(segments.length).map {|i| line(i)}.join("\n")
  end

  def line(num)
    "This is %s.\n" % segments.last(num).join(" ")
  end

  def segments
    if random
      segs.shuffle
    else
      segs
    end << "the house that Jack built"
  end

  private

  def segs
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