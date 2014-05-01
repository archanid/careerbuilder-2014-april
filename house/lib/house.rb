class House

  def recite
    1.upto(segments.length+1).map {|i| line(i)}.join("\n")
  end

  def random_recite
    1.upto(segments.length).map {|i| random_line(i)}.join("\n")
  end

  def line(num)
    if num == 1
      "This is %s.\n" % [last_phrase]
    else
      "This is %s %s.\n" % [sequence_segments(num), last_phrase]
    end
  end
  
  def random_line(num)
    if num == 1
      "This is %s.\n" % [last_phrase]
    else
      "This is %s %s.\n" % [randomize_segments(num), last_phrase]
    end
  end

  private

  def sequence_segments(num)
    segments.last(num-1).join(" ")
  end

  def randomize_segments(num)
    segments.shuffle.last(num-1).join(" ")
  end

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