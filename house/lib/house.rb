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
    phrases
  end

  def create_phrases
    nouns.each_with_index.map {|n, i| [n, verbs[i]].join(" ")}
  end

  private

  def phrases
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

  def nouns
    [ "the horse and the hound and the horn that",
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
  end

  def verbs
    [ "belonged to", "kept", "woke", "married", "kissed", "milked", "tossed", "worried", "killed", "ate", "lay in" ]
  end
end

class RandomPhrasing < Phrasing
  def order_phrases
    phrases.shuffle
  end
end