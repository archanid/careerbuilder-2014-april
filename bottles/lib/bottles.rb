class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, the_end)
    start.downto(the_end).map {|i| verse(i)}.join("\n")
  end

  def verse(num)
    Verse.new(kindofvariant(num)).to_s
  end

  private

  def kindofvariant(num)
    if num == 0
      Variant0.new(num)
    else
      Variant.new(num)
    end
  end
end

class Verse
  attr_reader :vh

  def initialize(vh)
    @vh = vh
  end

  def to_s
    "#{vh.current_quantity.capitalize} #{vh.current_ewer} of beer on the wall," + 
    " #{vh.current_quantity} #{vh.current_ewer} of beer.\n" + 
    "#{vh.what_to_do}," + 
    " #{vh.remaining_quantity} #{vh.remaining_ewer} of beer on the wall.\n"
  end
end

class Variant
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def what_to_do
    case n
    when 0
      "Go to the store and buy some more"
    else
      "Take #{noun} down and pass it around"
    end
  end

  def current_quantity
    case n
    when -1
      99
    else
      n
    end.to_s
  end

  def remaining_quantity
    case n
    when 1
      "no more"
    else
      n - 1
    end.to_s
  end

  def noun
    case n
    when 1
      "it"
    else
      "one"
    end
  end

  def current_ewer
    case n
    when 1
      "bottle"
    else
      "bottles"
    end
  end

  def remaining_ewer
    case n
    when 2
      "bottle"
    else
      "bottles"
    end
  end
end

class Variant0 < Variant
  def current_quantity
    "no more"
  end

  def remaining_quantity
    99.to_s
  end

  def what_to_do
    "Go to the store and buy some more"
  end
end

# first strategy: when 2 and else are the closest to each other, so it would require the smallest difference change. make two changes, first the 2/num, then the bottle/s

# next: collapse them now that they're identical, then propagate changes. collapsing has higher priority. keep going.

# at this point, the code is more complex than what we started with.

# now we can look at all the conditionals. do they look the same? yes.

# new requirement: now we want to add six packs of beer!

# what's wrong? we're not fully using single responsibility principle: all the private methods are more about n than about bottles. this suggests that n ought to be a class and the methods should be class methods for that object. that way this bottles class will be closer to SRP. use the extract class refactoring strategy.

# think about cohesion. Song relies only on verses. verses only relies on verse. verse relies on all the private ones below.

# Now extract class again.

# That worked. Now we can start to implement the new requirement.

# Make it open close to six pack by following SRP. Convert conditionals to polymorphism. Keep on doing SRP.

# Composition: Verse is composed of Variants
# Inheritance: Create Variant0