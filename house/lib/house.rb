class House

  def recite
    sing(false)
  end

  def random_recite
    sing(true)
  end

  def sing(random=false)
    1.upto(segments(random).length).map {|i| line(i, random)}.join("\n")
  end

  def line(num, random=false)
    "This is %s.\n" % segments(random).last(num).join(" ")
  end

  def segments(random=false)
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

class Phrasing
  attr_reader :random

  def initialize(random=false)
    @random = random
  end

  def sing(random=false)
    1.upto(segments(random).length).map {|i| line(i, random)}.join("\n")
  end

  def line(num, random=false)
    "This is %s.\n" % segments(random).last(num).join(" ")
  end

  def segments(random=false)
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