class House
  attr_reader :phrasing

  def initialize(phrasing=Phrasing.new)
    @phrasing = phrasing
  end

  def recite
    phrasing.recite
  end

  def line(num)
    phrasing.line(num)
  end
end

class Phrasing
  def recite
    1.upto(get_phrases.length).map {|i| line(i)}.join("\n")
  end

  def line(num)
    "This is %s.\n" % get_phrases.last(num).join(" ")
  end

  def get_phrases
    order_phrases << "the house that Jack built"
  end

  def order_phrases
    create_phrases
  end

  def create_phrases
    NOUNS.zip(VERBS).map {|n, v| [n, v].join(" ")}
  end

  private

  NOUNS = [ "the horse and the hound and the horn that",
    "the farmer sowing his corn that",
    "the rooster that crowed in the morn that",
    "the priest all shaven and shorn that",
    "the man all tattered and torn that",
    "the maiden all forlorn that",
    "the cow with the crumpled horn that",
    "the dog that",
    "the cat that",
    "the rat that",
    "the malt that"]

  VERBS = [ "belonged to", "kept", "woke", "married", "kissed", "milked", "tossed", "worried", "killed", "ate", "lay in" ]
end

class SuperRandomPhrasing < Phrasing
  def create_phrases
    NOUNS.shuffle.zip(VERBS.shuffle).map {|n, v| [n, v].join(" ")}
  end
end

class RandomPhrasing < Phrasing
  def order_phrases
    create_phrases.shuffle
  end
end