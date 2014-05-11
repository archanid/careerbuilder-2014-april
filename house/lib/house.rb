class House

  def recite
    1.upto(12).map {|i| line(i, false)}.join("\n")
  end

  def random_recite
    1.upto(12).map {|i| line(i, true)}.join("\n")
  end

  def line(num, random=false)
    "This is %s.\n" % segments(random).last(num).join(" ")
  end

  private

  def random_lines(num)
    shuffled_array(0, num-2).map {|i| segments[i]}.join(" ")
  end

  def shuffled_array(lower_bound, upper_bound)
    lower_bound.upto(upper_bound).map {|i| i}.shuffle
  end

  def segments(random=false)
    if random
      segs.shuffle
    else
      segs
    end << "the house that Jack built"
  end

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