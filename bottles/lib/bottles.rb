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

  def kindofvariant(n)
    case n
    when 0
      Variant0.new(n)
    when 1
      Variant1.new(n)
    when -1
      VariantNeg1.new(n)
    # when 2
    #   Variant2.new(n)
    else
      Variant.new(n)
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
    "Take #{noun} down and pass it around"
  end

  def current_quantity
    n.to_s
  end

  def remaining_quantity
    (n - 1).to_s
  end

  def noun
    "one"
  end

  def current_ewer
    "bottles"
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

class Variant1 < Variant
  def remaining_quantity
    "no more"
  end

  def noun
    "it"
  end

  def current_ewer
    "bottle"
  end
end

class VariantNeg1 < Variant
  def current_quantity
    99.to_s
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
# Inheritance: Create Variant1