class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, the_end)
    start.downto(the_end).map {|i| verse(i)}.join("\n")
  end

  def verse(num)
    Verse.new(num).verse
  end
end

class Verse
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def verse
    "#{quantity(n).capitalize} #{ewer(n)} of beer on the wall," + 
    " #{quantity(n)} #{ewer(n)} of beer.\n" + 
    "#{what_to_do}," + 
    " #{quantity(n-1)} #{ewer(n-1)} of beer on the wall.\n"
  end

  private

  def what_to_do
    if n == 0
      "Go to the store and buy some more"
    else
      "Take #{noun(n)} down and pass it around"
    end
  end

  def quantity(n)
    if n == -1
      99
    elsif n == 0
      "no more"
    else
      n
    end.to_s
  end

  def noun(n)
    if n == 1
      "it"
    else
      "one"
    end
  end

  def ewer(n)
    if n == 1
      "bottle"
    else
      "bottles"
    end
  end

end


# first strategy: when 2 and else are the closest to each other, so it would require the smallest difference change. make two changes, first the 2/num, then the bottle/s

# next: collapse them now that they're identical, then propagate changes. collapsing has higher priority. keep going.

# at this point, the code is more complex than what we started with.

# now we can look at all the conditionals. do they look the same? yes.

# new requirement: now we want to add six packs of beer!

# what's wrong? we're not fully using single responsibility principle: all the private methods are more about n than about bottles. this suggests that n ought to be a class and the methods should be class methods for that object. that way this bottles class will be closer to SRP. use the extract class refactoring strategy.

# think about cohesion. Song relies only on verses. verses only relies on verse. verse relies on all the private ones below.